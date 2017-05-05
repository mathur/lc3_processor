import lc3b_types::*;

module l2_cache (
    input clk,

    /* Memory signals from cpu */
    output mem_resp,
    output lc3b_pmem_line mem_rdata,
    input mem_read,
    input mem_write,
    input lc3b_word mem_address,
    input lc3b_pmem_line mem_wdata,

    /* Memory signals from main memory */
    input pmem_resp,
    input lc3b_pmem_line pmem_rdata,
    output pmem_read,
    output pmem_write,

    output lc3b_pmem_addr pmem_address,
    output lc3b_pmem_line pmem_wdata
);

logic load_set_one, load_set_two, set_one_hit, set_two_hit, load_lru, current_lru, set_one_valid;
logic set_two_valid, set_one_dirty, set_two_dirty, cache_in_mux_sel, hit, write_type_set_one, write_type_set_two;
logic insert_mux_sel, pmem_w_mux_sel;
lc3b_cache_tag set_one_tag, set_two_tag;

l2_cache_datapath cdp(
    .clk(clk),
    .mem_rdata(mem_rdata),
    .mem_address(mem_address),
    .pmem_rdata(pmem_rdata),
    .pmem_wdata(pmem_wdata),
    .load_set_one(load_set_one),
    .load_set_two(load_set_two),
    .mem_wdata(mem_wdata),
    .set_one_hit(set_one_hit),
    .set_two_hit(set_two_hit),
    .load_lru(load_lru),
    .current_lru(current_lru),
    .set_one_valid(set_one_valid),
    .set_two_valid(set_two_valid),
    .set_one_dirty(set_one_dirty),
    .set_two_dirty(set_two_dirty),
    .hit(hit),
    .cache_in_mux_sel(cache_in_mux_sel),
    .write_type_set_one(write_type_set_one),
    .write_type_set_two(write_type_set_two),
    .insert_mux_sel(insert_mux_sel),
    .pmem_w_mux_sel(pmem_w_mux_sel),
    .set_one_tag(set_one_tag),
    .set_two_tag(set_two_tag)
);

l2_cache_control ccl(
    .clk(clk),
    .mem_resp(mem_resp),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .pmem_resp(pmem_resp),
    .pmem_read(pmem_read),
    .pmem_write(pmem_write),
    .load_set_one(load_set_one),
    .load_set_two(load_set_two),
    .set_one_hit(set_one_hit),
    .set_two_hit(set_two_hit),
    .load_lru(load_lru),
    .current_lru(current_lru),
    .set_one_valid(set_one_valid),
    .set_two_valid(set_two_valid),
    .set_one_dirty(set_one_dirty),
    .set_two_dirty(set_two_dirty),
    .hit(hit),
    .cache_in_mux_sel(cache_in_mux_sel),
    .write_type_set_one(write_type_set_one),
    .write_type_set_two(write_type_set_two),
    .insert_mux_sel(insert_mux_sel),
    .pmem_w_mux_sel(pmem_w_mux_sel),
    .mem_address(mem_address),
    .pmem_address(pmem_address),
    .set_one_tag(set_one_tag),
    .set_two_tag(set_two_tag)
);

endmodule : l2_cache
