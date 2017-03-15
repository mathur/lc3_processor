library verilog;
use verilog.vl_types.all;
entity if_datapath is
    port(
        clk             : in     vl_logic;
        resp_a          : in     vl_logic;
        rdata_a         : in     vl_logic_vector(15 downto 0);
        read_a          : out    vl_logic;
        address_a       : out    vl_logic_vector(15 downto 0);
        stall           : in     vl_logic;
        br_en           : in     vl_logic;
        pc_br_in        : in     vl_logic_vector(15 downto 0);
        sr1_data_in     : in     vl_logic_vector(15 downto 0);
        pcmux_sel       : in     vl_logic_vector(1 downto 0);
        pc_out          : out    vl_logic_vector(15 downto 0);
        instruction     : out    vl_logic_vector(15 downto 0);
        src1            : out    vl_logic_vector(2 downto 0);
        src2            : out    vl_logic_vector(2 downto 0);
        dest            : out    vl_logic_vector(2 downto 0)
    );
end if_datapath;
