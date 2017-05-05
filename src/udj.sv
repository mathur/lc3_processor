import lc3b_types::*;

/*
 * ZEXT[offset-n << 1]
 */
module udj #(parameter width = 8)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out = $unsigned({in, 1'b0});

endmodule : udj
