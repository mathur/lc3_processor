library verilog;
use verilog.vl_types.all;
entity benable is
    port(
        n               : in     vl_logic;
        z               : in     vl_logic;
        p               : in     vl_logic;
        nr              : in     vl_logic;
        zr              : in     vl_logic;
        pr              : in     vl_logic;
        enable          : out    vl_logic
    );
end benable;
