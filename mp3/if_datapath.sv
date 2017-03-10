import lc3b_types::*;

module if_datapath (
    input clk
);

ir ir_unit (
    .clk(clk),
    .load(load_ir),
    .in(mdr_out),
    .instruction(instruction),
    .dest(dest),
    .src1(sr1),
    .src2(sr2)
);

mux4 pcmux
(
    .sel(pcmux_sel),
    .a(pc_plus2_out),
    .b(br_add_out),
    .c(sr1_out),
    .d(mdr_out),
    .f(pcmux_out)
);

register pc
(
    .clk(clk),
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);

plus2 plus_2
(
    .in(pc_out),
    .out(pc_plus2_out)
);

endmodule : if_datapath