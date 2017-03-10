import lc3b_types::*;

module cpu
(
    input clk
);

cpu_datapath cpu_datapath
(
    .clk(clk)
);

endmodule : cpu