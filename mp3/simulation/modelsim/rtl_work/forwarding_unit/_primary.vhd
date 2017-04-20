library verilog;
use verilog.vl_types.all;
entity forwarding_unit is
    port(
        id_ex_r_one     : in     vl_logic_vector(2 downto 0);
        id_ex_r_two     : in     vl_logic_vector(2 downto 0);
        ex_mem_r_dest   : in     vl_logic_vector(2 downto 0);
        mem_wb_r_dest   : in     vl_logic_vector(2 downto 0);
        if_id_r_one     : in     vl_logic_vector(2 downto 0);
        if_id_r_two     : in     vl_logic_vector(2 downto 0);
        ex_mem_regfile_write: in     vl_logic;
        mem_wb_regfile_write: in     vl_logic;
        uses_sr1        : in     vl_logic;
        uses_sr2        : in     vl_logic;
        uses_sr1_mem    : in     vl_logic;
        uses_sr2_mem    : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        forward_a       : out    vl_logic_vector(1 downto 0);
        forward_b       : out    vl_logic_vector(1 downto 0);
        stall_forwarding: out    vl_logic;
        flush_forwarding: out    vl_logic
    );
end forwarding_unit;
