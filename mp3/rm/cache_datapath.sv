import lc3b_types::*;

module cache_datapath
(
    input           logic           clk,
    input           logic[15:0]     mem_address,
    input           logic           memcachedatamux_sel,
    input           logic[127:0]    pmem_rdata,
    input           logic           write_set1,
    input           logic           write_set2,
    input           logic           write_lru,
    input           logic           lru_val,
    input           logic[15:0]     mem_wdata,
    input           logic           mem_write,
    input           lc3b_mem_wmask  mem_byte_enable,
    input           logic           dirty_in,
    input           logic           datamux_1_sel,
    input           logic           datamux_2_sel,
    output          logic           lru_out,
    output          logic           hit,
    output          lc3b_word       data_out,
	output          logic		    tag1_hit, tag2_hit,
    output          logic           dirty_1, dirty_2,
    output          logic[8:0]      tag_1, tag_2,
    output          logic[127:0]    data_1, data_2,
    output          logic[2:0]      index
);

    // entry information
    logic [8:0]     tag;
    logic [3:0]     offset;

    logic           valid_1;
    logic           valid_2;

    logic [127:0]   full_data_out;
    logic [127:0]   new_data;
    logic [127:0]   memcachedatamux_out;
	logic [127:0]	full_new_data_1;
	logic [127:0]	full_new_data_2;

    assign tag =    mem_address[15:7];
    assign index =  mem_address[6:4];
    assign offset = mem_address[3:0];

    // data arrays
    array #(.width(1)) lru
    (
        .clk(clk),
        .write(write_lru),
        .index(index),
        .datain(lru_val),
        .dataout(lru_out)
    );

    array #(.width(1)) valid_array_1
    (
        .clk(clk),
        .write(write_set1),
        .index(index),
        .datain(1'b1),
        .dataout(valid_1)
    );

    array #(.width(1)) valid_array_2
    (
        .clk(clk),
        .write(write_set2),
        .index(index),
        .datain(1'b1),
        .dataout(valid_2)
    );

    array #(.width(1)) dirty_array_1
    (
        .clk(clk),
        .write(write_set1),
        .index(index),
        .datain(dirty_in),
        .dataout(dirty_1)
    );

    array #(.width(1)) dirty_array_2
    (
        .clk(clk),
        .write(write_set2),
        .index(index),
        .datain(dirty_in),
        .dataout(dirty_2)
    );

    array #(.width(9)) tag_array_1
    (
        .clk(clk),
        .write(write_set1),
        .index(index),
        .datain(tag),
        .dataout(tag_1)
    );

    array #(.width(9)) tag_array_2
    (
        .clk(clk),
        .write(write_set2),
        .index(index),
        .datain(tag),
        .dataout(tag_2)
    );

    array #(.width(128)) data_array_1
    (
        .clk(clk),
        .write(write_set1),
        .index(index),
        .datain(full_new_data_1),
        .dataout(data_1)
    );

    array #(.width(128)) data_array_2
    (
        .clk(clk),
        .write(write_set2),
        .index(index),
        .datain(full_new_data_2),
        .dataout(data_2)
    );

    // hit or not?
    tag_check set_compare
    (
        .input_tag(tag),
        .tag_1(tag_1),
        .tag_2(tag_2),
        .valid_1(valid_1),
        .valid_2(valid_2),
        .data_1(data_1),
        .data_2(data_2),
        .sig(hit),
        .data(full_data_out),
		.tag1_hit(tag1_hit),
		.tag2_hit(tag2_hit)
    );

    // choose between pmem rdata and data from the cache
    mux2 #(.width(128)) memcachedatamux
    (
        .sel(memcachedatamux_sel),
        .a(full_data_out),
        .b(pmem_rdata),
        .f(memcachedatamux_out)
    );

    // select the proper word from the full data line
    mux16 #(.width(16)) data_selector
    (
        .sel(offset),
        .a(memcachedatamux_out[15:0]),
        .b(memcachedatamux_out[23:8]),
        .c(memcachedatamux_out[31:16]),
        .d(memcachedatamux_out[39:24]),
        .e(memcachedatamux_out[47:32]),
        .f(memcachedatamux_out[55:40]),
        .g(memcachedatamux_out[63:48]),
        .h(memcachedatamux_out[71:56]),
        .i(memcachedatamux_out[79:64]),
        .j(memcachedatamux_out[87:72]),
        .k(memcachedatamux_out[95:80]),
        .l(memcachedatamux_out[103:88]),
        .m(memcachedatamux_out[111:96]),
        .n(memcachedatamux_out[119:104]),
        .o(memcachedatamux_out[127:112]),
        .p({8'b0, memcachedatamux_out[127:120]}),
        .out(data_out)
    );

    // add the data word to the extracted data line and output the completed data
    data_insert data_adder
    (
        .offset(offset),
        .input_data(full_data_out),
        .input_word(mem_wdata),
        .mem_byte_enable(mem_byte_enable),
        .output_data(new_data)
    );

    mux2 #(.width(128)) datamux_1
    (
        .sel(datamux_1_sel),
        .a(memcachedatamux_out),
        .b(new_data),
        .f(full_new_data_1)
    );

    mux2 #(.width(128)) datamux_2
    (
        .sel(datamux_2_sel),
        .a(memcachedatamux_out),
        .b(new_data),
        .f(full_new_data_2)
    );

endmodule : cache_datapath
