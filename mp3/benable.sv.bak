module benable (
input n, z, p,
input nr, zr, pr,
output logic enable
);
always_comb
begin
if((n == 1 && nr == 1) || (z == 1 && zr == 1) || (p == 1 && pr == 1))
enable = 1;
else
enable = 0;
end
endmodule : benable