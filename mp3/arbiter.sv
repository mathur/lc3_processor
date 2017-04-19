import lc3b_types::*;

module arbiter
(
    input   logic           clk,

    /* Port A */
    input   logic           pmem_read_a,
    input   logic           pmem_write_a,
    input   lc3b_pmem_line  pmem_wdata_a,
    input   lc3b_pmem_addr  pmem_address_a,
    output  logic           pmem_resp_a,
    output  lc3b_pmem_line  pmem_rdata_a,

    /* Port B */
    input   logic           pmem_read_b,
    input   logic           pmem_write_b,
    input   lc3b_pmem_line  pmem_wdata_b,
    input   lc3b_pmem_addr  pmem_address_b,
    output  logic           pmem_resp_b,
    output  lc3b_pmem_line  pmem_rdata_b,

    /* Pmem */
    input   logic           pmem_resp,
    input   lc3b_pmem_line  pmem_rdata,
    output  logic           pmem_read,
    output  logic           pmem_write,
    output  lc3b_pmem_line  pmem_wdata,
    output  lc3b_pmem_addr  pmem_address
);

enum int unsigned {
    /* List of states */
    s_ready,
    s_read,
    s_write
} state, next_state;

enum int unsigned {
    /* List of states */
    a_read,
    a_write,
    b_read,
    b_write,
    none
} new_operation, curr_operation;

logic operation_load;
logic rdata_a_load, rdata_b_load;

register #(.width(128)) rdata_a
(
    .clk(clk),
    .load(rdata_a_load),
    .in(pmem_rdata),
    .out(pmem_rdata_a),
    .flush(1'b0)
);

register #(.width(128)) rdata_b
(
    .clk(clk),
    .load(rdata_b_load),
    .in(pmem_rdata),
    .out(pmem_rdata_b),
    .flush(1'b0)
);

always_ff @(posedge clk)
begin: operation_assignment
    /* Assignment of operation instruction on clock edge */
    if(operation_load) begin
        curr_operation = new_operation;
    end else begin
        curr_operation = curr_operation;
    end
end

always_comb
begin : state_actions
    /* Default output assignments */
    operation_load = 1'b0;
    new_operation = none;

    /* Port A */
    pmem_resp_a = 1'b0;
	 rdata_a_load = 1'b0;

    /* Port B */
    pmem_resp_b = 1'b0;
	 rdata_b_load = 1'b0;

    /* Pmem */
    pmem_read = 1'b0;
    pmem_write = 1'b0;
    pmem_wdata = 128'b0;
    pmem_address = 16'b0;

    /* Actions for each state */
    unique case (state)
        s_ready: begin
            operation_load = 1'b1;
            if (pmem_read_b == 1'b1) begin
                new_operation = b_read;
            end else if (pmem_write_b == 1'b1) begin
                new_operation = b_write;
            end else if (pmem_read_a == 1'b1) begin
                new_operation = a_read;
            end else if (pmem_write_a == 1'b1) begin
                new_operation = a_write;
            end else begin
                new_operation = none;
            end
        end

        s_read: begin
            if (curr_operation == b_read && pmem_resp == 1'b1) begin
                pmem_address = pmem_address_b;
                pmem_read = 1'b1;
                rdata_b_load = 1'b1;
                pmem_resp_b = 1'b1;
            end else if (curr_operation == a_read && pmem_resp == 1'b1) begin
                pmem_address = pmem_address_a;
                pmem_read = 1'b1;
                rdata_a_load = 1'b1;
                pmem_resp_a = 1'b1;
            end else if (curr_operation == b_read) begin
                pmem_address = pmem_address_b;
                pmem_read = 1'b1;
            end else if (curr_operation == a_read) begin
                pmem_address = pmem_address_a;
                pmem_read = 1'b1;
            end
        end

        s_write: begin
            if (curr_operation == b_write && pmem_resp == 1'b1) begin
                pmem_address = pmem_address_b;
                pmem_resp_b = 1'b1;
            end else if (curr_operation == a_write && pmem_resp == 1'b1) begin
                pmem_address = pmem_address_a;
                pmem_resp_a = 1'b1;
            end else if (curr_operation == b_write) begin
                pmem_address = pmem_address_b;
                pmem_wdata = pmem_wdata_b;
                pmem_write = 1'b1;
            end else if (curr_operation == a_write) begin
                pmem_address = pmem_address_a;
                pmem_wdata = pmem_wdata_a;
                pmem_write = 1'b1;
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

    unique case(state)
        s_ready: begin
            if (pmem_read_b == 1'b1) begin
                next_state = s_read;
            end else if (pmem_write_b == 1'b1) begin
                next_state = s_write;
            end else if (pmem_read_a == 1'b1) begin
                next_state = s_read;
            end else if (pmem_write_a == 1'b1) begin
                next_state = s_write;
            end
        end

        s_read: begin
            if (pmem_resp == 1'b1) begin
                next_state = s_ready;
            end
        end

        s_write: begin
            if (pmem_resp == 1'b1) begin
                next_state = s_ready;
            end
        end
    endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    state <= next_state;
end

endmodule : arbiter
