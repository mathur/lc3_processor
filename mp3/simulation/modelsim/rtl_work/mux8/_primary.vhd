library verilog;
use verilog.vl_types.all;
entity mux8 is
    generic(
        width           : integer := 16
    );
    port(
        sel             : in     vl_logic_vector(2 downto 0);
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        c               : in     vl_logic_vector;
        d               : in     vl_logic_vector;
        e               : in     vl_logic_vector;
        f               : in     vl_logic_vector;
        g               : in     vl_logic_vector;
        h               : in     vl_logic_vector;
        i               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end mux8;
