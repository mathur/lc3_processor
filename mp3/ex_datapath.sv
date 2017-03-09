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

adjns #(.width(5)) adj5
(
    .in(offset5),
    .out(adj5_out)
);

adj #(.width(6)) adj6
(
    .in(offset6),
    .out(adj6_out)
);

adjns #(.width(6)) adj6ns
(
    .in(offset6),
    .out(adj6ns_out)
);

adj #(.width(9)) adj9
(
    .in(offset9),
    .out(adj9_out)
);

adj #(.width(11)) adj11
(
    .in(offset11),
    .out(adj11_out)
);

udjns zext_8
(
    .in(mdr_out[7:0]),
    .out(zext_8_out)
);

udj trap_zext
(
    .in(trap_vector),
    .out(trap_zext_out)
);

udjns ldbzext
(
    .in(ldbmux_out),
    .out(ldb_zext_out)
);

// MISSING ALL FORWARDING UNIT STUFF

endmodule : ex_datapath