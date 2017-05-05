module badder #(parameter width = 16)
(
input [width-1:0] a, b,
output logic [width-1:0] f
);
always_comb
begin
f = a + b;
end
endmodule : badder