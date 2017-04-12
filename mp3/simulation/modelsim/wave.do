onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate -radix hexadecimal -childformat {{{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} {-height 15 -radix hexadecimal}} /mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_id_buf/ctrl_in.opcode
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_id_buf/ctrl_out.opcode
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_in.opcode
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_out.opcode
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/ctrl_in.opcode
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/ctrl_out.opcode
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/mem_wb_buf/ctrl_in.opcode
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/mem_wb_buf/ctrl_out.opcode
add wave -noupdate -radix hexadecimal -childformat {{{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[7]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[6]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[5]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[4]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[3]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[2]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[1]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[7]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[6]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[5]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[4]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[3]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[2]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[1]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[0]} {-height 15 -radix hexadecimal}} /mp3_tb/dut/dcache/cdp/main_block/set_one/data
add wave -noupdate -radix hexadecimal -childformat {{{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[7]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[6]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[5]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[4]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[3]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[2]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[1]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[7]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[6]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[5]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[4]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[3]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[2]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[1]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[0]} {-height 15 -radix hexadecimal}} /mp3_tb/dut/dcache/cdp/main_block/set_two/data
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/resp_b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/rdata_b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/read_b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/write_b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/wmask_b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/address_b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/wdata_b
add wave -noupdate -color Gold -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/mem/stall
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/mem/resp_b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/mem/read_b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/mem/write_b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/mem/i_sig
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/mem/ireg
add wave -noupdate /mp3_tb/dut/dcache/ccl/state
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/mem/a
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/mem/b
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/mem/c
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {635000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 303
configure wave -valuecolwidth 204
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {532233 ps} {1188483 ps}
