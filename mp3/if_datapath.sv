import lc3b_types::*;

module if_datapath (
    input clk,
    input stall,
    input pcmux_sel,
    output lc3b_word instruction,
    output lc3b_register src1, src2, dest
);

ir ir_unit (
    .clk(clk),
    .load(~stall),
    .in(),
    .instruction(instruction),
    .dest(dest),
    .src1(sr1),
    .src2(sr2)
);

mux4 pcmux
(
    .sel(pcmux_sel),
    .a(pc_plus2_out),
    .b(),
    .c(),
    .d(),
    .f(pcmux_out)
);

register pc
(
    .clk(clk),
    .load(~stall),
    .in(pcmux_out),
    .out(pc_out)
);

plus2 plus_2
(
    .in(pc_out),
    .out(pc_plus2_out)
);

endmodule : if_datapath