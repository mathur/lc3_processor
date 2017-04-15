import lc3b_types::*;

module mem_io
(
    input clk,

    input logic read,
    input lc3b_word address,
    output lc3b_word rdata,
    output logic resp,

    input lc3b_word rdata_pass,
    input logic resp_pass,
    output logic read_pass,
    output logic address_pass,

    // branch counters
    input lc3b_word br_count, br_mispredict_count,
    input lc3b_word icache_hit_count, icache_miss_count, dcache_hit_count, dcache_miss_count, l2_hit_count, l2_miss_count
);

always_comb
begin : outputs
    /* Default output assignments */
    rdata = rdata_pass;
    resp = resp_pass;

    read_pass = read;
    address_pass = address;

    /* Actions for each state */
    case (address)
        4'hFFF8: begin
            read_pass = 1'b0;
            rdata = icache_hit_count;
            resp = 1'b1;
        end

        4'hFFF9: begin
            read_pass = 1'b0;
            rdata = icache_miss_count;
            resp = 1'b1;
        end

        4'hFFFA: begin
            read_pass = 1'b0;
            rdata = dcache_hit_count;
            resp = 1'b1;
        end

        4'hFFFB: begin
            read_pass = 1'b0;
            rdata = dcache_miss_count;
            resp = 1'b1;
        end

        4'hFFFC: begin
            read_pass = 1'b0;
            rdata = l2_hit_count;
            resp = 1'b1;
        end

        4'hFFFD: begin
            read_pass = 1'b0;
            rdata = l2_miss_count;
            resp = 1'b1;
        end

        4'hFFFE: begin
            read_pass = 1'b0;
            rdata = br_count;
            resp = 1'b1;
        end

        4'hFFFF: begin
            read_pass = 1'b0;
            rdata = br_mispredict_count;
            resp = 1'b1;
        end
        default: /* do nothing */;
    endcase
end
endmodule : mem_io
