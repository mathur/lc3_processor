library verilog;
use verilog.vl_types.all;
entity forwarding_unit is
    port(
        ex_mem_out_regfile_write: in     vl_logic;
        mem_wb_out_regfile_write: in     vl_logic;
        mem_load_inst   : in     vl_logic;
        mem_str_inst    : in     vl_logic;
        uses_sr1        : in     vl_logic;
        uses_sr2        : in     vl_logic;
        uses_sr1_mem    : in     vl_logic;
        uses_sr2_mem    : in     vl_logic;
        id_ex_in_uses_sr1: in     vl_logic;
        id_ex_in_uses_sr2: in     vl_logic;
        ex_mem_out_dest : in     vl_logic_vector(2 downto 0);
        id_ex_out_sr1   : in     vl_logic_vector(2 downto 0);
        id_ex_out_sr2   : in     vl_logic_vector(2 downto 0);
        id_ex_in_src1   : in     vl_logic_vector(2 downto 0);
        id_ex_in_src2   : in     vl_logic_vector(2 downto 0);
        mem_wb_out_dest : in     vl_logic_vector(2 downto 0);
        mem_wb_out_src1 : in     vl_logic_vector(2 downto 0);
        mem_wb_out_src2 : in     vl_logic_vector(2 downto 0);
        ex_mem_out_sr1  : in     vl_logic_vector(2 downto 0);
        ex_mem_out_sr2  : in     vl_logic_vector(2 downto 0);
        id_ex_in_dest   : in     vl_logic_vector(2 downto 0);
        ex_forward_a    : out    vl_logic_vector(1 downto 0);
        ex_forward_b    : out    vl_logic_vector(1 downto 0);
        id_forward_a    : out    vl_logic_vector(1 downto 0);
        id_forward_b    : out    vl_logic_vector(1 downto 0);
        mem_forward_a   : out    vl_logic;
        mem_forward_b   : out    vl_logic
    );
end forwarding_unit;
