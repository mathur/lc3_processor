onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate -radix decimal /mp3_tb/read_a
add wave -noupdate -radix decimal /mp3_tb/write_a
add wave -noupdate -radix decimal /mp3_tb/wmask_a
add wave -noupdate -radix decimal /mp3_tb/address_a
add wave -noupdate -radix decimal /mp3_tb/wdata_a
add wave -noupdate -radix decimal /mp3_tb/resp_a
add wave -noupdate -radix decimal /mp3_tb/rdata_a
add wave -noupdate -radix decimal /mp3_tb/read_b
add wave -noupdate -radix decimal /mp3_tb/write_b
add wave -noupdate -radix decimal /mp3_tb/wmask_b
add wave -noupdate -radix decimal /mp3_tb/address_b
add wave -noupdate -radix decimal /mp3_tb/wdata_b
add wave -noupdate -radix decimal /mp3_tb/resp_b
add wave -noupdate -color Coral -radix decimal /mp3_tb/rdata_b
add wave -noupdate -radix decimal -childformat {{{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} -radix decimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} -radix decimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} -radix decimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} -radix decimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} -radix decimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} -radix decimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} -radix decimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} -radix decimal}} -expand -subitemconfig {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} {-height 15 -radix decimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} {-height 15 -radix decimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} {-height 15 -radix decimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} {-height 15 -radix decimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} {-height 15 -radix decimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} {-height 15 -radix decimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} {-height 15 -radix decimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} {-height 15 -radix decimal}} /mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_id_buf/dest_data_out
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/dest_data_out
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/dest_data_out
add wave -noupdate -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem_wb_buf/dest_data_in
add wave -noupdate -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem_wb_buf/dest_data_out
add wave -noupdate -color {Slate Blue} -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/sel
add wave -noupdate -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/a
add wave -noupdate -color Magenta -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/b
add wave -noupdate -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/c
add wave -noupdate -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/d
add wave -noupdate -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/e
add wave -noupdate -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/f
add wave -noupdate -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/g
add wave -noupdate -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/h
add wave -noupdate -color Cyan -radix decimal /mp3_tb/dut/mcpu/cpu_datapath/mem/regfilemux/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {66889 ps} 0}
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
WaveRestoreZoom {0 ps} {144697 ps}
