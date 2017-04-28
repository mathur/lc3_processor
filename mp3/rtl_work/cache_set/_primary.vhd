library verilog;
use verilog.vl_types.all;
entity cache_set is
    port(
        clk             : in     vl_logic;
        in_index        : in     vl_logic_vector(2 downto 0);
        out_valid       : out    vl_logic;
        out_dirty       : out    vl_logic;
        out_tag         : out    vl_logic_vector(8 downto 0);
        out_data        : out    vl_logic_vector(127 downto 0);
        set_load        : in     vl_logic;
        in_data         : in     vl_logic_vector(127 downto 0);
        in_tag          : in     vl_logic_vector(8 downto 0);
        write_type      : in     vl_logic
    );
end cache_set;
