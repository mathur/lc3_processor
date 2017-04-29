library verilog;
use verilog.vl_types.all;
entity byte_insert is
    port(
        sel_index       : in     vl_logic_vector(3 downto 0);
        write_data      : in     vl_logic_vector(15 downto 0);
        input_data      : in     vl_logic_vector(127 downto 0);
        mem_byte_enable : in     vl_logic_vector(1 downto 0);
        enable          : in     vl_logic;
        output_data     : out    vl_logic_vector(127 downto 0)
    );
end byte_insert;
