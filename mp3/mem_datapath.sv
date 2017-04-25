import lc3b_types::*;

module mem_datapath (
    input clk,
    input lc3b_control_word ctrl,
    input lc3b_word alu_out, pc_out, br_add_out, sr1_out, sr2_out, instruction,
    input lc3b_reg dest,

    // memory
    input logic resp_b,
    input logic [15:0] rdata_b,
    output logic read_b,
    output logic write_b,
    output logic [1:0] wmask_b,
    output logic [15:0] address_b,
    output logic [15:0] wdata_b,

    output lc3b_word regfilemux_out, trap_mem,
    output logic br_en, jmp_jsr_en, trap_en, b11, 
	 output logic stall, flush,

    // counters
    input logic br_count_reset, br_mispredict_count_reset,
    input logic mem_stall_count_reset,
    output lc3b_word br_count, br_mispredict_count,
    output lc3b_word mem_stall_count
);

lc3b_word trap_zext_out, marmux_out, mdrmux_out, zext_8_out, shift_out, ldb_zext_out, stbmux_out, indirect_addr;
logic [7:0] ldbmux_out;
lc3b_nzp gencc_out, cc_out;
logic br_en_internal, i_sig, ireg;
logic [2:0] internal_marmux_sel, internal_mdrmux_sel;
assign    i_sig = (ctrl.opcode == op_ldi || ctrl.opcode == op_sti);
assign stall = (((read_b|| write_b) && (~resp_b)) || (~ireg && i_sig));

lc3b_word branch_counter, branch_mispredict_counter, mem_stall_counter;
assign br_count = branch_counter;
assign br_mispredict_count = branch_mispredict_counter;
assign mem_stall_count = mem_stall_counter;

initial
begin
    branch_counter = 16'b0;
    branch_mispredict_counter = 16'b0;
    mem_stall_counter = 16'b0;
end

always_ff @(posedge clk)
begin
    if(br_count_reset == 1'b1) begin
        branch_counter = 16'b0;
    end else if(ctrl.opcode == op_br && (instruction != 16'b0)) begin
        branch_counter = branch_counter + 1'b1;
    end else begin
        branch_counter = branch_counter;
    end

    if(br_mispredict_count_reset == 1'b1) begin
        branch_mispredict_counter = 16'b0;
    end else if(br_en == 1'b1) begin
        branch_mispredict_counter = branch_mispredict_counter + 1'b1;
    end else begin
        branch_mispredict_counter = branch_mispredict_counter;
    end

    if(mem_stall_count_reset == 1'b1) begin
        mem_stall_counter = 16'b0;
    end else if(stall == 1'b1) begin
        mem_stall_counter = mem_stall_counter + 1'b1;
    end else begin
        mem_stall_counter = mem_stall_counter;
    end
end

always_comb
begin
	 if(br_en_internal && (ctrl.opcode == op_br)) begin
		flush = 1'b1;
	   br_en = 1'b1;
	 end else begin
		flush = 1'b0;
	   br_en = 1'b0;
	 end

	 if(ctrl.opcode == op_jsr || ctrl.opcode == op_jmp)
		jmp_jsr_en = 1;
	 else
		jmp_jsr_en = 0;
	 b11 = instruction[11]; //JMP/RET: 1100 000 REG 000000 so B11 is always 0 for JMP/RET

	 if(ctrl.opcode == op_trap && resp_b == 1) begin
		trap_en = 1;
		trap_mem = rdata_b;
	 end
	 else begin
		trap_en = 0;
		trap_mem = 16'b0;
	 end

    if((ctrl.opcode == op_stb) && (address_b[0] == 1)) begin
        wmask_b = 2'b10;
    end
    else if((ctrl.opcode == op_stb) && (address_b[0] == 0)) begin
        wmask_b = 2'b01;
    end
    else begin
        wmask_b = ctrl.mem_byte_enable;
    end

	 if(~ireg && (ctrl.opcode == op_ldi || ctrl.opcode == op_sti))
		internal_marmux_sel = 3'b000;
	 else if(ireg)
		internal_marmux_sel = 3'b101;
	 else
		internal_marmux_sel = ctrl.marmux_sel;

	 if(~ireg && (ctrl.opcode == op_sti)) begin
		write_b = 0;
		read_b = 1;
	 end
	 else if(ireg && (ctrl.opcode == op_sti)) begin
		write_b = 1;
		read_b = 0;
	 end
	 else begin
		write_b = ctrl.mem_write;
		read_b = ctrl.mem_read;
	 end

	 if(~ireg && ctrl.opcode == op_sti)
		internal_mdrmux_sel = 3'b000;
	 else if(ireg && ctrl.opcode == op_sti)
		internal_mdrmux_sel = 3'b011;
	 else
		internal_mdrmux_sel = ctrl.mdrmux_sel;
end

mux8 marmux
(
    .sel(internal_marmux_sel),
    .a(alu_out),
    .b(pc_out),
    .c(br_add_out),
    .d(rdata_b),
    .e(trap_zext_out),
    .f(indirect_addr),
    .g(16'b0),
    .h(16'b0),
    .i(address_b)
);

mux2 #(.width(16)) stbmux
(
    .sel(address_b[0]),
    .a(sr2_out),
    .b(sr2_out << 8),
    .f(stbmux_out)
);

mux8 mdrmux
(
    .sel(internal_mdrmux_sel),
    .a(alu_out),
    .b(rdata_b),
    .c(sr1_out << 8),
	.d(sr2_out),
    .e(stbmux_out),
    .f(16'b0),
    .g(16'b0),
    .h(16'b0),
    .i(wdata_b)
);

gencc gen_cc
(
    .in(regfilemux_out),
    .out(gencc_out)
);

register #(.width(3)) cc
(
    .clk(clk),
    .load(ctrl.load_cc),
    .in(gencc_out),
    .out(cc_out),
    .flush(1'b0)
);

mux2 #(.width(8)) ldbmux
(
    .sel(address_b[0]),
    .a(rdata_b[7:0]),
    .b(rdata_b[15:8]),
    .f(ldbmux_out)
);

shiftunit sunit
(
    .a(instruction[5]),
    .d(instruction[4]),
    .sr(sr1_out),
    .imm4(instruction[3:0]),
    .f(shift_out)
);

udjns zext_8
(
    .in(rdata_b[7:0]),
    .out(zext_8_out)
);

udj trap_zext
(
    .in(instruction[7:0]),
    .out(trap_zext_out)
);

udjns ldbzext
(
    .in(ldbmux_out),
    .out(ldb_zext_out)
);

benable cccomp
(
    .n(cc_out[2]),
    .nr(dest[2]),
    .z(cc_out[1]),
    .zr(dest[1]),
    .p(cc_out[0]),
    .pr(dest[0]),
    .enable(br_en_internal)
);

mux8 regfilemux
(
    .sel(ctrl.regfilemux_sel),
    .a(alu_out),
    .b(rdata_b),
    .c(br_add_out),
    .d(pc_out),
    .e(zext_8_out),
    .f(shift_out),
    .g(ldb_zext_out),
    .h(16'b0),
    .i(regfilemux_out)
);

register #(.width(1)) indirect_reg
(
    .clk(clk),
    .load(resp_b),
    .in(~ireg && i_sig),
    .out(ireg),
    .flush(1'b0)
);

register #(.width(16)) indirect_addr_reg
(
    .clk(clk),
    .load(resp_b && i_sig),
    .in(rdata_b),
    .out(indirect_addr),
    .flush(1'b0)
);

endmodule : mem_datapath
