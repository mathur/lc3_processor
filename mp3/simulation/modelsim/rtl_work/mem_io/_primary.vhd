library verilog;
use verilog.vl_types.all;
entity mem_io is
    port(
        clk             : in     vl_logic;
        read            : in     vl_logic;
        write           : in     vl_logic;
        address         : in     vl_logic_vector(15 downto 0);
        rdata           : out    vl_logic_vector(15 downto 0);
        resp            : out    vl_logic;
        rdata_pass      : in     vl_logic_vector(15 downto 0);
        resp_pass       : in     vl_logic;
        read_pass       : out    vl_logic;
        write_pass      : out    vl_logic;
        address_pass    : out    vl_logic_vector(15 downto 0);
        br_count        : in     vl_logic_vector(15 downto 0);
        br_mispredict_count: in     vl_logic_vector(15 downto 0);
        icache_hit_count: in     vl_logic_vector(15 downto 0);
        icache_miss_count: in     vl_logic_vector(15 downto 0);
        dcache_hit_count: in     vl_logic_vector(15 downto 0);
        dcache_miss_count: in     vl_logic_vector(15 downto 0);
        l2_hit_count    : in     vl_logic_vector(15 downto 0);
        l2_miss_count   : in     vl_logic_vector(15 downto 0);
        if_stall_count  : in     vl_logic_vector(15 downto 0);
        mem_stall_count : in     vl_logic_vector(15 downto 0);
        br_count_reset  : out    vl_logic;
        br_mispredict_count_reset: out    vl_logic;
        icache_hit_count_reset: out    vl_logic;
        icache_miss_count_reset: out    vl_logic;
        dcache_hit_count_reset: out    vl_logic;
        dcache_miss_count_reset: out    vl_logic;
        l2_hit_count_reset: out    vl_logic;
        l2_miss_count_reset: out    vl_logic;
        if_stall_count_reset: out    vl_logic;
        mem_stall_count_reset: out    vl_logic
    );
end mem_io;
