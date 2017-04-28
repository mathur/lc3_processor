onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate -radix hexadecimal -childformat {{{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} {-height 18 -radix hexadecimal}} /mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data
add wave -noupdate -color Salmon -label ID /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_in.opcode
add wave -noupdate -color Gold -label EX /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_out.opcode
add wave -noupdate -color Cyan -label MEM /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/ctrl_out.opcode
add wave -noupdate -color Orchid -label WB /mp3_tb/dut/mcpu/cpu_datapath/mem_wb_buf/ctrl_out.opcode
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/pc_out
add wave -noupdate -color Orange -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alumux_two/sel
add wave -noupdate -color Orange -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alumux_two/a
add wave -noupdate -color Orange -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alumux_two/b
add wave -noupdate -color Orange -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alumux_two/c
add wave -noupdate -color Orange -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alumux_two/d
add wave -noupdate -color Orange -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alumux_two/f
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alu_unit/alu_op
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alu_unit/a
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alu_unit/b
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/ex/alu_unit/f
add wave -noupdate -color Violet /mp3_tb/dut/mcpu/cpu_datapath/hot_box/ex_forward_a
add wave -noupdate -color Violet /mp3_tb/dut/mcpu/cpu_datapath/hot_box/ex_forward_b
add wave -noupdate -color Violet /mp3_tb/dut/mcpu/cpu_datapath/hot_box/id_forward_a
add wave -noupdate -color Violet /mp3_tb/dut/mcpu/cpu_datapath/hot_box/id_forward_b
add wave -noupdate -color Violet /mp3_tb/dut/mcpu/cpu_datapath/hot_box/mem_forward_a
add wave -noupdate -color Violet /mp3_tb/dut/mcpu/cpu_datapath/hot_box/mem_forward_b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15119491 ps} 0}
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
WaveRestoreZoom {15089449 ps} {15156841 ps}
