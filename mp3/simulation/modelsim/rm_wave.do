onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 /mp3_tb/clk
add wave -noupdate -height 15 /mp3_tb/pmem_resp
add wave -noupdate -height 15 /mp3_tb/pmem_read
add wave -noupdate -height 15 /mp3_tb/pmem_write
add wave -noupdate -height 15 /mp3_tb/pmem_address
add wave -noupdate -height 15 /mp3_tb/pmem_rdata
add wave -noupdate -height 15 /mp3_tb/dut/pmem_rdata_a
add wave -noupdate -height 15 /mp3_tb/pmem_wdata
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} {-height 15}} /mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data
add wave -noupdate -height 15 /mp3_tb/dut/mcpu/cpu_datapath/if_data/pc_out
add wave -noupdate -color Cyan -height 15 /mp3_tb/dut/mcpu/cpu_datapath/if_data/resp_a
add wave -noupdate -color Cyan -height 15 /mp3_tb/dut/mcpu/cpu_datapath/if_data/rdata_a
add wave -noupdate -height 15 /mp3_tb/dut/mcpu/cpu_datapath/if_data/instruction
add wave -noupdate -height 15 /mp3_tb/dut/mcpu/cpu_datapath/if_id_buf/instruction/out
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/dcache/cdp/main_block/set_one/data[7]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[6]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[5]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[4]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[3]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[2]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[1]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_one/data[0]} {-height 15}} /mp3_tb/dut/dcache/cdp/main_block/set_one/data
add wave -noupdate -height 15 -expand -subitemconfig {{/mp3_tb/dut/dcache/cdp/main_block/set_two/data[7]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[6]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[5]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[4]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[3]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[2]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[1]} {-height 15} {/mp3_tb/dut/dcache/cdp/main_block/set_two/data[0]} {-height 15}} /mp3_tb/dut/dcache/cdp/main_block/set_two/data
add wave -noupdate -height 15 /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_out.opcode
add wave -noupdate -height 15 /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/ctrl_out.opcode
add wave -noupdate -height 15 /mp3_tb/dut/mcpu/cpu_datapath/mem_wb_buf/ctrl_out.opcode
add wave -noupdate -height 15 /mp3_tb/dut/mcpu/cpu_datapath/mem/address_b
add wave -noupdate -height 15 /mp3_tb/dut/mcpu/cpu_datapath/if_data/stall
add wave -noupdate -height 15 /mp3_tb/dut/mcpu/cpu_datapath/if_data/instruction
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1447725 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 451
configure wave -valuecolwidth 251
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
WaveRestoreZoom {1417815 ps} {1501743 ps}
