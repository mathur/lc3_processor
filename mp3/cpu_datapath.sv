import lc3b_types::*;

module cpu_datapath
(
    input clk,

    /* Port A */
    input logic resp_a,
    input logic [15:0] rdata_a,
    output read_a,
    output write_a,
    output [1:0] wmask_a,
    output [15:0] address_a,
    output [15:0] wdata_a,

    /* Port B */
    input logic resp_b,
    input logic [15:0] rdata_b,
    output read_b,
    output write_b,
    output [1:0] wmask_b,
    output [15:0] address_b,
    output [15:0] wdata_b
);

logic stall;
logic [1:0] pcmux_sel;

lc3b_reg if_id_src1;
lc3b_reg if_id_src2;
lc3b_reg if_id_dest;
lc3b_word if_id_instruction;

lc3b_control_word id_ex_ctrl_data;
lc3b_word id_ex_src1_data;
lc3b_word id_ex_src2_data;
lc3b_word id_ex_dest_data;

if_datapath if
(
    .clk(clk),
    .pcmux_sel(pcmux_sel),
    .stall(stall),
    .src1(if_id_src1),
    .src2(if_id_src2),
    .dest(if_id_dest),
    .instruction(if_id_instruction)
);

buffer if_id_buf
(
    .clk(clk),
    .src1_out(if_id_src1),
    .src2_out(if_id_src2),
    .dest_out(if_id_dest),
    .instruction_out(if_id_instruction),
    .src1_data_out(),
    .src2_data_out(),
    .dest_data_out()
);

id_datapath id
(
    .clk(clk)
    /* Control Input */
    .inst(if_id_instruction),

    /* Control Output */
    .ctrl(id_ex_ctrl_data),

    /* Data Inputs */
    .dest(if_id_dest),
    .sr1(if_id_src1),
    .sr2(if_id_src2),

    // TODO: From WB
    .wb_dest_addr,
    .wb_dest_data,

    /* Data Outputs */
    .destmux_out(id_ex_src1_data),
    .sr1_out(id_ex_src2_data),
    .sr2_out(id_ex_dest_data)
);


buffer id_ex_buf
(
    .clk(clk),
    .src1_in(if_id_src1),
    .src2_in(if_id_src2),
    .dest_in(if_id_dest),
    .instruction_in(if_id_instruction),
    .ctrl_in(id_ex_ctrl_data),
    .src1_data_in(id_ex_src1_data),
    .src2_data_in(id_ex_src2_data),
    .dest_data_in(id_ex_dest_data),
    .src1_out(id_ex_src1),
    .src2_out(id_ex_src2),
    .dest_out(id_ex_dest),
    .instruction_out(id_ex_instruction),
    .pc_out(id_ex_pc),
    .src1_data_out(id_ex_src1_data),
    .src2_data_out(id_ex_src2_data),
    .dest_data_out(id_ex_dest_data)
);

lc3b_reg id_ex_src1, id_ex_src2, id_ex_dest;
lc3b_word id_ex_src1_data, id_ex_src2_data, id_ex_dest_data;
lc3b_word id_ex_instruction, id_ex_pc;
lc3b_word ex_alu_out, ex_br_out;

ex_datapath ex
(
    .clk(clk),
    //INPUTS: Data, Instruction, PC
    .ex_src1_data_in(id_ex_src1_data),
    .ex_src2_data_in(id_ex_src2_data),
    .ex_dest_data_in(id_ex_dest_data),
    .ex_instruction_in(id_ex_instruction),
    .ex_pc_in(id_ex_pc),
    //OUTPUTS: Alu, Branch adder
    .ex_alu_out(ex_alu_out),
    .ex_br_out(ex_br_out)
);
//Load buffer with relevant signals from previous buffer and new signals from EX
buffer ex_mem_buf
(
    .clk(clk),
    .load(),
    .src1_in(id_ex_src1),
    .src2_in(id_ex_src2),
    .dest_in(id_ex_dest),
    .instruction_in(id_ex_instruction),
    .alu_in(ex_alu_out),
    .br_in(ex_br_out),
    .pc_in(id_ex_pc),
    .src1_data_in(id_ex_src1_data),
    .src2_data_in(id_ex_src2_data),
    .dest_data_in(id_ex_dest_data)
);

mem_datapath mem
(
    .clk(clk)
);

buffer mem_wb_buf
(
    .clk(clk)
);

wb_datapath wb
(
    .clk(clk)
);

endmodule : cpu_datapath