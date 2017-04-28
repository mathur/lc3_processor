import lc3b_types::*;

module ex_datapath (
    input clk,
    input lc3b_word ex_src1_data_in, ex_src2_data_in,
    input lc3b_word ex_instruction_in,
    input lc3b_word ex_pc_in,
    input lc3b_control_word ex_ctrl_in,
    output lc3b_word ex_alu_out, ex_br_out,

    // Forwarding stuff
    input logic [1:0] alu_input_one_mux_sel, alu_input_two_mux_sel,
    input lc3b_word mem_input,
    input lc3b_word wb_input,
    input lc3b_word mem_load_input
);

lc3b_word adj5_out, adj6_out, adj6ns_out, adj9_out, adj11_out, br_addmux_out, alumux_out, alumux_out_two, shift_out;


// Forwarding stuff
lc3b_word alu_input_one_mux_out, alu_input_two_mux_out;

mux2 br_add_mux
(
    .sel(ex_ctrl_in.br_addmux_sel),
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

mux8 alumux
(
    .sel(ex_ctrl_in.alumux_sel),
    .a(ex_src2_data_in),
    .b(adj6_out),
    .c(adj5_out),
    .d(adj6ns_out),
	 .e({12'b0, ex_instruction_in[3:0]}),
	 .f(16'b0),
	 .g(16'b0),
	 .h(16'b0),
    .i(alumux_out)
);

mux4 alumux_two
(
    .sel(ex_ctrl_in.alumux_sel_two),
    .a(ex_src1_data_in),
    .b(ex_br_out),
    .c(16'b0),
    .d(16'b0),
    .f(alumux_out_two)
);

shiftunit sunit
(
    .a(ex_instruction_in[5]),
    .d(ex_instruction_in[4]),
    .sr(ex_src1_data_in),
    .imm4(ex_instruction_in[3:0]),
    .f(shift_out)
);

mux4 #(.width(16)) alu_input_one_mux
(
    .sel(alu_input_one_mux_sel),
    .a(alumux_out_two),
    .b(mem_input),
    .c(wb_input),
    .d(mem_load_input),
    .f(alu_input_one_mux_out)
);

mux4 #(.width(16)) alu_input_two_mux
(
    .sel(alu_input_two_mux_sel),
    .a(alumux_out),
    .b(mem_input),
    .c(wb_input),
    .d(mem_load_input),
    .f(alu_input_two_mux_out)
);

lc3b_alu_op real_alu_op;

always_comb
	begin
		if(ex_ctrl_in.opcode == op_shf) 
			begin
				if(ex_instruction_in[4] == 0)
					real_alu_op = alu_sll;
				else 
					begin
						if(ex_instruction_in[5] == 0)
							real_alu_op = alu_srl;
						else	
							real_alu_op = alu_sra;
					end
			end
		else
			real_alu_op = ex_ctrl_in.alu_op;
	end

alu alu_unit
(
    .alu_op(real_alu_op),
    .a(alu_input_one_mux_out),
    .b(alu_input_two_mux_out),
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
    .in(ex_instruction_in[8:0]),
    .out(adj9_out)
);

adj #(.width(11)) adj11
(
    .in(ex_instruction_in[10:0]),
    .out(adj11_out)
);

// MISSING ALL FORWARDING UNIT STUFF

endmodule : ex_datapath