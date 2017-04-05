module benable (
    input n, z, p,
    input nr, zr, pr,
    output logic enable
);

always_comb
begin
    if(nr == 1'b1 && zr == 1'b1 && pr == 1'b1) begin
        enable = 1;
    end else if((n == 1 && nr == 1) || (z == 1 && zr == 1) || (p == 1 && pr == 1)) begin
        enable = 1;
    end else begin
        enable = 0;
    end
end

endmodule : benable