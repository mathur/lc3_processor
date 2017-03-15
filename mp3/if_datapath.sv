import lc3b_types::*;

module if_datapath (
    input clk,

    // memory
    input logic resp_a,
    input logic [15:0] rdata_a,
    output logic read_a,
    output logic [15:0] address_a,

    // stalling
    input logic stall,
	 input logic br_en,

	 
	 input lc3b_word pc_br_in,
	 input lc3b_word sr1_data_in,

    // logic signals
    input  logic [1:0] pcmux_sel,
    output lc3b_word pc_out, instruction,
    output lc3b_reg src1, src2, dest
);

lc3b_word pc_plus2_out, pcmux_out;
logic [1:0] pcmux_sel_internal;

always_comb
begin
    read_a = ~stall;
    address_a = pc_out;
	 if(br_en)
	 begin
		pcmux_sel_internal = 2'b01;
	 end
	 else
	 begin
		pcmux_sel_internal = pcmux_sel;
	 end
end

ir ir_unit (
    .clk(clk),
    .load(read_a),
    .in(rdata_a),
    .instruction(instruction),
    .dest(dest),
    .src1(src1),
    .src2(src2)
);

mux4 pcmux
(
    .sel(pcmux_sel_internal),
    .a(pc_plus2_out),
    .b(pc_br_in), // br add out
    .c(sr1_data_in), // sr1 out
    .d(rdata_a),
    .f(pcmux_out)
);

register pc
(
    .clk(clk),
    .load(read_a),
    .in(pcmux_out),
    .out(pc_out)
);

plus2 plus_2
(
    .in(pc_out),
    .out(pc_plus2_out)
);

endmodule : if_datapath