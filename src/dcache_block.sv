import lc3b_types::*;

/* Block might be a bad name, this basically represents
	both cache sets for 2 way assoicativity  

	hits and misses are also calculated here
	
	
	Offset bits are [3:0]
	Index bits are  [6:4]
	Tag bits are    [15:7]

*/
module dcache_block (
	input clk,
	input lc3b_pmem_addr cache_addr,
	output logic hit,
	output lc3b_word out_data_block,

	/* Writing logic */
	input load_set_one,
	input load_set_two,
	input lc3b_pmem_line input_data,

	/* Used for LRU */
	output logic set_one_hit,
	output logic set_two_hit,

	output logic set_one_valid,
	output logic set_two_valid,
	
	output logic set_one_dirty,
	output logic set_two_dirty,

	output lc3b_pmem_line out_data_full,
	
	output lc3b_pmem_line out_data_set_one_f,
	output lc3b_pmem_line out_data_set_two_f,
	
	input logic write_type_set_one,
	input logic write_type_set_two,
	
	output lc3b_cache_tag set_one_tag,
	output lc3b_cache_tag set_two_tag,
	input lc3b_mem_wmask mem_byte_enable
);

logic out_valid_set_one;
lc3b_cache_tag out_tag_set_one; 
lc3b_pmem_line out_data_set_one;

logic out_valid_set_two;
lc3b_cache_tag out_tag_set_two; 
lc3b_pmem_line out_data_set_two;

lc3b_word out_data_block_internal;

dcache_set set_one(
	.clk(clk),
	.in_index(cache_addr[6:4]),
	.out_valid(out_valid_set_one),
	.out_dirty(set_one_dirty),
	.out_tag(out_tag_set_one),
	.out_data(out_data_set_one),
	.set_load(load_set_one),
	.in_data(input_data),
	.in_tag(cache_addr[15:7]),
	.write_type(write_type_set_one)
);

dcache_set set_two(
	.clk(clk),
	.in_index(cache_addr[6:4]),
	.out_valid(out_valid_set_two),
	.out_dirty(set_two_dirty),
	.out_tag(out_tag_set_two),
	.out_data(out_data_set_two),
	.set_load(load_set_two),
	.in_data(input_data),
	.in_tag(cache_addr[15:7]),
	.write_type(write_type_set_two)
);

always_comb
begin
	hit = ((cache_addr[15:7] == out_tag_set_one) && out_valid_set_one) || ((cache_addr[15:7] == out_tag_set_two) && out_valid_set_two);
	set_one_hit = (cache_addr[15:7] == out_tag_set_one) && out_valid_set_one;
	set_two_hit = (cache_addr[15:7] == out_tag_set_two) && out_valid_set_two;
	if(set_one_hit) begin
		case({cache_addr[3:1], 1'b0})
			4'b0000: begin
				out_data_block_internal = out_data_set_one[15:0];
			end
			4'b0001: begin
				out_data_block_internal = out_data_set_one[23:8];
			end
			4'b0010: begin
				out_data_block_internal = out_data_set_one[31:16];
			end
			4'b0011: begin
				out_data_block_internal = out_data_set_one[39:24];
			end
			4'b0100: begin
				out_data_block_internal = out_data_set_one[47:32];
			end
			4'b0101: begin
				out_data_block_internal = out_data_set_one[55:40];
			end
			4'b0110: begin
				out_data_block_internal = out_data_set_one[63:48];
			end
			4'b0111: begin
				out_data_block_internal = out_data_set_one[71:56];
			end
			4'b1000: begin
				out_data_block_internal = out_data_set_one[79:64];
			end
			4'b1001: begin
				out_data_block_internal = out_data_set_one[87:72];
			end
			4'b1010: begin
				out_data_block_internal = out_data_set_one[95:80];
			end
			4'b1011: begin
				out_data_block_internal = out_data_set_one[103:88];
			end
			4'b1100: begin
				out_data_block_internal = out_data_set_one[111:96];
			end
			4'b1101: begin
				out_data_block_internal = out_data_set_one[119:104];
			end
			4'b1110: begin
				out_data_block_internal = out_data_set_one[127:112];
			end
			4'b1111: begin
				out_data_block_internal = {8'b0, out_data_set_one[127:120]};
			end
		endcase
		out_data_full = out_data_set_one;
		end
	else begin
		case({cache_addr[3:1], 1'b0})
			4'b0000: begin
				out_data_block_internal = out_data_set_two[15:0];
			end
			4'b0001: begin
				out_data_block_internal = out_data_set_two[23:8];
			end
			4'b0010: begin
				out_data_block_internal = out_data_set_two[31:16];
			end
			4'b0011: begin
				out_data_block_internal = out_data_set_two[39:24];
			end
			4'b0100: begin
				out_data_block_internal = out_data_set_two[47:32];
			end
			4'b0101: begin
				out_data_block_internal = out_data_set_two[55:40];
			end
			4'b0110: begin
				out_data_block_internal = out_data_set_two[63:48];
			end
			4'b0111: begin
				out_data_block_internal = out_data_set_two[71:56];
			end
			4'b1000: begin
				out_data_block_internal = out_data_set_two[79:64];
			end
			4'b1001: begin
				out_data_block_internal = out_data_set_two[87:72];
			end
			4'b1010: begin
				out_data_block_internal = out_data_set_two[95:80];
			end
			4'b1011: begin
				out_data_block_internal = out_data_set_two[103:88];
			end
			4'b1100: begin
				out_data_block_internal = out_data_set_two[111:96];
			end
			4'b1101: begin
				out_data_block_internal = out_data_set_two[119:104];
			end
			4'b1110: begin
				out_data_block_internal = out_data_set_two[127:112];
			end
			4'b1111: begin
				out_data_block_internal = {8'b0, out_data_set_two[127:120]};
			end
		endcase
		out_data_full = out_data_set_two;
	end
	case(mem_byte_enable)
			2'b00 : begin
				out_data_block = 16'b0;
			end
			2'b01 : begin
				out_data_block = {8'b0, out_data_block_internal[7:0]};
			end
			2'b10 : begin
				out_data_block = {out_data_block_internal[15:8], 8'b0};
			end
			2'b11 : begin
				out_data_block = out_data_block_internal;
			end
			default : begin
				out_data_block = 16'b0;
			end
		endcase
end

assign set_one_valid = out_valid_set_one;
assign set_two_valid = out_valid_set_two;
assign out_data_set_one_f = out_data_set_one;
assign out_data_set_two_f = out_data_set_two;
assign set_one_tag = out_tag_set_one;
assign set_two_tag = out_tag_set_two;

endmodule : dcache_block



