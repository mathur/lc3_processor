library verilog;
use verilog.vl_types.all;
entity shiftunit is
    generic(
        width           : integer := 16
    );
    port(
        a               : in     vl_logic;
        d               : in     vl_logic;
        sr              : in     vl_logic_vector;
        imm4            : in     vl_logic_vector(3 downto 0);
        f               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end shiftunit;
