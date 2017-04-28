library verilog;
use verilog.vl_types.all;
entity cache_block is
    port(
        clk             : in     vl_logic;
        cache_addr      : in     vl_logic_vector(15 downto 0);
        hit             : out    vl_logic;
        out_data_block  : out    vl_logic_vector(15 downto 0);
        load_set_one    : in     vl_logic;
        load_set_two    : in     vl_logic;
        input_data      : in     vl_logic_vector(127 downto 0);
        set_one_hit     : out    vl_logic;
        set_two_hit     : out    vl_logic;
        set_one_valid   : out    vl_logic;
        set_two_valid   : out    vl_logic;
        set_one_dirty   : out    vl_logic;
        set_two_dirty   : out    vl_logic;
        out_data_full   : out    vl_logic_vector(127 downto 0);
        out_data_set_one_f: out    vl_logic_vector(127 downto 0);
        out_data_set_two_f: out    vl_logic_vector(127 downto 0);
        write_type_set_one: in     vl_logic;
        write_type_set_two: in     vl_logic;
        set_one_tag     : out    vl_logic_vector(8 downto 0);
        set_two_tag     : out    vl_logic_vector(8 downto 0);
        mem_byte_enable : in     vl_logic_vector(1 downto 0)
    );
end cache_block;
