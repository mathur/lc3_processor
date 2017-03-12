import lc3b_types::*;

module ex_datapath (
    input clk,
    input lc3b_word ex_src1_data_in, ex_src2_data_in, ex_dest_data_in,
    input lc3b_word ex_instruction_in, 
    input lc3b_word ex_pc_in, 
    output lc3b_word ex_alu_out, ex_br_out 
);

lc3b_control_word ex_ctrl;
lc3b_word adj5_out, adj6_out, adj6ns_out, adj9_out, adj11_out, br_addmux_out, alumux_out;

control_rom ex_control
(
    .inst(ex_instruction_in),
    .ctrl(ex_ctrl)
);

mux2 br_add_mux
(
    .sel(ex_ctrl.br_addmux_sel),
    .a(adj9_out),
    .b(adj11_out),
    .f(br_addmux_out)
);

badder #(.width(16)) br_add
(
    .a(br_addmux_out),
    .b(ex_pc_in),
    .f(ex_br_out)
);

mux4 alumux
(
    .sel(ex_ctrl.alumux_sel),
    .a(ex_src2_data_in),
    .b(adj6_out),
    .c(adj5_out),
    .d(adj6ns_out),
    .f(alumux_out)
);

alu alu_unit
(
    .aluop(ex_ctrl.alu_op),
    .a(ex_src1_data_in),
    .b(alumux_out),
    .f(ex_alu_out)
);

adjns #(.width(5)) adj5
(
    .in(ex_instruction_in[4:0]),
    .out(adj5_out)
);

adj #(.width(6)) adj6
(
    .in(ex_instruction_in[5:0]),
    .out(adj6_out)
);

adjns #(.width(6)) adj6ns
(
    .in(ex_instruction_in[5:0]),
    .out(adj6ns_out)
);

adj #(.width(9)) adj9
(
    .in(ex_instruction_in[10:0]),
    .out(adj9_out)
);

adj #(.width(11)) adj11
(
    .in(ex_instruction_in[11:0]),
    .out(adj11_out)
);


/*
    TADAS: 
    Don't think we need these yet, if even in EX

udjns zext_8
(
    .in(ex_mdr_in[7:0]),
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

*/

// MISSING ALL FORWARDING UNIT STUFF

endmodule : ex_datapath