onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate -radix hexadecimal -childformat {{{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} {-height 15 -radix hexadecimal}} /mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data
add wave -noupdate -color Salmon -label ID /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_in.opcode
add wave -noupdate -color Gold -label EX /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_out.opcode
add wave -noupdate -color Cyan -label MEM /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/ctrl_out.opcode
add wave -noupdate -color Orchid -label WB /mp3_tb/dut/mcpu/cpu_datapath/mem_wb_buf/ctrl_out.opcode
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/pc_out
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/ex_forward_a_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/ex_forward_b_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/id_forward_a_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/id_forward_b_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/mem_forward_a_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/mem_forward_b_int
add wave -noupdate -color Tan -radix hexadecimal -childformat {{{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[7]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[6]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[5]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[4]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[3]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[2]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[1]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[0]} -radix hexadecimal}} -subitemconfig {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[7]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[6]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[5]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[4]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[3]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[2]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[1]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[0]} {-color Tan -height 15 -radix hexadecimal}} /mp3_tb/dut/dcache/cdp/main_block/set_one/data
add wave -noupdate -color Orange -radix hexadecimal -childformat {{{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[7]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[6]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[5]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[4]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[3]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[2]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[1]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[0]} -radix hexadecimal}} -subitemconfig {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[7]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[6]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[5]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[4]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[3]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[2]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[1]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[0]} {-color Orange -height 15 -radix hexadecimal}} /mp3_tb/dut/dcache/cdp/main_block/set_two/data
add wave -noupdate -color Magenta -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/ctrl_out
add wave -noupdate -color Magenta -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/src1_out
add wave -noupdate -color Magenta -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/src2_out
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/dest_out
add wave -noupdate -color Magenta -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/src1_data_out
add wave -noupdate -color Magenta -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/src2_data_out
add wave -noupdate -color Magenta -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/dest_data_out
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/alu_out
add wave -noupdate -color Orange -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/src1_in
add wave -noupdate -color Orange -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/src2_in
add wave -noupdate -color Orange -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/dest_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {37809889 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 443
configure wave -valuecolwidth 204
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {37719208 ps} {38038660 ps}
