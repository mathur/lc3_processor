module shiftunit #(parameter width = 16)
(
	input a,d,
	input [width-1:0] sr,
	input [3:0] imm4,
	output logic [width-1:0] f
);
	always_comb
	begin
		if (d == 0)
			begin
				f = sr << imm4;
			end
		else
			begin
				if (a == 0)
					f = sr >> imm4;
				else
					f = $signed(sr) >>> imm4;
			end
	end
endmodule : shiftunit