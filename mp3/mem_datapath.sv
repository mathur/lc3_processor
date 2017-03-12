import lc3b_types::*;

module mem_datapath (
    input clk
);

mux8 marmux
(
    .sel(marmux_sel),
    .a(alu_out),
    .b(pc_out),
    .c(br_add_out),
    .d(mdr_out),
    .e(trap_zext_out),
    .f(16'b0),
    .g(16'b0),
    .h(16'b0),
    .i(marmux_out)
);

register mar
(
    .clk(clk),
    .load(load_mar),
    .in(marmux_out),
    .out(mem_address)
);


register mdr
(
    .clk(clk),
    .load(load_mdr),
    .in(mdrmux_out),
    .out(mdr_out)
);

mux2 #(.width(8)) ldbmux
(
    .sel(mem_address[0]),
    .a(mdr_out[7:0]),
    .b(mdr_out[15:8]),
    .f(ldbmux_out)
);

shiftunit sunit
(
    .a(shift_a),
    .d(shift_d),
    .sr(sr1_out),
    .imm4(ir_imm4),
    .f(shift_out)
);

gencc gen_cc
(
    .in(regfilemux_out),
    .out(gencc_out)
);

register #(.width(3)) cc
(
    .clk(clk),
    .load(load_cc),
    .in(gencc_out),
    .out(cc_out)
);

benable cccomp
(
    .n(cc_out[2]),
    .nr(dest[2]),
    .z(cc_out[1]),
    .zr(dest[1]),
    .p(cc_out[0]),
    .pr(dest[0]),
    .enable(br_en)
);

endmodule : mem_datapath