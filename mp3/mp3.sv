import lc3b_types::*;

module mp3 (
	input clk,

    input pmem_resp,
    input lc3b_pmem_line pmem_rdata,
    output logic pmem_read,
    output logic pmem_write,
    output lc3b_pmem_addr pmem_address,
    output lc3b_pmem_line pmem_wdata
);

/* Split memory accesses */
/* Port A */
logic resp_a;
logic [15:0] rdata_a;
logic read_a;
logic write_a;
logic [1:0] wmask_a;
logic [15:0] address_a;
logic [15:0] wdata_a;

/* Port B */
logic resp_b;
logic [15:0] rdata_b;
logic read_b;
logic write_b;
logic [1:0] wmask_b;
logic [15:0] address_b;
logic [15:0] wdata_b;

/* pmem signals from caches to arbiter */
/* Port A */
logic pmem_resp_a, pmem_read_a, pmem_write_a;
lc3b_pmem_line pmem_rdata_a, pmem_wdata_a;
lc3b_pmem_addr pmem_address_a;

/* Port B */
logic pmem_resp_b, pmem_read_b, pmem_write_b;
lc3b_pmem_line pmem_rdata_b, pmem_wdata_b;
lc3b_pmem_addr pmem_address_b;

/* mem_mapped_io */
logic memio_read_pass, memio_resp_pass;
lc3b_word memio_address_pass, memio_rdata_pass;

lc3b_word br_count, br_mispredict_count;

/* l2 */
logic l2_resp, l2_read, l2_write;
lc3b_pmem_line l2_rdata, l2_wdata;
lc3b_pmem_addr l2_address;

cpu mcpu (
	.clk(clk),

    /* Port A */
    .read_a,
    .write_a,
    .wmask_a,
    .address_a,
    .wdata_a,
    .resp_a,
    .rdata_a,

    /* Port B */
    .read_b,
    .write_b,
    .wmask_b,
    .address_b,
    .wdata_b,
    .resp_b,
    .rdata_b,

    // counters
    .br_count,
    .br_mispredict_count
);

mem_io mem_mapped_io (
    .clk(clk),
    .read(read_b),
    .address(address_b),
    .rdata(rdata_b),
    .resp(resp_b),
    .read_pass(memio_read_pass),
    .address_pass(memio_address_pass),
    .rdata_pass(memio_rdata_pass),
    .resp_pass(memio_resp_pass),

    //counters
    .br_count(br_count),
    .br_mispredict_count(br_mispredict_count)
);

cache icache (
    .clk(clk),

    /* Memory signals from cpu */
    .mem_resp(resp_a),
    .mem_rdata(rdata_a),
    .mem_read(read_a),
    .mem_write(write_a),
    .mem_byte_enable(wmask_a),
    .mem_address(address_a),
    .mem_wdata(wdata_a),

    /* Memory signals from main memory */
    .pmem_resp(pmem_resp_a),
    .pmem_rdata(pmem_rdata_a),
    .pmem_read(pmem_read_a),
    .pmem_write(pmem_write_a),
    .pmem_address(pmem_address_a),
    .pmem_wdata(pmem_wdata_a)
);

cache dcache (
    .clk(clk),

    /* Memory signals from cpu */
    .mem_resp(memio_resp_pass),
    .mem_rdata(memio_rdata_pass),
    .mem_read(memio_read_pass),
    .mem_write(write_b),
    .mem_byte_enable(wmask_b),
    .mem_address(memio_address_pass),
    .mem_wdata(wdata_b),

    /* Memory signals from main memory */
    .pmem_resp(pmem_resp_b),
    .pmem_rdata(pmem_rdata_b),
    .pmem_read(pmem_read_b),
    .pmem_write(pmem_write_b),
    .pmem_address(pmem_address_b),
    .pmem_wdata(pmem_wdata_b)
);

arbiter cache_arbiter (
    .clk(clk),

    /* Port A */
    .pmem_read_a(pmem_read_a),
    .pmem_write_a(pmem_write_a),
    .pmem_wdata_a(pmem_wdata_a),
    .pmem_address_a(pmem_address_a),
    .pmem_resp_a(pmem_resp_a),
    .pmem_rdata_a(pmem_rdata_a),

    /* Port B */
    .pmem_read_b(pmem_read_b),
    .pmem_write_b(pmem_write_b),
    .pmem_wdata_b(pmem_wdata_b),
    .pmem_address_b(pmem_address_b),
    .pmem_resp_b(pmem_resp_b),
    .pmem_rdata_b(pmem_rdata_b),

    /* Pmem */
    .pmem_resp(l2_resp),
    .pmem_rdata(l2_rdata),
    .pmem_read(l2_read),
    .pmem_write(l2_write),
    .pmem_wdata(l2_wdata),
    .pmem_address(l2_address)
);

l2_cache l2cache (
    .clk(clk),

    /* Memory signals from cpu */
    .mem_resp(l2_resp),
    .mem_rdata(l2_rdata),
    .mem_read(l2_read),
    .mem_write(l2_write),
    .mem_address(l2_address),
    .mem_wdata(l2_wdata),

    /* Memory signals from main memory */
    .pmem_resp(pmem_resp),
    .pmem_rdata(pmem_rdata),
    .pmem_read(pmem_read),
    .pmem_write(pmem_write),
    .pmem_address(pmem_address),
    .pmem_wdata(pmem_wdata)
);

endmodule: mp3