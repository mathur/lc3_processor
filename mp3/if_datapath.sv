import lc3b_types::*;

module if_datapath (
    input clk,

    // memory
    input logic resp_a,
    input logic [15:0] rdata_a,
	input logic br_en,
	input lc3b_word pc_br_in,
	input lc3b_word sr1_data_in,
    input  logic [1:0] pcmux_sel,

    // logic signals
    output lc3b_word pc_out, instruction,
    output lc3b_reg src1, src2, dest,
    output logic read_a,
    output logic [15:0] address_a,
    output logic stall
);

lc3b_word pc_plus2_out, pcmux_out;
logic [1:0] pcmux_sel_internal;

always_comb
begin
    read_a = 1'b1;
    address_a = pc_out;

    if(resp_a == 1'b1) begin
        stall = 1'b0;
    end else begin
        stall = 1'b1;
    end

	if(br_en) begin
	   pcmux_sel_internal = 2'b01;
	end else begin
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
    .b(pc_br_in - 2),
    .c(sr1_data_in),
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