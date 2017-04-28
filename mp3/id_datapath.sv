import lc3b_types::*;

module id_datapath (
    input clk,

    /* Control Input */
    input lc3b_word inst,

    /* Control Output */
    output lc3b_control_word ctrl,

    /* Data Inputs */
    input lc3b_reg dest,
    input lc3b_reg sr1,
    input lc3b_reg sr2,
    input lc3b_reg wb_dest_addr,
    input lc3b_word wb_dest_data,
    input logic wb_load_dest,

    /* Data Outputs */
    output lc3b_reg destmux_out,
    output lc3b_word sr1_out,
    output lc3b_word sr2_out
);

// Only need this here because we are generating the control signal
// at this stage
lc3b_control_word internal_ctrl;
lc3b_reg storemux_out;
lc3b_reg storemux_out_two;

mux2 #(.width(3)) destmux
(
    .sel(internal_ctrl.destmux_sel),
    .a(dest),
    .b(3'b111),
    .f(destmux_out)
);

mux2 #(.width(3)) storemux
(
    .sel(internal_ctrl.storemux_sel),
    .a(sr1),
    .b(dest),
    .f(storemux_out)
);

mux2 #(.width(3)) storemux_two
(
    .sel(internal_ctrl.storemux_sel_two),
    .a(sr2),
    .b(dest),
    .f(storemux_out_two)
);

regfile rfile
(
    .clk(clk),
    .load(wb_load_dest),
    .in(wb_dest_data),
    .src_a(storemux_out),
    .src_b(storemux_out_two),
    .dest(wb_dest_addr),
    .reg_a(sr1_out),
    .reg_b(sr2_out)
);

control_rom controls
(
    .inst(inst),
    .ctrl(internal_ctrl)
);

assign ctrl = internal_ctrl;

endmodule : id_datapath