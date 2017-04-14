import lc3b_types::*;

module if_datapath (
    input clk,

    // memory
    input logic resp_a,
    input logic [15:0] rdata_a,
	input logic [15:0] trap_mem,
	input logic br_en,
	input logic jmp_jsr_en,
	input logic trap_en,
	input logic b11,
	input lc3b_word pc_br_in,
	input lc3b_word sr1_data_in,
    input logic [2:0] pcmux_sel,
	input logic stall,

    // logic signals
    output lc3b_word pc_out, instruction,
    output lc3b_reg src1, src2, dest,
    output logic read_a,
    output logic [15:0] address_a
);

lc3b_word pc_plus2_out, pcmux_out;
logic [2:0] pcmux_sel_internal;
logic pc_load;

always_comb
begin
    address_a = pc_out;
    read_a = 1'b1;

    if(br_en || trap_en || jmp_jsr_en) begin
        pc_load = 1'b1;
	 end else if(stall) begin
		pc_load = 1'b0;
	 end else begin
		pc_load = resp_a;
	 end

    if(br_en) begin
	   pcmux_sel_internal = 3'b001;
	end
	else if(trap_en) begin
		pcmux_sel_internal = 3'b100;
	end
	else if (jmp_jsr_en) begin
		if(b11)
			pcmux_sel_internal = 3'b001;	//JMP/RET always have a b11 of 0, so defaults to loading to registers
		else
			pcmux_sel_internal = 3'b010;
	end
	else begin
		pcmux_sel_internal = pcmux_sel;
	end
end

ir ir_unit (
    .clk(clk),
	.resp(resp_a),
    .load(pc_load && resp_a && ~stall),
    .in(rdata_a),
    .dest(dest),
    .src1(src1),
    .src2(src2),
	.instruction(instruction)
);

mux8 pcmux
(
    .sel(pcmux_sel_internal),
    .a(pc_plus2_out),
    .b(pc_br_in),
    .c(sr1_data_in),
    .d(rdata_a),
    .e(trap_mem),
	.f(16'b0),
	.g(16'b0),
	.h(16'b0),
	.i(pcmux_out)
);

register pc
(
    .clk(clk),
    .load(pc_load),
    .in(pcmux_out),
    .out(pc_out)
);

plus2 pc_plus2
(
    .in(pc_out),
    .enable(pc_load && resp_a && ~stall),
    .out(pc_plus2_out)
);

endmodule : if_datapath
