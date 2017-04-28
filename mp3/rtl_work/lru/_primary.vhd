library verilog;
use verilog.vl_types.all;
entity lru is
    port(
        clk             : in     vl_logic;
        lru_index       : in     vl_logic_vector(2 downto 0);
        set_one_hit     : in     vl_logic;
        set_two_hit     : in     vl_logic;
        load_lru        : in     vl_logic;
        lru_of_set      : out    vl_logic
    );
end lru;
