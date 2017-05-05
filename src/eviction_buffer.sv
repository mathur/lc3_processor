import lc3b_types::*;

module eviction_buffer
(
    input logic clk,
    input logic read_in, write_in, resp_in,
    input lc3b_pmem_line wdata_in,
    input lc3b_pmem_addr address_in,
    output logic read_out, write_out, resp_out,
    output lc3b_pmem_line wdata_out,
    output lc3b_pmem_addr address_out,
    output logic writing
);

enum int unsigned {
    /* List of states */
    s_empty,
    s_write_wait,
    s_write
} state, next_state;

logic address_load, wdata_load;

register #(.width(16)) address
(
    .clk(clk),
    .load(address_load),
    .in(address_in),
    .out(address_out),
    .flush(1'b0)
);

register #(.width(128)) wdata
(
    .clk(clk),
    .load(wdata_load),
    .in(wdata_in),
    .out(wdata_out),
    .flush(1'b0)
);

always_comb
begin : state_actions
    /* Default output assignments */
    read_out = read_in;
    write_out = 1'b0;
    resp_out = resp_in;

    address_load = 1'b0;
    wdata_load = 1'b0;

    writing = 1'b0;

    /* Actions for each state */
    unique case (state)
        s_empty: begin
            address_load = 1'b1;
            wdata_load = 1'b1;

            if(write_in == 1'b1) begin
                resp_out = 1'b1;
            end
        end

        s_write_wait: begin
            // nothing
        end

        s_write: begin
            read_out = 1'b0;
            write_out = 1'b1;
            writing = 1'b1;
        end
        default: /* do nothing */;
    endcase
end

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
    next_state = state;

    unique case(state)
        s_empty: begin
            if(write_in == 1'b1) begin
                next_state = s_write_wait;
            end
        end

        s_write_wait: begin
            if(~read_in && ~write_in) begin
                next_state = s_write;
            end
        end

        s_write: begin
            if(resp_in == 1'b1) begin
                next_state = s_empty;
            end
        end
    endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    state <= next_state;
end

endmodule : eviction_buffer

