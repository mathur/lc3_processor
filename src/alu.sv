import lc3b_types::*;

module alu
(
    input lc3b_alu_op alu_op,
    input lc3b_word a, b,
    output lc3b_word f
);

always_comb
begin
    case (alu_op)
        alu_add: f = a + b;
        alu_and: f = a & b;
        alu_not: f = ~a;
        alu_pass: f = a;
        alu_sll: f = a << b;
        alu_srl: f = a >> b;
        alu_sra: f = $signed(a) >>> b;
        default: $display("Unknown alu_op");
    endcase
end

endmodule : alu
