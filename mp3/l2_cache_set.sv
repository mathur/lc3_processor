import lc3b_types::*;

module l2_cache_set (
    input clk,

    input lc3b_cache_index in_index,

    output logic out_valid,
    output logic out_dirty,
    output lc3b_cache_tag out_tag,
    output lc3b_pmem_line out_data,

    /* Write info */
    input logic set_load,
    input lc3b_pmem_line in_data,
    input lc3b_cache_tag in_tag,
    input logic write_type
);

/* The various elements of the cache set */
logic valid [7:0];
logic dirty [7:0];
lc3b_cache_tag tag  [7:0];
lc3b_pmem_line data [7:0];

/* Initalize everything to zero */
initial
begin
    for (int i = 0; i < 8; i++)
    begin
        valid[i] = 1'b0;
        dirty[i] = 1'b0;
        tag[i]   = 9'b0;
        data[i]  = 128'b0;
   end
end

/* Loading */
always_ff @(posedge clk)
begin
    if (set_load == 1)
    begin
        /* TODO: Implement a if statement here to check if we are doing a Memory write
            or a in cache modification, if it is a in cache modification, then set
            dirty bit

            If from memory write, then just set valid, data and tag (also reset dirty I guess)
        */
        if(write_type == 0) begin
            valid[in_index] = 1;
            dirty[in_index] = 0;
            tag[in_index]   = in_tag;
            data[in_index]  = in_data;
        end
        else begin
            valid[in_index] = 1;
            dirty[in_index] = 1;
            tag[in_index]   = in_tag;
            data[in_index]  = in_data;
        end
    end
end

/* Get Data */
always_comb
begin
    out_valid = valid[in_index];
    out_dirty = dirty[in_index];
    out_tag   = tag[in_index];
    out_data  = data[in_index];
end

endmodule : l2_cache_set