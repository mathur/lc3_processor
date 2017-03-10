import lc3b_types::*;

module cpu_datapath
(
    input clk
);

if_datapath if
(
    .clk(clk)
);

buffer if_id_buf
(
    .clk(clk)
);

id_datapath id
(
    .clk(clk)
);

buffer id_ex_buf
(
    .clk(clk)
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