import lc3b_types::*;

module forwarding_unit
(
	input logic ex_mem_out_regfile_write,
	input logic mem_wb_out_regfile_write,
	input logic mem_load_inst,
	input logic mem_str_inst,
	input logic uses_sr1, uses_sr2,
	input logic uses_sr1_mem, uses_sr2_mem,
	input logic id_ex_in_uses_sr1, id_ex_in_uses_sr2,
	input lc3b_reg ex_mem_out_dest, id_ex_out_sr1, id_ex_out_sr2,
	input lc3b_reg id_ex_in_src1, id_ex_in_src2,
	input lc3b_reg mem_wb_out_dest, mem_wb_out_src1, mem_wb_out_src2,
	input lc3b_reg ex_mem_out_sr1, ex_mem_out_sr2, id_ex_in_dest,
	output logic [1:0] ex_forward_a,
	output logic [1:0] ex_forward_b,
	output logic [1:0] id_forward_a,
	output logic [1:0] id_forward_b,
	output mem_forward_a,
	output mem_forward_b
);

logic [1:0] ex_forward_a_int;
logic [1:0] ex_forward_b_int;
logic [1:0] id_forward_a_int;
logic [1:0] id_forward_b_int;
logic mem_forward_a_int;
logic mem_forward_b_int;
logic wb_mem_a_int;
logic wb_mem_b_int;
logic wb_id_a_int;
logic wb_id_b_int;


logic ex_ex_sr1;
logic ex_ex_sr2;
logic mem_ex_sr1_load;
logic mem_ex_sr2_load;
logic mem_ex_sr1;
logic mem_ex_sr2;
logic mem_id_sr1;
logic mem_id_sr2;
logic mem_id_str_sr1;
logic mem_id_str_sr2;
logic mem_mem_sr1;
logic mem_mem_sr2;
logic wb_mem_sr1;
logic wb_mem_sr2;

always_comb
begin
	// Default Values
	ex_forward_a_int = 2'b00;
	ex_forward_b_int = 2'b00;
	id_forward_a_int = 2'b00;
	id_forward_b_int = 2'b00;
	mem_forward_a_int = 1'b0;
	mem_forward_b_int = 1'b0;
	wb_mem_a_int = 1'b0;
	wb_mem_b_int = 1'b0;

	ex_ex_sr1 = ex_mem_out_regfile_write && (uses_sr1) && (ex_mem_out_dest == id_ex_out_sr1);
	ex_ex_sr2 = ex_mem_out_regfile_write && (uses_sr2) && (ex_mem_out_dest == id_ex_out_sr2);

	mem_ex_sr1_load = ex_mem_out_regfile_write && (uses_sr1) && (ex_mem_out_dest == id_ex_out_sr1) && mem_load_inst;
	mem_ex_sr2_load = ex_mem_out_regfile_write && (uses_sr2) && (ex_mem_out_dest == id_ex_out_sr2) && mem_load_inst;

	mem_ex_sr1 = mem_wb_out_regfile_write && (uses_sr1) && (mem_wb_out_dest == id_ex_out_sr1) && !(ex_ex_sr1) && !(mem_ex_sr1_load);
	mem_ex_sr2 = mem_wb_out_regfile_write && (uses_sr2) && (mem_wb_out_dest == id_ex_out_sr2) && !(ex_ex_sr2) && !(mem_ex_sr2_load);

	mem_mem_sr1 = (ex_mem_out_sr1 == mem_wb_out_dest) && (uses_sr1_mem) && (mem_wb_out_regfile_write);
	mem_mem_sr2 = (ex_mem_out_dest == mem_wb_out_dest) && (uses_sr1_mem) && (mem_wb_out_regfile_write);

	mem_id_sr1 = ex_mem_out_regfile_write && (ex_mem_out_dest == id_ex_in_src1) && (id_ex_in_uses_sr1);
	mem_id_sr2 = ex_mem_out_regfile_write && (ex_mem_out_dest == id_ex_in_src2) && (id_ex_in_uses_sr2);
	
	wb_id_a_int = mem_wb_out_regfile_write && (mem_wb_out_dest == id_ex_in_src1) && id_ex_in_uses_sr1;
	wb_id_b_int = mem_wb_out_regfile_write && (mem_wb_out_dest == id_ex_in_src2) && id_ex_in_uses_sr2;
	
	mem_id_str_sr1 = ex_mem_out_regfile_write && (ex_mem_out_dest == id_ex_in_dest) && mem_str_inst;
	mem_id_str_sr2 = ex_mem_out_regfile_write && (ex_mem_out_dest == id_ex_in_dest) && mem_str_inst;
	
	//wb_mem_sr1 = wb_out_regfile_write && (wb_out_dest == ex_mem_out_sr1) && (uses_sr1_mem);
	//wb_mem_sr2 = wb_out_regfile_write && (wb_out_dest == ex_mem_out_sr2) && (uses_sr2_mem);


	// EX to EX
	if (ex_ex_sr1) begin 
		ex_forward_a_int = 2'b01;
	end
	if (ex_ex_sr2) begin 
		ex_forward_b_int = 2'b01;
	end

	// MEM to EX
	if (mem_ex_sr1) begin 
		ex_forward_a_int = 2'b10;
	end
	if (mem_ex_sr2) begin 
		ex_forward_b_int = 2'b10;
	end

	// MEM to EX with LOAD
	if (mem_ex_sr1_load) begin 
		ex_forward_a_int = 2'b11;
	end
	if (mem_ex_sr2_load) begin 
		ex_forward_b_int = 2'b11;
	end
	
	// MEM to MEM
	if(mem_mem_sr1) begin
		mem_forward_a_int = 1'b1;
	end
	if(mem_mem_sr2) begin
		mem_forward_b_int = 1'b1;
	end

	// MEM to ID
	if(mem_id_sr1) begin
		id_forward_a_int = 2'b01;
	end
	if(mem_id_sr2) begin
		id_forward_b_int = 2'b01;
	end
	
	// MEM to ID
	if(wb_id_a_int) begin
		id_forward_a_int = 2'b10;
	end
	if(wb_id_b_int) begin
		id_forward_b_int = 2'b10;
	end
	
	// MEM to ID with STORE
	if(mem_id_str_sr2) begin
		id_forward_b_int = 1'b01;
	end
end

assign ex_forward_a = ex_forward_a_int;
assign ex_forward_b = ex_forward_b_int;
assign id_forward_a = id_forward_a_int;
assign id_forward_b = id_forward_b_int;
assign mem_forward_a = mem_forward_a_int;
assign mem_forward_b = mem_forward_b_int;
//assign wb_mem_a = wb_mem_a_int;
//assign wb_mem_a = wb_mem_b_int;

endmodule