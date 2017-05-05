import lc3b_types::*;

module dcache_control (
    input clk,

    /* Memory signals from cpu */
    output logic mem_resp,
    input mem_read,
	 input mem_write,

    /* Memory signals to/from main memory */
    input pmem_resp,
    output logic pmem_read,
    output logic pmem_write,

    output logic load_set_one,
    output logic load_set_two,

    input set_one_hit,
    input set_two_hit,

    output logic load_lru,
    input  current_lru,

    input set_one_valid,
    input set_two_valid,

	 input set_one_dirty,
	 input set_two_dirty,

    input hit,

    output logic cache_in_mux_sel,
	 output logic write_type_set_one,
	 output logic write_type_set_two,
	 output logic insert_mux_sel,
	 output logic pmem_w_mux_sel,

	 input lc3b_word mem_address,
	 output lc3b_pmem_addr pmem_address,

	 input lc3b_cache_tag set_one_tag,
	 input lc3b_cache_tag set_two_tag
);

enum int unsigned {
    /* List of states */
    hit_s,
    write_back_s,
    fetch_s,
    write_s
} state, next_state;

always_comb
begin : state_actions
    mem_resp     = 0;
    pmem_read    = 0;
    load_set_one = 0;
    load_set_two = 0;
	 load_lru     = 0;
    cache_in_mux_sel = mem_write;
	 write_type_set_one = 0;
	 write_type_set_two = 0;
	 pmem_write = 0;
	 pmem_w_mux_sel = 0;
	 insert_mux_sel = 0;
	 pmem_address = (mem_address & 16'b1111111111110000);
	 
		case(state)
        hit_s: begin
            if((mem_read) && (hit)) begin
                mem_resp = 1;
                /* Update LRU as well */
                load_lru = 1;
            end
			if((mem_write) && (hit)) begin
				mem_resp = 1;
				load_lru = 1;
				if(set_one_hit) begin
					load_set_one = 1;
					write_type_set_one = 1;
					cache_in_mux_sel = 1;
				end else if(set_two_hit) begin
					load_set_two = 1;
					write_type_set_two = 1;
					cache_in_mux_sel = 1;
				end
			end
		end

        write_back_s: begin
            if (current_lru == 0) begin
              pmem_write = 1;
              pmem_w_mux_sel = 0;
              pmem_address = {set_one_tag, mem_address[6:4], 4'b0000};
            end else if(current_lru == 1) begin
              pmem_write = 1;
              pmem_w_mux_sel = 1;
              pmem_address = {set_two_tag, mem_address[6:4], 4'b0000};
            end
        end
		  
		fetch_s: begin
			pmem_read = 1;
		end

        write_s: begin
			if (current_lru == 0) begin
			    /* Set one is LRU, replace */
			    load_set_one = 1;
			    cache_in_mux_sel = mem_write;
			    write_type_set_one = mem_write;
			    insert_mux_sel = 1;
			end else if (current_lru == 1) begin
			    /* Set two is LRU, replace */
			    load_set_two = 1;
			    cache_in_mux_sel = mem_write;
			    write_type_set_two = mem_write;
			    insert_mux_sel = 1;
			end
        end
    endcase
end : state_actions

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
    next_state = state;

    case(state)
        hit_s: begin
                    if((mem_read || mem_write) && ~hit) begin
                            if(set_one_dirty && (current_lru == 0)) begin
                                next_state = write_back_s;
                            end else if(set_two_dirty && (current_lru == 1)) begin
                                next_state = write_back_s;
                            end else begin
                                next_state = fetch_s;
                            end
                    end
        end

		write_back_s: begin
            if(!pmem_resp)
					next_state = write_back_s;
            else
					next_state = fetch_s;
        end

		fetch_s: begin
			if(!pmem_resp) begin
				next_state = fetch_s;
			end else begin
				next_state = write_s;
			end
		end

		write_s: begin
			next_state = hit_s;
		end
	endcase
end : next_state_logic

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
     state <= next_state;
end : next_state_assignment

endmodule : dcache_control
