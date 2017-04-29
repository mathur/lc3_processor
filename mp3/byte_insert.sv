import lc3b_types::*;

module byte_insert (
	input lc3b_cache_offset sel_index,
	input lc3b_word write_data,
	input lc3b_pmem_line input_data,
	input lc3b_mem_wmask mem_byte_enable,
	input logic enable,
	output lc3b_pmem_line output_data
	);

always_comb begin
	if(~enable) begin
		output_data = input_data;
	end else begin
		output_data = input_data;
		case({sel_index[3:1], 1'b0})
			4'b0000: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:8], write_data[7:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:16], write_data[15:8], input_data[7:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:16], write_data};
					end
				endcase
			end
			4'b0001: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:16], write_data[7:0], input_data[7:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:24], write_data[15:8], input_data[15:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:24], write_data, input_data[7:0]};
					end
				endcase
			end
			4'b0010: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:24], write_data[7:0], input_data[15:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:32], write_data[15:8], input_data[23:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:32], write_data, input_data[15:0]};
					end
				endcase
			end
			4'b0011: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:32], write_data[7:0], input_data[23:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:40], write_data[15:8], input_data[31:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:40], write_data, input_data[23:0]};
					end
				endcase
			end
			4'b0100: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:40], write_data[7:0], input_data[23:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:48], write_data[15:8], input_data[39:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:48], write_data, input_data[31:0]};
					end
				endcase
			end
			4'b0101: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:48], write_data[7:0], input_data[39:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:56], write_data[15:8], input_data[47:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:56], write_data, input_data[39:0]};
					end
				endcase
			end
			4'b0110: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:56], write_data[7:0], input_data[47:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:64], write_data[15:8], input_data[55:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:64], write_data, input_data[47:0]};
					end
				endcase
			end
			4'b0111: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:64], write_data[7:0], input_data[55:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:72], write_data[15:8], input_data[63:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:72], write_data, input_data[55:0]};
					end
				endcase
			end
			4'b1000: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:72], write_data[7:0], input_data[63:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:80], write_data[15:8], input_data[71:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:80], write_data, input_data[63:0]};
					end
				endcase
			end
			4'b1001: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:80], write_data[7:0], input_data[71:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:88], write_data[15:8], input_data[79:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:88], write_data, input_data[71:0]};
					end
				endcase
			end
			4'b1010: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:88], write_data[7:0], input_data[79:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:96], write_data[15:8], input_data[87:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:96], write_data, input_data[79:0]};
					end
				endcase
			end
			4'b1011: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:96], write_data[7:0], input_data[87:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:104], write_data[15:8], input_data[95:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:104], write_data, input_data[87:0]};
					end
				endcase
			end
			4'b1100: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:104], write_data[7:0], input_data[95:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:112], write_data[15:8], input_data[103:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:112], write_data, input_data[95:0]};
					end
				endcase
			end
			4'b1101: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:112], write_data[7:0], input_data[103:0]};
					end
					2'b10 : begin
						output_data = {input_data[127:120], write_data[15:8], input_data[96:0]};
					end
					2'b11 : begin
						output_data = {input_data[127:120], write_data, input_data[103:0]};
					end
				endcase
			end
			4'b1110: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {input_data[127:120], write_data[7:0], input_data[111:0]};
					end
					2'b10 : begin
						output_data = {write_data[15:8], input_data[119:0]};
					end
					2'b11 : begin
						output_data = {write_data, input_data[111:0]};
					end
				endcase
			end
			4'b1111: begin
				case(mem_byte_enable)
					2'b00 : begin
						output_data = input_data;
					end
					2'b01 : begin
						output_data = {write_data[7:0], input_data[119:0]};
					end
					2'b10 : begin
						output_data = {write_data[7:0], input_data[119:0]};
					end
					2'b11 : begin
						output_data = {write_data[7:0], input_data[119:0]};
					end
				endcase
			end
			default: begin
				output_data = input_data;
			end
		endcase
	end
end

endmodule : byte_insert
