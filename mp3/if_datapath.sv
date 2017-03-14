import lc3b_types::*;

module if_datapath (
    input clk,

    // memory
    input logic resp_a,
    input logic [15:0] rdata_a,
    output read_a,
    output [15:0] address_a,

    // stalling
    input logic stall,

    // logic signals
    input  [1:0] pcmux_sel,
    output lc3b_word pc_out, instruction,
    output lc3b_reg src1, src2, dest
);

lc3b_word pc_plus2_out, pcmux_out;

always_comb
begin
    read_a = ~stall;
    address_a = pc_out;
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
    .sel(pcmux_sel),
    .a(pc_plus2_out),
    .b(16'b0), // br add out
    .c(16'b0), // sr1 out
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