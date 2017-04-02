import lc3b_types::*;

module if_datapath (
    input clk,

    // memory
    input logic resp_a,
    input logic [15:0] rdata_a,
	input logic br_en,
	input lc3b_word pc_br_in,
	input lc3b_word sr1_data_in,
    input logic [1:0] pcmux_sel,
	 input logic stall,

    // logic signals
    output lc3b_word pc_out, instruction,
    output lc3b_reg src1, src2, dest,
    output logic read_a,
    output logic [15:0] address_a
);

lc3b_word pc_plus2_out, pcmux_out;
logic [1:0] pcmux_sel_internal;
logic load;

always_comb
begin
    address_a = pc_out;
    read_a = 1'b1;

     if(br_en) begin
        load = 1'b1;
	 end else if(stall) begin
		load = 1'b0;
	 end else begin
		load = resp_a;
	 end

    if (br_en) begin
        pcmux_sel_internal = 2'b01;
    end else begin
        pcmux_sel_internal = pcmux_sel;
    end
end

ir ir_unit (
    .clk(clk),
    .load(load),
    .in(rdata_a),
    .dest(dest),
    .src1(src1),
    .src2(src2),
	 .instruction(instruction)
);

mux4 pcmux
(
    .sel(pcmux_sel_internal),
    .a(pc_plus2_out),
    .b(pc_br_in),
    .c(sr1_data_in),
    .d(rdata_a),
    .f(pcmux_out)
);

register pc
(
    .clk(clk),
    .load(load),
    .in(pcmux_out),
    .out(pc_out)
);

plus2 pc_plus2
(
    .in(pc_out),
    .out(pc_plus2_out)
);

endmodule : if_datapath