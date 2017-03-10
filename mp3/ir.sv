import lc3b_types::*;

module ir
(
    input clk,
    input load,
    input lc3b_word in,
    output lc3b_word instruction,
    output lc3b_reg dest, src1, src2
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
    instruction = data;
    dest = data[11:9];
    src1 = data[8:6];
    src2 = data[2:0];
end

endmodule : ir
