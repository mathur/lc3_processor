import lc3b_types::*;

module cache
(
    input           logic           clk,
    input           lc3b_word       mem_address,
    input           logic           mem_read,
    input           logic           pmem_resp,
    input           logic[127:0]    pmem_rdata,
    input           logic[15:0]     mem_wdata,
    input           logic           mem_write,
    input           lc3b_mem_wmask  mem_byte_enable,
    output          logic           mem_resp,
    output          lc3b_word       mem_rdata,
    output          logic           pmem_read,
    output          logic[15:0]     pmem_address,
    output          logic[127:0]    pmem_wdata,
    output          logic           pmem_write
);

    logic  hit;
    logic  memcachedatamux_sel;
    logic  write_set1;
    logic  write_set2;

    logic  write_lru;
    logic  lru_val;
    logic  lru_out;

	logic  tag1_hit;
	logic  tag2_hit;

    logic  dirty_1;
    logic  dirty_2;

    logic  dirty_in;

    logic  datamux_1_sel;
    logic  datamux_2_sel;

    logic [8:0]     tag_1;
    logic [8:0]     tag_2;
    logic [127:0]   data_1;
    logic [127:0]   data_2;
    logic [2:0]     index;

    cache_datapath cache_datapath(
        .clk(clk),
        .mem_address(mem_address),
        .memcachedatamux_sel(memcachedatamux_sel),
        .pmem_rdata(pmem_rdata),
        .hit(hit),
        .data_out(mem_rdata),
        .write_set1(write_set1),
        .write_set2(write_set2),
        .write_lru(write_lru),
        .lru_val(lru_val),
        .lru_out(lru_out),
		.tag1_hit(tag1_hit),
		.tag2_hit(tag2_hit),
        .mem_write(mem_write),
        .mem_wdata(mem_wdata),
        .mem_byte_enable(mem_byte_enable),
        .dirty_1(dirty_1),
        .dirty_2(dirty_2),
        .tag_1(tag_1),
        .tag_2(tag_2),
        .data_1(data_1),
        .data_2(data_2),
        .index(index),
        .dirty_in(dirty_in),
        .datamux_1_sel(datamux_1_sel),
        .datamux_2_sel(datamux_2_sel)
    );

    cache_control cache_control(
        .clk(clk),
        .hit(hit),
        .memcachedatamux_sel(memcachedatamux_sel),
        .mem_read(mem_read),
        .pmem_resp(pmem_resp),
        .mem_resp(mem_resp),
        .pmem_read(pmem_read),
        .write_set1(write_set1),
        .write_set2(write_set2),
        .write_lru(write_lru),
        .lru_val(lru_val),
        .lru_out(lru_out),
		.tag1_hit(tag1_hit),
		.tag2_hit(tag2_hit),
        .dirty_1(dirty_1),
        .dirty_2(dirty_2),
        .pmem_address(pmem_address),
        .pmem_wdata(pmem_wdata),
        .pmem_write(pmem_write),
        .mem_address(mem_address),
        .tag_1(tag_1),
        .tag_2(tag_2),
        .data_1(data_1),
        .data_2(data_2),
        .index(index),
        .mem_write(mem_write),
        .dirty_in(dirty_in),
        .datamux_1_sel(datamux_1_sel),
        .datamux_2_sel(datamux_2_sel)
    );

endmodule : cache
