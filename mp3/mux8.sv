module mux8 #(parameter width = 16)
(
input [2:0] sel,
input [width-1:0] a, b, c, d, e, f, g, h,
output logic [width-1:0] i
);

logic [width - 1:0] mux_a_out;
logic [width - 1:0] mux_b_out;

mux4 #(.width(width)) mux_a
(
    .sel(sel[1:0]),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .f(mux_a_out)
);

mux4 #(.width(width)) mux_b
(
    .sel(sel[1:0]),
    .a(e),
    .b(f),
    .c(g),
    .d(h),
    .f(mux_b_out)
);

mux2 #(.width(width)) out_mux
(
	 .a(mux_a_out),
	 .b(mux_b_out),
	 .sel(sel[2]),
	 .f(i)
);


endmodule : mux8