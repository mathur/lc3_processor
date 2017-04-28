module plus2 #(parameter width = 16)
(
    input [width-1:0] in,
    input logic enable,
    output logic [width-1:0] out
);

    assign out = enable ? (in + 4'h2) : in;

endmodule : plus2
