import lc3b_types::*;

module cpu_datapath
(
    input clk,

    /* Port A */
    input logic resp_a,
    input logic [15:0] rdata_a,
    output read_a,
    output write_a,
    output [1:0] wmask_a,
    output [15:0] address_a,
    output [15:0] wdata_a,

    /* Port B */
    input logic resp_b,
    input logic [15:0] rdata_b,
    output read_b,
    output write_b,
    output [1:0] wmask_b,
    output [15:0] address_b,
    output [15:0] wdata_b
);

lc3b_word if_pc, if_instruction;
lc3b_reg if_src1, if_src2, if_dest;

lc3b_reg if_id_src1, if_id_src2, if_id_dest;
lc3b_word if_id_pc, if_id_instruction;

lc3b_control_word id_ctrl_data;
lc3b_reg id_dest;
lc3b_word id_src1_data, id_src2_data;

lc3b_control_word id_ex_ctrl;
lc3b_reg id_ex_src1, id_ex_src2, id_ex_dest;
lc3b_word id_ex_instruction, id_ex_pc, id_ex_src1_data, id_ex_src2_data;

lc3b_control_word ex_mem_ctrl;
lc3b_reg ex_mem_src1, ex_mem_src2, ex_mem_dest;
lc3b_word ex_alu_out, ex_br_out, ex_mem_instruction, ex_mem_alu, ex_mem_pc, ex_mem_pc_br, ex_mem_src1_data, ex_mem_src2_data;

logic mem_br_en, mem_trap_en, mem_jmp_jsr_en, b11, stall_mem;
lc3b_word dest_data;

lc3b_control_word mem_wb_ctrl;
lc3b_reg mem_wb_src1, mem_wb_src2, mem_wb_dest;
lc3b_word mem_wb_instruction, mem_wb_alu, mem_wb_pc, mem_wb_pc_br, mem_wb_src1_data, mem_wb_src2_data, mem_wb_dest_data, mem_wb_mar, mem_wb_mdr;
logic mem_wb_br, mem_b11, flush_mem;
lc3b_word trap_mem;

assign wmask_a = 2'b11;
assign write_a = 1'b0;
assign wdata_a = 16'b0;

logic [1:0] forward_a_mux_sel, forward_b_mux_sel;
logic [1:0] id_forward_a_mux_sel, id_forward_b_mux_sel;

lc3b_word id_forward_a_data;
lc3b_word id_forward_b_data;

logic wb_mem_forward_a, wb_mem_forward_b;
logic [15:0] wb_mem_forward_a_data, wb_mem_forward_b_data;

logic leap_frog_data_sel, leap_frog_reg_sel, leap_frog_write_sel;

lc3b_word leap_frog_data_out;
lc3b_reg leap_frog_reg_out;
logic leap_frog_write_out;
logic stall_pass_override;
logic mem_load_cc_s;

if_datapath if_data
(
    .clk(clk),
    .resp_a(resp_a),
    .rdata_a(rdata_a),
    .trap_mem(trap_mem),
    .br_en(mem_br_en),
    .jmp_jsr_en(mem_jmp_jsr_en),
    .trap_en(mem_trap_en),
    .b11(mem_b11),
    .pc_br_in(ex_mem_pc_br),
    .sr1_data_in(wb_mem_forward_a_data),
    .pcmux_sel(ex_mem_ctrl.pcmux_sel),

    .pc_out(if_pc),
    .instruction(if_instruction),
    .src1(if_src1),
    .src2(if_src2),
    .dest(if_dest),
    .read_a(read_a),
    .address_a(address_a),
    .stall(stall_mem),
    .flush(flush_mem)
);

buffer if_id_buf
(
    .clk(clk),
    .load(~stall_mem),
    .flush(flush_mem),
    .src1_in(if_src1),
    .src2_in(if_src2),
    .dest_in(if_dest),
    .instruction_in(if_instruction),
    .pc_in(if_pc),

    .src1_out(if_id_src1),
    .src2_out(if_id_src2),
    .dest_out(if_id_dest),
    .instruction_out(if_id_instruction),
    .pc_out(if_id_pc)
);


mux2 #(.width(16)) leap_frog_data (
    .sel(leap_frog_data_sel),
    .a(mem_wb_dest_data),
    .b(ex_alu_out),
    .f(leap_frog_data_out)
);

mux2 #(.width(3)) leap_frog_reg (
    .sel(leap_frog_reg_sel),
    .a(mem_wb_dest),
    .b(id_ex_dest),
    .f(leap_frog_reg_out)
);

mux2 #(.width(1)) leap_frog_write (
    .sel(leap_frog_reg_sel),
    .a(mem_wb_ctrl.load_regfile),
    .b(id_ex_ctrl.load_regfile),
    .f(leap_frog_write_out)
);

id_datapath id
(
    .clk(clk),

    /* Control Input */
    .inst(if_id_instruction),

    /* Control Output */
    .ctrl(id_ctrl_data),

    /* Data Inputs */
    .dest(if_id_dest),
    .sr1(if_id_src1),
    .sr2(if_id_src2),

    // TODO: From WB
    .wb_dest_addr(leap_frog_reg_out),
    .wb_dest_data(leap_frog_data_out),
    .wb_load_dest(leap_frog_write_out),

    /* Data Outputs */
    .destmux_out(id_dest),
    .sr1_out(id_src1_data),
    .sr2_out(id_src2_data)
);

mux3 #(.width(16)) mem_to_id_sr1 (
    .sel(id_forward_a_mux_sel),
    .a(id_src1_data),
    .b(dest_data),
	 .c(mem_wb_dest_data),
    .f(id_forward_a_data)
);

mux3 #(.width(16)) mem_to_id_sr2 (
    .sel(id_forward_b_mux_sel),
    .a(id_src2_data),
    .b(dest_data),
	 .c(mem_wb_dest_data),
    .f(id_forward_b_data)
);

buffer id_ex_buf
(
    .clk(clk),
    .load(~stall_mem),
    .flush(flush_mem),
    .src1_in(if_id_src1),
    .src2_in(if_id_src2),
    .dest_in(id_dest),
    .instruction_in(if_id_instruction),
    .pc_in(if_id_pc),
    .src1_data_in(id_forward_a_data),
    .src2_data_in(id_forward_b_data),
    .ctrl_in(id_ctrl_data),

    .ctrl_out(id_ex_ctrl),
    .src1_out(id_ex_src1),
    .src2_out(id_ex_src2),
    .dest_out(id_ex_dest),
    .instruction_out(id_ex_instruction),
    .pc_out(id_ex_pc),
    .src1_data_out(id_ex_src1_data),
    .src2_data_out(id_ex_src2_data)
);

ex_datapath ex
(
    .clk(clk),

    //INPUTS: Data, Instruction, PC
    .ex_src1_data_in(id_ex_src1_data),
    .ex_src2_data_in(id_ex_src2_data),
    .ex_instruction_in(id_ex_instruction),
    .ex_ctrl_in(id_ex_ctrl),
    .ex_pc_in(id_ex_pc),

    //OUTPUTS: Alu, Branch adder
    .ex_alu_out(ex_alu_out),
    .ex_br_out(ex_br_out),

    // FORWARDING
    .alu_input_one_mux_sel(forward_a_mux_sel), 
    .alu_input_two_mux_sel(forward_b_mux_sel),
    .mem_input(ex_mem_alu),
    .wb_input(mem_wb_dest_data),
    .mem_load_input(dest_data)
);


forwarding_unit hot_box
(
    .ex_mem_out_regfile_write(ex_mem_ctrl.load_regfile),
    .mem_wb_out_regfile_write(mem_wb_ctrl.load_regfile),
    .mem_load_inst((ex_mem_ctrl.opcode == op_ldb) || (ex_mem_ctrl.opcode == op_ldi) || (ex_mem_ctrl.opcode == op_ldr)),
	 .mem_str_inst((id_ctrl_data.opcode == op_str) || (id_ctrl_data.opcode == op_stb) || (id_ctrl_data.opcode == op_sti)),
    .uses_sr1(id_ex_ctrl.uses_sr1), 
    .uses_sr2(id_ex_ctrl.uses_sr2),
    .uses_sr1_mem(ex_mem_ctrl.uses_sr1),
    .uses_sr2_mem(ex_mem_ctrl.uses_sr2),
    .id_ex_in_uses_sr1(id_ctrl_data.uses_sr1),
    .id_ex_in_uses_sr2(id_ctrl_data.uses_sr2),
    .ex_mem_out_dest(ex_mem_dest),
    .id_ex_out_sr1(id_ex_src1),
    .id_ex_out_sr2(id_ex_src2),
    .id_ex_in_src1(if_id_src1),
    .id_ex_in_src2(if_id_src2),
	 .id_ex_in_dest(if_id_dest),
    .mem_wb_out_dest(mem_wb_dest),
    .mem_wb_out_src1(mem_wb_src1),
    .mem_wb_out_src2(mem_wb_src2),
    .ex_mem_out_sr1(ex_mem_src1),
    .ex_mem_out_sr2(ex_mem_src2),

    .ex_forward_a(forward_a_mux_sel),
    .ex_forward_b(forward_b_mux_sel),
    .id_forward_a(id_forward_a_mux_sel),
    .id_forward_b(id_forward_b_mux_sel),
	 .mem_forward_a(wb_mem_forward_a),
	 .mem_forward_b(wb_mem_forward_b)
);

leap_frog puff_puff_pass
(
	 .clk(clk),
    .memstall(stall_mem),
    .ex_dest(id_ex_dest),
    .mem_dest(ex_mem_dest),
    .ex_sr1(id_ex_src1),
    .ex_sr2(id_ex_src2),
    .ex_crtl(id_ex_ctrl),

    .leap_frog_data_mux(leap_frog_data_sel),
    .leap_frog_reg_mux(leap_frog_reg_sel),
	.other_stage_stall_override(stall_pass_override),
	.mem_load_cc(mem_load_cc_s)
);

buffer ex_mem_buf
(
    .clk(clk),
    .load(~stall_mem),
    .flush(flush_mem),
    .src1_in(id_ex_src1),
    .src2_in(id_ex_src2),
    .dest_in(id_ex_dest),
    .instruction_in(id_ex_instruction),
    .alu_in(ex_alu_out),
    .pc_in(id_ex_pc),
    .pc_br_in(ex_br_out),
    .src1_data_in(id_ex_src1_data),
    .src2_data_in(id_ex_src2_data),
    .ctrl_in(id_ex_ctrl),

    .ctrl_out(ex_mem_ctrl),
    .src1_out(ex_mem_src1),
    .src2_out(ex_mem_src2),
    .dest_out(ex_mem_dest),
    .instruction_out(ex_mem_instruction),
    .alu_out(ex_mem_alu),
    .pc_out(ex_mem_pc),
    .pc_br_out(ex_mem_pc_br),
    .src1_data_out(ex_mem_src1_data),
    .src2_data_out(ex_mem_src2_data)
);

mux2 #(.width(16)) wb_to_mem_sr1 (
    .sel(wb_mem_forward_a && ((ex_mem_ctrl.opcode == op_jmp) || (ex_mem_ctrl.opcode == op_jsr) || (ex_mem_ctrl.opcode == op_str))),
    .a(ex_mem_src1_data),
    .b(mem_wb_dest_data),
    .f(wb_mem_forward_a_data)
);

mux2 #(.width(16)) wb_to_mem_sr2 (
    .sel(wb_mem_forward_b && ((ex_mem_ctrl.opcode == op_jmp) || (ex_mem_ctrl.opcode == op_jsr) || (ex_mem_ctrl.opcode == op_str))),
    .a(ex_mem_src2_data),
    .b(mem_wb_dest_data),
    .f(wb_mem_forward_b_data)
);

mem_datapath mem
(
    .clk(clk),
    .ctrl(ex_mem_ctrl),
    .alu_out(ex_mem_alu),
    .pc_out(ex_mem_pc),
    .br_add_out(ex_mem_pc_br),
    .sr1_out(wb_mem_forward_a_data),
    .sr2_out(wb_mem_forward_b_data),
    .instruction(ex_mem_instruction),
    .br_en(mem_br_en),
    .jmp_jsr_en(mem_jmp_jsr_en),
    .b11(mem_b11),
    .trap_en(mem_trap_en),
    .trap_mem(trap_mem),
    .regfilemux_out(dest_data),
    .dest(ex_mem_dest),
    .stall(stall_mem),
    .flush(flush_mem),

    /* Port B */
    .read_b(read_b),
    .write_b(write_b),
    .wmask_b(wmask_b),
    .address_b(address_b),
    .wdata_b(wdata_b),
    .resp_b(resp_b),
    .rdata_b(rdata_b),
	 .ex_load_cc(id_ex_ctrl.load_cc),
	 .ex_data(ex_alu_out),
	 .leap_signal(mem_load_cc_s)
);

buffer mem_wb_buf
(
    .clk(clk),
    .load(~stall_mem),
    .flush(1'b0),
    .src1_in(ex_mem_src1),
    .src2_in(ex_mem_src2),
    .dest_in(ex_mem_dest),
    .instruction_in(ex_mem_instruction),
    .alu_in(ex_mem_alu),
    .br_in(mem_br_en),
    .pc_in(ex_mem_pc),
    .pc_br_in(ex_mem_pc_br),
    .mar_in(address_b),
    .mdr_in(wdata_b),
    .src1_data_in(ex_mem_src1_data),
    .src2_data_in(ex_mem_src2_data),
    .dest_data_in(dest_data),
    .ctrl_in(ex_mem_ctrl),

    .ctrl_out(mem_wb_ctrl),
    .src1_out(mem_wb_src1),
    .src2_out(mem_wb_src2),
    .dest_out(mem_wb_dest),
    .instruction_out(mem_wb_instruction),
    .alu_out(mem_wb_alu),
    .br_out(mem_wb_br),
    .pc_out(mem_wb_pc),
    .pc_br_out(mem_wb_pc_br),
    .mar_out(mem_wb_mar),
    .mdr_out(mem_wb_mdr),
    .src1_data_out(mem_wb_src1_data),
    .src2_data_out(mem_wb_src2_data),
    .dest_data_out(mem_wb_dest_data)
);

endmodule : cpu_datapath