import lc3b_types::*;

module buffer (
    input clk,
    input load,
    input [2:0] src1_in, src2_in, dest_in,
    input [15:0] instruction_in, alu_in, br_in, pc_in, pc_br_in, mar_in, mdr_in,
    output [2:0] src1_out, src2_out, dest_out,
    output [15:0] instruction_out, alu_out, br_out, pc_out, pc_br_out, mar_out, mdr_out
);

register #(.width(3)) src1
(
    .clk(clk),
    .load(load),
    .in(src1_in),
    .out(src1_out)
);

register #(.width(3)) src2
(
    .clk(clk),
    .load(load),
    .in(src2_in),
    .out(src2_out)
);

register #(.width(3)) dest
(
    .clk(clk),
    .load(load),
    .in(dest_in),
    .out(dest_out)
);

register #(.width(16)) instruction
(
    .clk(clk),
    .load(load),
    .in(instruction_in),
    .out(instruction_out)
);

register #(.width(16)) alu
(
    .clk(clk),
    .load(load),
    .in(alu_in),
    .out(alu_out)
);

register #(.width(16)) br
(
    .clk(clk),
    .load(load),
    .in(br_in),
    .out(br_out)
);

register #(.width(16)) pc
(
    .clk(clk),
    .load(load),
    .in(pc_in),
    .out(pc_out)
);

register #(.width(16)) pc_br
(
    .clk(clk),
    .load(load),
    .in(pc_br_in),
    .out(pc_br_out)
);

register #(.width(16)) mar
(
    .clk(clk),
    .load(load),
    .in(mar_in),
    .out(mar_out)
);

register #(.width(16)) mdr
(
    .clk(clk),
    .load(load),
    .in(mdr_in),
    .out(mdr_out)
);

endmodule : buffer