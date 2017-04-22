onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate -radix hexadecimal -childformat {{{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} {-height 15 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} {-height 15 -radix hexadecimal}} /mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data
add wave -noupdate -color Salmon /mp3_tb/dut/mcpu/cpu_datapath/if_id_buf/ctrl_out.opcode
add wave -noupdate -color Gold /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_out.opcode
add wave -noupdate -color Cyan /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/ctrl_out.opcode
add wave -noupdate -color Orchid /mp3_tb/dut/mcpu/cpu_datapath/mem_wb_buf/ctrl_out.opcode
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/pc_out
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/ex_forward_a_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/ex_forward_b_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/id_forward_a_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/id_forward_b_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/mem_forward_a_int
add wave -noupdate -color Thistle /mp3_tb/dut/mcpu/cpu_datapath/hot_box/mem_forward_b_int
add wave -noupdate -color Tan -radix hexadecimal -childformat {{{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[7]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[6]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[5]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[4]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[3]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[2]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[1]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[7]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[6]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[5]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[4]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[3]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[2]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[1]} {-color Tan -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[0]} {-color Tan -height 15 -radix hexadecimal}} /mp3_tb/dut/dcache/cdp/main_block/set_one/data
add wave -noupdate -color Orange -radix hexadecimal -childformat {{{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[7]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[6]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[5]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[4]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[3]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[2]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[1]} -radix hexadecimal} {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[7]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[6]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[5]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[4]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[3]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[2]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[1]} {-color Orange -height 15 -radix hexadecimal} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[0]} {-color Orange -height 15 -radix hexadecimal}} /mp3_tb/dut/dcache/cdp/main_block/set_two/data
add wave -noupdate -color Aquamarine -radix hexadecimal /mp3_tb/dut/mcpu/read_b
add wave -noupdate -color Aquamarine -radix hexadecimal /mp3_tb/dut/mcpu/write_b
add wave -noupdate -color Aquamarine -radix hexadecimal /mp3_tb/dut/mcpu/address_b
add wave -noupdate -color Aquamarine -radix hexadecimal /mp3_tb/dut/mcpu/wdata_b
add wave -noupdate -color Aquamarine -radix hexadecimal /mp3_tb/dut/mcpu/rdata_b
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/stall_mem
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/flush_mem
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/stall
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/clk
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/load
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/resp
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/flush
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/in
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/instruction
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/dest
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/src1
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/src2
add wave -noupdate -color Maroon -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/ir_unit/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {37251414 ps} 0}
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
WaveRestoreZoom {36926411 ps} {37565531 ps}
