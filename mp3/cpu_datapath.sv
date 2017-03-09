import lc3b_types::*;

module cpu_datapath
(
    input clk,
    /* control signals */
    input [1:0] pcmux_sel,
    input load_pc,
	 input storemux_sel,
	 input load_ir,
	 input [2:0] marmux_sel,
	 input load_mar,
	 input [1:0] mdrmux_sel,
	 input load_mdr,
	 input load_regfile,
	 input [1:0] alumux_sel,
	 input lc3b_aluop alu_op,
	 input [2:0] regfilemux_sel,
	 input load_cc,
	 input br_addmux_sel,
	 input destmux_sel,
	 output jsr_mode,
 	 output br_en, 
    /* declare more ports here */
	 input lc3b_word mem_rdata,
	 output lc3b_word mem_address,
	 output lc3b_word mem_wdata,
	 output lc3b_opcode opcode,
	 output logic imm_mode,
	 output logic stb_mode
);

/* declare internal signals */
lc3b_word pcmux_out;
lc3b_word mdr_out;
lc3b_word pc_out;
lc3b_word br_add_out;
lc3b_word pc_plus2_out;
lc3b_word adj9_out;
lc3b_word adj6_out;
lc3b_word adj6ns_out;
lc3b_word sr1_out, sr2_out;
lc3b_word regfilemux_out;
lc3b_word alu_out;
lc3b_word marmux_out;
lc3b_word mdrmux_out;
lc3b_word alumux_out;
lc3b_word adj5_out;
lc3b_word adj11_out;
lc3b_word br_addmux_out;
lc3b_word zext_8_out;

lc3b_reg sr1, sr2, dest, storemux_out, cc_out, destmux_out;

lc3b_offset9 offset9;
lc3b_offset6 offset6;
lc3b_offset11 offset11;

lc3b_nzp gencc_out;
lc3b_offset5 offset5;

logic [7:0] trap_vector;
lc3b_word trap_zext_out;

logic shift_a;
logic shift_d;
logic [3:0] ir_imm4;
lc3b_word shift_out;

lc3b_byte ldbmux_out;
lc3b_word ldb_zext_out;


/*
 * PC
 */
mux4 pcmux
(
    .sel(pcmux_sel),
    .a(pc_plus2_out),
    .b(br_add_out),
    .c(sr1_out),
	 .d(mdr_out),
    .f(pcmux_out)
);

mux2 #(.width(3)) storemux
(
	.sel(storemux_sel),
	.a(sr1),
	.b(dest),
	.f(storemux_out)
);


register pc
(
    .clk(clk),
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);


ir ir_unit
(
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

adjns #(.width(5)) adj5
(
	.in(offset5),
	.out(adj5_out)
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

mux2 #(.width(3)) destmux
(
	.sel(destmux_sel),
	.a(dest),
	.b(3'b111),
	.f(destmux_out)
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

udjns zext_8
(
	.in(mdr_out[7:0]),
	.out(zext_8_out)
);

shiftunit sunit
(
	.a(shift_a),
	.d(shift_d),
	.sr(sr1_out),
	.imm4(ir_imm4),
	.f(shift_out)
);

mux8 regfilemux
(
    .sel(regfilemux_sel),
    .a(alu_out),
    .b(mdr_out),
    .c(br_add_out),
    .d(pc_out),
    .e(zext_8_out),
    .f(shift_out),
    .g(ldb_zext_out),
    .h(16'b0),
    .i(regfilemux_out)
);

mux3 mdrmux
(
    .sel(mdrmux_sel),
    .a(alu_out),
    .b(mem_rdata),
	 .c(sr1_out << 8),
    .f(mdrmux_out)
);

udj trap_zext
(
	.in(trap_vector),
	.out(trap_zext_out)
);


// when the cache really hits
mux2 #(.width(8)) ldbmux
(
	.sel(mem_address[0]),
	.a(mdr_out[7:0]),
	.b(mdr_out[15:8]),
	.f(ldbmux_out)
);


udjns ldbzext
(
	.in(ldbmux_out),
	.out(ldb_zext_out)
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

plus2 plus_2
(
	.in(pc_out),
	.out(pc_plus2_out)
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

assign mem_wdata = mdr_out;
assign stb_mode = mem_address[0];

endmodule : cpu_datapath