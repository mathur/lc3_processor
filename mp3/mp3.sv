import lc3b_types::*;

module mp3 (
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

cpu mcpu (
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
    .rdata_b
);

// cache mcache (
//     .clk(clk),

//     /* Memory signals from cpu */
//     .mem_resp(mem_resp),
//     .mem_rdata(mem_rdata),
//     .mem_read(mem_read),
//     .mem_write(mem_write),
//     .mem_byte_enable(mem_byte_enable),
//     .mem_address(mem_address),
//     .mem_wdata(mem_wdata),

//     /* Memory signals from main memory */
//     .pmem_resp,
//     .pmem_rdata,
//     .pmem_read,
//     .pmem_write,
//     .pmem_address,
//     .pmem_wdata
// );

endmodule: mp3