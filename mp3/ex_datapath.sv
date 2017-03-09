import lc3b_types::*;

module ex_datapath (
    input clk
);

mux2 br_add_mux
(
    .sel(br_addmux_sel),
    .a(adj9_out),
    .b(adj11_out),
    .f(br_addmux_out)
);

badder #(.width(16)) br_add
(
    .a(br_addmux_out),
    .b(pc_out),
    .f(br_add_out)
);

mux4 alumux
(
    .sel(alumux_sel),
    .a(sr2_out),
    .b(adj6_out),
     .c(adj5_out),
     .d(adj6ns_out),
    .f(alumux_out)
);

alu alu_unit
(
    .aluop(alu_op),
    .a(sr1_out),
    .b(alumux_out),
    .f(alu_out)
);

// MISSING ALL FORWARDING UNIT STUFF

endmodule : ex_datapath