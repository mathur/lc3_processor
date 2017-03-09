import lc3b_types::*;

module id_datapath (
    input clk
);

mux2 #(.width(3)) destmux
(
    .sel(destmux_sel),
    .a(dest),
    .b(3'b111),
    .f(destmux_out)
);

mux2 #(.width(3)) storemux
(
    .sel(storemux_sel),
    .a(sr1),
    .b(dest),
    .f(storemux_out)
);

regfile rfile
(
    .clk(clk),
    .load(load_regfile),
    .in(regfilemux_out),
    .src_a(storemux_out),
    .src_b(sr2),
    .dest(destmux_out),
    .reg_a(sr1_out),
    .reg_b(sr2_out)
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

control_gen controls
(
    // nothing
);

// NEEDED?
// mux2 #(.width(3)) bubble
// (
//     .sel(),
//     .a(),
//     .b(),
//     .f()
// );

endmodule : id_datapath