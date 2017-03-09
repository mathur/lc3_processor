import lc3b_types::*;

module id_datapath (
    input clk,

    /* Control Inputs */
    input load_regfile,

    /* Data Inputs */
    input lc3b_reg dest,
    input lc3b_reg sr1,
    input lc3b_reg sr2,
    input lc3b_reg wb_dest_addr,
    input lc3b_word wb_dest_data, 

    /* Data Outputs */
    output lc3b_reg destmux_out
    output lc3b_word sr1_out,
    output lc3b_word sr2_out
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
    .in(wb_dest_data),
    .src_a(storemux_out),
    .src_b(sr2),
    .dest(wb_dest_mux),
    .reg_a(sr1_out),
    .reg_b(sr2_out)
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