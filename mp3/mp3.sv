import lc3b_types::*;

module mp3 (
	input clk,
	input pmem_resp,
	input lc3b_pmem_line pmem_rdata,
	output logic  pmem_read,
	output logic  pmem_write,
	output lc3b_pmem_addr pmem_address,
	output lc3b_pmem_line pmem_wdata
);

logic mem_resp;
lc3b_word mem_rdata;
logic mem_read;
logic mem_write;
lc3b_mem_wmask mem_byte_enable;
lc3b_word mem_address;
lc3b_word mem_wdata;

cpu mcpu (
	.clk(clk),
	.mem_resp(mem_resp),
	.mem_rdata(mem_rdata),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.mem_byte_enable(mem_byte_enable),
	.mem_address(mem_address),
	.mem_wdata(mem_wdata)
);

cache mcache (
    .clk(clk),

    /* Memory signals from cpu */
    .mem_resp(mem_resp),
    .mem_rdata(mem_rdata),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .mem_byte_enable(mem_byte_enable),
    .mem_address(mem_address),
    .mem_wdata(mem_wdata),

    /* Memory signals from main memory */
    .pmem_resp,
    .pmem_rdata,
    .pmem_read,
    .pmem_write,
    .pmem_address,
    .pmem_wdata
);

endmodule: mp3