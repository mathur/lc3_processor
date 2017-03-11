import lc3b_types::*;

module cpu_datapath
(
    input clk
);


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
    .clk(clk)
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
    .dest_data_in(id_ex_dest_data)
);

ex_datapath ex
(
    .clk(clk)
);

buffer ex_mem_buf
(
    .clk(clk)
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