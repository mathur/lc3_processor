import lc3b_types::*;

module leap_frog
(
	input logic clk,

	input logic memstall,
	input lc3b_reg ex_dest, mem_dest,
	input lc3b_reg ex_sr1, ex_sr2,
	input lc3b_control_word ex_crtl,

	output logic leap_frog_data_mux,
	output logic leap_frog_reg_mux,
	output logic mem_load_cc,
	output logic other_stage_stall_override
);

logic mem_load_cc_int;
logic mem_load_cc_reg_int;

always_comb
begin
	// Default values
	leap_frog_data_mux = 1'b0;
	leap_frog_reg_mux  = 1'b0;
	other_stage_stall_override = 1'b0;
	mem_load_cc_int = 1'b0;

	// If we are not jumping or anything crazy
	// Also no memory operations, because those
	// require the mem state to finish
	if ((ex_crtl.opcode == op_add)   ||
		(ex_crtl.opcode == op_and)  ||
		(ex_crtl.opcode == op_lea)  ||
		(ex_crtl.opcode == op_not) || 
		(ex_crtl.opcode == op_shf)) begin
		// If memory is stalling
		if(memstall) begin
			// If the thing in EX doesn't depend on the 
			// outcome of what happens in memory
			if ((ex_dest != mem_dest) && 
				(ex_sr1 != mem_dest) && 
				(ex_sr2 != mem_dest)) begin
				leap_frog_data_mux = 1'b1;
				leap_frog_reg_mux  = 1'b1;
				mem_load_cc_int = 1'b1;
				other_stage_stall_override = 1'b1;
			end
		end
	end
end

register #(.width(1)) cc_status_reg
(
   .clk(clk),
   .load(memstall),
 	.flush(!memstall),
   .in(1'b1),
   .out(mem_load_cc_reg_int)
);

assign mem_load_cc = mem_load_cc_int || mem_load_cc_reg_int;

endmodule : leap_frog