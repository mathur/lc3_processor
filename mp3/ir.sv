import lc3b_types::*;

module ir
(
    input clk,
    input load, resp, flush,
    input lc3b_word in,
	 output lc3b_word instruction,
    output lc3b_reg dest, src1, src2
);

lc3b_word data;

always_ff @(posedge clk)
begin
    if (load == 1) begin
        data <= in;
    end else if (flush) begin
		  data <= 16'b0;
    end else if (resp == 0) begin
		  data <= data;
	 end else begin
	     data <= data;
	 end
end


always_comb
begin
	if(resp == 0) begin
		dest = 3'b0;
		src1 = 3'b0;
		src2 = 3'b0;
		instruction = 16'b0;
	end else begin
		dest = data[11:9];
		src1 = data[8:6];
		src2 = data[2:0];
		instruction = data;
	end
end

endmodule : ir
