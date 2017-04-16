library verilog;
use verilog.vl_types.all;
entity forwarding_unit is
    port(
        id_ex_r_one     : in     vl_logic_vector(2 downto 0);
        id_ex_r_two     : in     vl_logic_vector(2 downto 0);
        ex_mem_r_dest   : in     vl_logic_vector(2 downto 0);
        mem_wb_r_dest   : in     vl_logic_vector(2 downto 0);
        ex_mem_regfile_write: in     vl_logic;
        mem_wb_regfile_write: in     vl_logic;
        forward_a       : out    vl_logic_vector(1 downto 0);
        forward_b       : out    vl_logic_vector(1 downto 0)
    );
end forwarding_unit;