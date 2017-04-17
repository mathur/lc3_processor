library verilog;
use verilog.vl_types.all;
library work;
entity \buffer\ is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        flush           : in     vl_logic;
        src1_in         : in     vl_logic_vector(2 downto 0);
        src2_in         : in     vl_logic_vector(2 downto 0);
        dest_in         : in     vl_logic_vector(2 downto 0);
        br_in           : in     vl_logic;
        instruction_in  : in     vl_logic_vector(15 downto 0);
        alu_in          : in     vl_logic_vector(15 downto 0);
        pc_in           : in     vl_logic_vector(15 downto 0);
        pc_br_in        : in     vl_logic_vector(15 downto 0);
        mar_in          : in     vl_logic_vector(15 downto 0);
        mdr_in          : in     vl_logic_vector(15 downto 0);
        src1_data_in    : in     vl_logic_vector(15 downto 0);
        src2_data_in    : in     vl_logic_vector(15 downto 0);
        dest_data_in    : in     vl_logic_vector(15 downto 0);
        ctrl_in         : in     work.lc3b_types.lc3b_control_word;
        ctrl_out        : out    work.lc3b_types.lc3b_control_word;
        src1_out        : out    vl_logic_vector(2 downto 0);
        src2_out        : out    vl_logic_vector(2 downto 0);
        dest_out        : out    vl_logic_vector(2 downto 0);
        instruction_out : out    vl_logic_vector(15 downto 0);
        alu_out         : out    vl_logic_vector(15 downto 0);
        pc_out          : out    vl_logic_vector(15 downto 0);
        pc_br_out       : out    vl_logic_vector(15 downto 0);
        mar_out         : out    vl_logic_vector(15 downto 0);
        mdr_out         : out    vl_logic_vector(15 downto 0);
        src1_data_out   : out    vl_logic_vector(15 downto 0);
        src2_data_out   : out    vl_logic_vector(15 downto 0);
        dest_data_out   : out    vl_logic_vector(15 downto 0);
        br_out          : out    vl_logic
    );
end \buffer\;
