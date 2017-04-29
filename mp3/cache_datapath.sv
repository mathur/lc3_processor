import lc3b_types::*;

module cache_datapath (
    input clk,
    output lc3b_word mem_rdata,
    input lc3b_word mem_address,
	 output lc3b_pmem_line pmem_wdata,

    input lc3b_pmem_line pmem_rdata,

    input load_set_one,
    input load_set_two,

    input lc3b_word mem_wdata,

    output hit,

    output set_one_hit,
    output set_two_hit,

    input load_lru,
    output current_lru,
	 
	 output set_one_dirty,
	 output set_two_dirty,
	 
    output set_one_valid,
    output set_two_valid,

    input cache_in_mux_sel,
	 input logic write_type_set_one,
	 input logic write_type_set_two,
	 
	 input logic insert_mux_sel,
	 input logic pmem_w_mux_sel,
	 
	 output lc3b_cache_tag set_one_tag,
	 output lc3b_cache_tag set_two_tag,

     input lc3b_mem_wmask mem_byte_enable,
	  input logic insert_enable
);

logic hit_sig;
lc3b_pmem_line full_data;
lc3b_pmem_line insert_data;
lc3b_pmem_line cache_in_data;
lc3b_pmem_line cache_set_one_data;
lc3b_pmem_line cache_set_two_data;
lc3b_pmem_line insert_mux_out;

mux2 #(.width(128)) cache_in_mux (
    .a(pmem_rdata),
    .b(insert_data),
    .sel(cache_in_mux_sel),
    .f(cache_in_data)
);

mux2 #(.width(128)) pmem_write_mux (
    .a(cache_set_one_data),
    .b(cache_set_two_data),
    .sel(pmem_w_mux_sel),
    .f(pmem_wdata)
);

mux2 #(.width(128)) insert_mux (
    .a(full_data),
    .b(pmem_rdata),
    .sel(insert_mux_sel),
    .f(insert_mux_out)
);

byte_insert binsert (
    .sel_index(mem_address[3:0]),
    .write_data(mem_wdata),
    .input_data(insert_mux_out),
    .mem_byte_enable(mem_byte_enable),
    .output_data(insert_data),
	 .enable(insert_enable)
);

cache_block main_block (
    .clk(clk),
    .cache_addr(mem_address),
    .hit(hit_sig),
    .out_data_block(mem_rdata),
    .load_set_one(load_set_one),
    .load_set_two(load_set_two),
    .input_data(cache_in_data),
    .set_one_hit(set_one_hit),
    .set_two_hit(set_two_hit),
    .set_one_valid(set_one_valid),
    .set_two_valid(set_two_valid),
	 .set_one_dirty(set_one_dirty),
    .set_two_dirty(set_two_dirty),
    .out_data_full(full_data),
	 .write_type_set_one(write_type_set_one),
	 .write_type_set_two(write_type_set_two),
	 .out_data_set_one_f(cache_set_one_data),
	 .out_data_set_two_f(cache_set_two_data),
	 .set_one_tag(set_one_tag),
	 .set_two_tag(set_two_tag),
	 .mem_byte_enable(mem_byte_enable)
);

lru main_lru (
    .clk(clk),
    .lru_index(mem_address[6:4]),
    .set_one_hit(set_one_hit),
    .set_two_hit(set_two_hit),
    .load_lru(load_lru),
    .lru_of_set(current_lru)
);

assign hit = hit_sig;

endmodule : cache_datapath