import lc3b_types::*;

module ir
(
    input clk,
    input load,
    input lc3b_word in,
    output lc3b_opcode opcode,
    output lc3b_reg dest, src1, src2,
    output lc3b_offset6 offset6,
    output lc3b_offset9 offset9,
	 output lc3b_offset5 offset5,
	 output lc3b_offset11 offset11,
	 output logic imm_mode,
	 output logic jsr_mode,
	 output logic a,
	 output logic d,
	 output logic [3:0] imm4, 
	 output logic [7:0] trap_vector
);

lc3b_word data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    opcode = lc3b_opcode'(data[15:12]);

    dest = data[11:9];
    src1 = data[8:6];
    src2 = data[2:0];

    offset6 = data[5:0];
    offset9 = data[8:0];
	 offset5 = data[4:0];
	 offset11 = data[10:0];
	 imm_mode = data[5];
	 jsr_mode = data[11];
	 trap_vector = data[7:0];
	 imm4 = data[3:0];
	 a = data[5];
	 d = data[4];
end

endmodule : ir
