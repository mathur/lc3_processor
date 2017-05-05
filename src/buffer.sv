import lc3b_types::*;

module buffer (
    input clk,
    input load,
	 input flush,
    input lc3b_reg src1_in, src2_in, dest_in,
    input logic br_in,
    input lc3b_word instruction_in, alu_in, pc_in, pc_br_in, mar_in, mdr_in, src1_data_in, src2_data_in, dest_data_in,
    input lc3b_control_word ctrl_in,
    output lc3b_control_word ctrl_out,
    output lc3b_reg src1_out, src2_out, dest_out,
    output lc3b_word instruction_out, alu_out, pc_out, pc_br_out, mar_out, mdr_out, src1_data_out, src2_data_out, dest_data_out,
    output logic br_out
);

register #(.width($bits(lc3b_control_word))) control_word
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(ctrl_in),
    .out(ctrl_out)
);

register #(.width(3)) src1
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(src1_in),
    .out(src1_out)
);

register #(.width(3)) src2
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(src2_in),
    .out(src2_out)
);

register #(.width(3)) dest
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(dest_in),
    .out(dest_out)
);

register #(.width(16)) src1_data
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(src1_data_in),
    .out(src1_data_out)
);

register #(.width(16)) src2_data
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(src2_data_in),
    .out(src2_data_out)
);

register #(.width(16)) dest_data
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(dest_data_in),
    .out(dest_data_out)
);

register #(.width(16)) instruction
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(instruction_in),
    .out(instruction_out)
);

register #(.width(16)) alu
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(alu_in),
    .out(alu_out)
);

register #(.width(1)) br
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(br_in),
    .out(br_out)
);

register #(.width(16)) pc
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(pc_in),
    .out(pc_out)
);

register #(.width(16)) pc_br
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(pc_br_in),
    .out(pc_br_out)
);

register #(.width(16)) mar
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(mar_in),
    .out(mar_out)
);

register #(.width(16)) mdr
(
    .clk(clk),
    .load(load),
	 .flush(flush),
    .in(mdr_in),
    .out(mdr_out)
);

endmodule : buffer