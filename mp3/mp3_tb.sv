module mp3_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;

/* Port A */
logic read_a;
logic write_a;
logic [1:0] wmask_a;
logic [15:0] address_a;
logic [15:0] wdata_a;
logic resp_a;
logic [15:0] rdata_a;

/* Port B */
logic read_b;
logic write_b;
logic [1:0] wmask_b;
logic [15:0] address_b;
logic [15:0] wdata_b;
logic resp_b;
logic [15:0] rdata_b;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

mp3 dut
(
    .clk,

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
    .rdata_b
);

magic_memory_dp memory
(
    .clk,

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
    .rdata_b
);

endmodule : mp3_tb
