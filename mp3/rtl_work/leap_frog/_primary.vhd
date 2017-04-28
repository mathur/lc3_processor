library verilog;
use verilog.vl_types.all;
library work;
entity leap_frog is
    port(
        clk             : in     vl_logic;
        memstall        : in     vl_logic;
        ex_dest         : in     vl_logic_vector(2 downto 0);
        mem_dest        : in     vl_logic_vector(2 downto 0);
        ex_sr1          : in     vl_logic_vector(2 downto 0);
        ex_sr2          : in     vl_logic_vector(2 downto 0);
        ex_crtl         : in     work.lc3b_types.lc3b_control_word;
        leap_frog_data_mux: out    vl_logic;
        leap_frog_reg_mux: out    vl_logic;
        mem_load_cc     : out    vl_logic;
        other_stage_stall_override: out    vl_logic
    );
end leap_frog;
