library verilog;
use verilog.vl_types.all;
entity dcache_datapath is
    port(
        clk             : in     vl_logic;
        mem_rdata       : out    vl_logic_vector(15 downto 0);
        mem_address     : in     vl_logic_vector(15 downto 0);
        pmem_wdata      : out    vl_logic_vector(127 downto 0);
        pmem_rdata      : in     vl_logic_vector(127 downto 0);
        load_set_one    : in     vl_logic;
        load_set_two    : in     vl_logic;
        mem_wdata       : in     vl_logic_vector(15 downto 0);
        hit             : out    vl_logic;
        set_one_hit     : out    vl_logic;
        set_two_hit     : out    vl_logic;
        load_lru        : in     vl_logic;
        current_lru     : out    vl_logic;
        set_one_dirty   : out    vl_logic;
        set_two_dirty   : out    vl_logic;
        set_one_valid   : out    vl_logic;
        set_two_valid   : out    vl_logic;
        cache_in_mux_sel: in     vl_logic;
        write_type_set_one: in     vl_logic;
        write_type_set_two: in     vl_logic;
        insert_mux_sel  : in     vl_logic;
        pmem_w_mux_sel  : in     vl_logic;
        set_one_tag     : out    vl_logic_vector(8 downto 0);
        set_two_tag     : out    vl_logic_vector(8 downto 0);
        mem_byte_enable : in     vl_logic_vector(1 downto 0)
    );
end dcache_datapath;
