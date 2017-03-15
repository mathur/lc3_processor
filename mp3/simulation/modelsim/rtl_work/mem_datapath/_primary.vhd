library verilog;
use verilog.vl_types.all;
library work;
entity mem_datapath is
    port(
        clk             : in     vl_logic;
        ctrl            : in     work.lc3b_types.lc3b_control_word;
        alu_out         : in     vl_logic_vector(15 downto 0);
        pc_out          : in     vl_logic_vector(15 downto 0);
        br_add_out      : in     vl_logic_vector(15 downto 0);
        sr1_out         : in     vl_logic_vector(15 downto 0);
        instruction     : in     vl_logic_vector(15 downto 0);
        dest            : in     vl_logic_vector(2 downto 0);
        resp_b          : in     vl_logic;
        rdata_b         : in     vl_logic_vector(15 downto 0);
        read_b          : out    vl_logic;
        write_b         : out    vl_logic;
        wmask_b         : out    vl_logic_vector(1 downto 0);
        address_b       : out    vl_logic_vector(15 downto 0);
        wdata_b         : out    vl_logic_vector(15 downto 0);
        regfilemux_out  : out    vl_logic_vector(15 downto 0);
        br_en           : out    vl_logic
    );
end mem_datapath;
