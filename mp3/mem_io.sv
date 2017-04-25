import lc3b_types::*;

module mem_io
(
    input clk,

    input logic read,
    input logic write,
    input lc3b_word address,
    output lc3b_word rdata,
    output logic resp,

    input lc3b_word rdata_pass,
    input logic resp_pass,
    output logic read_pass,
    output logic write_pass,
    output lc3b_word address_pass,

    // branch counters
    input lc3b_word br_count, br_mispredict_count,
    input lc3b_word icache_hit_count, icache_miss_count,
    input lc3b_word dcache_hit_count, dcache_miss_count,
    input lc3b_word l2_hit_count, l2_miss_count,
    input lc3b_word if_stall_count, mem_stall_count,
    output logic br_count_reset, br_mispredict_count_reset, icache_hit_count_reset,
    output logic icache_miss_count_reset, dcache_hit_count_reset, dcache_miss_count_reset,
    output logic l2_hit_count_reset, l2_miss_count_reset,
    output logic if_stall_count_reset, mem_stall_count_reset
);

always_comb
begin : outputs
    /* Actions for each state */
    if(address == 16'b1111111111110110) begin
        if(read == 1'b1) begin
            rdata = if_stall_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b1;
            mem_stall_count_reset = 1'b0;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else if (address == 16'b1111111111110111) begin
        if(read == 1'b1) begin
            rdata = mem_stall_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b1;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else if (address == 16'b1111111111111000) begin
        if(read == 1'b1) begin
            rdata = icache_hit_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b1;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else if (address == 16'b1111111111111001) begin
        if(read == 1'b1) begin
            rdata = icache_miss_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b1;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else if (address == 16'b1111111111111010) begin
        if(read == 1'b1) begin
            rdata = dcache_hit_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b1;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else if (address == 16'b1111111111111011) begin
        if(read == 1'b1) begin
            rdata = dcache_miss_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b1;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else if (address == 16'b1111111111111100) begin
        if(read == 1'b1) begin
            rdata = l2_hit_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b1;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else if (address == 16'b1111111111111101) begin
        if(read == 1'b1) begin
            rdata = l2_miss_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b1;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else if (address == 16'b1111111111111110) begin
        if(read == 1'b1) begin
            rdata = br_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b1;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else if (address == 16'b1111111111111111) begin
        if(read == 1'b1) begin
            rdata = br_mispredict_count;
            resp = 1'b1;
            read_pass = 1'b0;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else if (write == 1'b1) begin
            rdata = rdata_pass;
            resp = 1'b1;
            read_pass = read;
            address_pass = address;
            write_pass = 1'b0;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b1;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end else begin
            rdata = rdata_pass;
            resp = resp_pass;
            read_pass = read;
            address_pass = address;
            write_pass = write;
            br_count_reset = 1'b0;
            br_mispredict_count_reset = 1'b0;
            icache_hit_count_reset = 1'b0;
            icache_miss_count_reset = 1'b0;
            dcache_hit_count_reset = 1'b0;
            dcache_miss_count_reset = 1'b0;
            l2_hit_count_reset = 1'b0;
            l2_miss_count_reset = 1'b0;
            if_stall_count_reset = 1'b0;
            mem_stall_count_reset = 1'b0;
        end
    end else begin
        rdata = rdata_pass;
        resp = resp_pass;
        read_pass = read;
        address_pass = address;
        write_pass = write;
        br_count_reset = 1'b0;
        br_mispredict_count_reset = 1'b0;
        icache_hit_count_reset = 1'b0;
        icache_miss_count_reset = 1'b0;
        dcache_hit_count_reset = 1'b0;
        dcache_miss_count_reset = 1'b0;
        l2_hit_count_reset = 1'b0;
        l2_miss_count_reset = 1'b0;
        if_stall_count_reset = 1'b0;
        mem_stall_count_reset = 1'b0;
    end
end
endmodule : mem_io
