library verilog;
use verilog.vl_types.all;
entity ir is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        resp            : in     vl_logic;
        flush           : in     vl_logic;
        \in\            : in     vl_logic_vector(15 downto 0);
        instruction     : out    vl_logic_vector(15 downto 0);
        dest            : out    vl_logic_vector(2 downto 0);
        src1            : out    vl_logic_vector(2 downto 0);
        src2            : out    vl_logic_vector(2 downto 0)
    );
end ir;
