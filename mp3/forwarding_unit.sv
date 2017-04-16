import lc3b_types::*;

module forwarding_unit
(
	input lc3b_reg id_ex_r_one, id_ex_r_two, ex_mem_r_dest, mem_wb_r_dest,
	input logic ex_mem_regfile_write,
	input logic mem_wb_regfile_write,
	output logic [1:0] forward_a, forward_b
);

logic [1:0] forward_a_int;
logic [1:0] forward_b_int;

always_comb
begin
	// Default Values
	forward_a_int = 2'b00;
	forward_b_int = 2'b00;

	// EX Hazard
	if (ex_mem_regfile_write && (ex_mem_r_dest != 0) && (ex_mem_r_dest == id_ex_r_one)) begin 
		forward_a_int = 2'b01;
	end
	if (ex_mem_regfile_write && (ex_mem_r_dest != 0) && (ex_mem_r_dest == id_ex_r_two)) begin 
		forward_b_int = 2'b01;
	end

	// MEM Hazard
	if (mem_wb_regfile_write && (mem_wb_r_dest != 0) && !(ex_mem_regfile_write
            && (ex_mem_r_dest != 0) && (ex_mem_r_dest == id_ex_r_one)) && (mem_wb_r_dest == id_ex_r_one)) begin 
		forward_a_int = 2'b10;
	end
	if (mem_wb_regfile_write && (mem_wb_r_dest != 0) && !(ex_mem_regfile_write
            && (ex_mem_r_dest != 0) && (ex_mem_r_dest == id_ex_r_two)) && (mem_wb_r_dest == id_ex_r_two)) begin 
		forward_b_int = 2'b10;
	end
end

assign forward_a = forward_a_int;
assign forward_b = forward_b_int;

endmodule
