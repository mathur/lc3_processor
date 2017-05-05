import lc3b_types::*;

module l2_cache_block (
    input clk,
    input lc3b_pmem_addr cache_addr,
    output logic hit,
    output lc3b_pmem_line out_data_block,

    /* Writing logic */
    input load_set_one,
    input load_set_two,
    input lc3b_pmem_line input_data,

    /* Used for LRU */
    output logic set_one_hit,
    output logic set_two_hit,

    output logic set_one_valid,
    output logic set_two_valid,

    output logic set_one_dirty,
    output logic set_two_dirty,

    output lc3b_pmem_line out_data_full,

    output lc3b_pmem_line out_data_set_one_f,
    output lc3b_pmem_line out_data_set_two_f,

    input logic write_type_set_one,
    input logic write_type_set_two,

    output lc3b_cache_tag set_one_tag,
    output lc3b_cache_tag set_two_tag
);

logic out_valid_set_one;
lc3b_cache_tag out_tag_set_one;
lc3b_pmem_line out_data_set_one;

logic out_valid_set_two;
lc3b_cache_tag out_tag_set_two;
lc3b_pmem_line out_data_set_two;

l2_cache_set set_one(
    .clk(clk),
    .in_index(cache_addr[6:4]),
    .out_valid(out_valid_set_one),
    .out_dirty(set_one_dirty),
    .out_tag(out_tag_set_one),
    .out_data(out_data_set_one),
    .set_load(load_set_one),
    .in_data(input_data),
    .in_tag(cache_addr[15:7]),
    .write_type(write_type_set_one)
);

l2_cache_set set_two(
    .clk(clk),
    .in_index(cache_addr[6:4]),
    .out_valid(out_valid_set_two),
    .out_dirty(set_two_dirty),
    .out_tag(out_tag_set_two),
    .out_data(out_data_set_two),
    .set_load(load_set_two),
    .in_data(input_data),
    .in_tag(cache_addr[15:7]),
    .write_type(write_type_set_two)
);

always_comb
begin
    hit = ((cache_addr[15:7] == out_tag_set_one) && out_valid_set_one) || ((cache_addr[15:7] == out_tag_set_two) && out_valid_set_two);
    set_one_hit = (cache_addr[15:7] == out_tag_set_one) && out_valid_set_one;
    set_two_hit = (cache_addr[15:7] == out_tag_set_two) && out_valid_set_two;
    if(set_one_hit) begin
        out_data_full = out_data_set_one;
    end else begin
        out_data_full = out_data_set_two;
    end
end

assign set_one_valid = out_valid_set_one;
assign set_two_valid = out_valid_set_two;
assign out_data_set_one_f = out_data_set_one;
assign out_data_set_two_f = out_data_set_two;
assign set_one_tag = out_tag_set_one;
assign set_two_tag = out_tag_set_two;
assign out_data_block = out_data_full;

endmodule : l2_cache_block



