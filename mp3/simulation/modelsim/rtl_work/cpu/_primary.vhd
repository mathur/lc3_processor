library verilog;
use verilog.vl_types.all;
entity cpu is
    port(
        clk             : in     vl_logic;
        resp_a          : in     vl_logic;
        rdata_a         : in     vl_logic_vector(15 downto 0);
        read_a          : out    vl_logic;
        write_a         : out    vl_logic;
        wmask_a         : out    vl_logic_vector(1 downto 0);
        address_a       : out    vl_logic_vector(15 downto 0);
        wdata_a         : out    vl_logic_vector(15 downto 0);
        resp_b          : in     vl_logic;
        rdata_b         : in     vl_logic_vector(15 downto 0);
        read_b          : out    vl_logic;
        write_b         : out    vl_logic;
        wmask_b         : out    vl_logic_vector(1 downto 0);
        address_b       : out    vl_logic_vector(15 downto 0);
        wdata_b         : out    vl_logic_vector(15 downto 0)
    );
end cpu;
