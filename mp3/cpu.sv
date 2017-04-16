import lc3b_types::*;

module cpu
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
    output [15:0] wdata_b,

    // counters
    input logic br_count_reset, br_mispredict_count_reset,
    input logic if_stall_count_reset, mem_stall_count_reset,
    output lc3b_word br_count, br_mispredict_count,
    output lc3b_word if_stall_count, mem_stall_count
);

cpu_datapath cpu_datapath
(
    .clk(clk),

    /* Port A */
    .read_a,
    .write_a,
    .wmask_a,
    .address_a,
    .wdata_a,
    .resp_a,
    .rdata_a,

    /* Port B */
    .read_b,
    .write_b,
    .wmask_b,
    .address_b,
    .wdata_b,
    .resp_b,
    .rdata_b,

    .br_count,
    .br_mispredict_count,
    .if_stall_count,
    .mem_stall_count,
    .br_count_reset,
    .br_mispredict_count_reset,
    .if_stall_count_reset,
    .mem_stall_count_reset
);

endmodule : cpu