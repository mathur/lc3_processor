library verilog;
use verilog.vl_types.all;
entity cache_control is
    port(
        clk             : in     vl_logic;
        mem_resp        : out    vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        pmem_resp       : in     vl_logic;
        pmem_read       : out    vl_logic;
        pmem_write      : out    vl_logic;
        load_set_one    : out    vl_logic;
        load_set_two    : out    vl_logic;
        set_one_hit     : in     vl_logic;
        set_two_hit     : in     vl_logic;
        load_lru        : out    vl_logic;
        current_lru     : in     vl_logic;
        set_one_valid   : in     vl_logic;
        set_two_valid   : in     vl_logic;
        set_one_dirty   : in     vl_logic;
        set_two_dirty   : in     vl_logic;
        hit             : in     vl_logic;
        cache_in_mux_sel: out    vl_logic;
        write_type_set_one: out    vl_logic;
        write_type_set_two: out    vl_logic;
        insert_mux_sel  : out    vl_logic;
        pmem_w_mux_sel  : out    vl_logic;
        mem_address_in  : in     vl_logic_vector(15 downto 0);
        mem_address_out : out    vl_logic_vector(15 downto 0);
        pmem_address    : out    vl_logic_vector(15 downto 0);
        set_one_tag     : in     vl_logic_vector(8 downto 0);
        set_two_tag     : in     vl_logic_vector(8 downto 0);
        insert_enable   : out    vl_logic
    );
end cache_control;
