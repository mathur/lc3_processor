import lc3b_types::*;

module cache_control
(
    input           logic           clk,
    input           logic           hit,
    input           logic           mem_read,
    input           logic           pmem_resp,
    input           logic           lru_out,
	input			logic           tag1_hit, tag2_hit,
    input           logic           dirty_1, dirty_2,
    input           lc3b_word       mem_address,
    input           logic[8:0]      tag_1, tag_2,
    input           logic[127:0]    data_1, data_2,
    input           logic[2:0]      index,
    input           logic           mem_write,
    output          logic           memcachedatamux_sel,
    output          logic           mem_resp,
    output          logic           pmem_read,
    output          logic           write_set1,
    output          logic           write_set2,
    output          logic           write_lru,
    output          logic           lru_val,
    output          logic[15:0]     pmem_address,
    output          logic[127:0]    pmem_wdata,
    output          logic           pmem_write,
    output          logic           dirty_in,
    output          logic           datamux_1_sel,
    output          logic           datamux_2_sel
);

enum int unsigned {
    /* List of states */
    s_hit,
    s_fetch,
    s_write_pmem,
    s_write_cache
} state, next_state;

always_comb
begin : state_actions
    /* Default output assignments */
    mem_resp = 1'b0;
    memcachedatamux_sel = 1'b0;
    write_set1 = 1'b0;
    write_set2 = 1'b0;
    pmem_read = 1'b0;
    write_lru = 1'b0;
    lru_val = 1'b0;
    pmem_address = {mem_address[15:3], 3'b0};
    pmem_write = 1'b0;
    pmem_wdata = 128'b0;
    dirty_in = 1'b0;
    datamux_1_sel = 1'b0;
    datamux_2_sel = 1'b0;

    /* Actions for each state */
    case (state)
        s_hit: begin
            if((mem_read == 1'b1 || mem_write == 1'b1) && hit == 1'b1) begin
                mem_resp = 1'b1;
				 write_lru = 1'b1;
				 if(tag1_hit == 1'b1) begin
						lru_val = 1'b1;
				 end else begin
						lru_val = 1'b0;
				 end
            end
        end

        s_fetch: begin
            mem_resp = 1'b0;
            memcachedatamux_sel = 1'b1;
            pmem_read = 1'b1;
        end

        s_write_pmem: begin
            memcachedatamux_sel = 1'b1;
            if(lru_out == 1'b0 && dirty_1 == 1'b1) begin
                // set 1 is going to be replaced and is dirty
                // write set 1 data line to memory
                pmem_address = {tag_1, index, 3'b0};
                pmem_wdata = data_1;
                pmem_write = 1'b1;
            end else if (lru_out == 1'b1 && dirty_2 == 1'b1) begin
                // set 2 is going to be replaced and is dirty
                // write set 2 data line to memory
                pmem_address = {tag_2, index, 3'b0};
                pmem_wdata = data_2;
                pmem_write = 1'b1;
            end
        end

        s_write_cache: begin
            if(mem_write == 1'b1) begin
                dirty_in = 1'b1;
                datamux_1_sel = 1'b1;
                datamux_2_sel = 1'b1;
            end else begin
                memcachedatamux_sel = 1'b1;
            end
			write_lru = 1'b1;
            if(lru_out == 1'b0) begin
                // set 1 is going to be replaced
                write_set1 = 1'b1;
                lru_val = 1'b1;
            end else begin
                // set 2 is going to be replaced
                write_set2 = 1'b1;
                lru_val = 1'b0;
            end
        end
        default: /* do nothing */;
    endcase
end

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
    next_state = state;

    case(state)
        s_hit: begin
            if(mem_read == 1'b1 && hit == 1'b0) begin
                // we had a miss, time to fetch from physical memory
                next_state = s_fetch;
            end else if(mem_write == 1'b1) begin
                next_state = s_write_cache;
            end
        end

        s_fetch: begin
            if(pmem_resp == 1'b1) begin
                // pmem is done, time to check LRU before overwriting in cache
                next_state = s_write_pmem;
            end
        end

        s_write_pmem: begin
            if(pmem_resp == 1'b1) begin
                // pmem is done, time to return the data
                next_state = s_write_cache;
            end else if((lru_out == 1'b0 && dirty_1 == 1'b0) || (lru_out == 1'b1 && dirty_2 == 1'b0)) begin
                // not dirty, so no need to stick around
                next_state = s_write_cache;
            end
        end

        s_write_cache: begin
            next_state = s_hit;
        end
    endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    state <= next_state;
end

endmodule : cache_control
