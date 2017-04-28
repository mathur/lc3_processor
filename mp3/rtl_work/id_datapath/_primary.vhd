library verilog;
use verilog.vl_types.all;
library work;
entity id_datapath is
    port(
        clk             : in     vl_logic;
        inst            : in     vl_logic_vector(15 downto 0);
        ctrl            : out    work.lc3b_types.lc3b_control_word;
        dest            : in     vl_logic_vector(2 downto 0);
        sr1             : in     vl_logic_vector(2 downto 0);
        sr2             : in     vl_logic_vector(2 downto 0);
        wb_dest_addr    : in     vl_logic_vector(2 downto 0);
        wb_dest_data    : in     vl_logic_vector(15 downto 0);
        wb_load_dest    : in     vl_logic;
        destmux_out     : out    vl_logic_vector(2 downto 0);
        sr1_out         : out    vl_logic_vector(15 downto 0);
        sr2_out         : out    vl_logic_vector(15 downto 0)
    );
end id_datapath;
