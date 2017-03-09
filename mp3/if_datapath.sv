import lc3b_types::*;

module if_datapath (
    input clk
);

ir ir_unit (
    .clk(clk),
    .load(load_ir),
    .in(mdr_out),
    .opcode(opcode),
    .dest(dest),
    .src1(sr1),
    .src2(sr2),
    .offset6(offset6),
    .offset9(offset9),
    .offset5(offset5),
    .offset11(offset11),
    .jsr_mode(jsr_mode),
    .imm_mode(imm_mode),
    .trap_vector(trap_vector),
    .imm4(ir_imm4),
    .a(shift_a),
    .d(shift_d)
);

plus2 plus_2
(
    .in(pc_out),
    .out(pc_plus2_out)
);

register pc
(
    .clk(clk),
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
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

endmodule : if_datapath