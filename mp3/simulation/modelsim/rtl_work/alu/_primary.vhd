library verilog;
use verilog.vl_types.all;
library work;
entity alu is
    port(
        alu_op          : in     work.lc3b_types.lc3b_alu_op;
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        f               : out    vl_logic_vector(15 downto 0)
    );
end alu;
