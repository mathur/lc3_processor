onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/pmem_resp
add wave -noupdate /mp3_tb/pmem_read
add wave -noupdate /mp3_tb/pmem_write
add wave -noupdate /mp3_tb/pmem_address
add wave -noupdate /mp3_tb/pmem_rdata
add wave -noupdate /mp3_tb/dut/pmem_rdata_a
add wave -noupdate /mp3_tb/dut/pmem_address_b
add wave -noupdate /mp3_tb/pmem_wdata
add wave -noupdate -expand -subitemconfig {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} {-height 15} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} {-height 15}} /mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data
add wave -noupdate -color Cyan /mp3_tb/dut/mcpu/cpu_datapath/if_data/read_a
add wave -noupdate -color Cyan /mp3_tb/dut/mcpu/cpu_datapath/if_data/address_a
add wave -noupdate -color Cyan /mp3_tb/dut/mcpu/cpu_datapath/if_data/resp_a
add wave -noupdate -color Cyan /mp3_tb/dut/mcpu/cpu_datapath/if_data/rdata_a
add wave -noupdate -color Magenta /mp3_tb/dut/mcpu/cpu_datapath/if_data/pc_out
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/instruction
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/br_en
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux_sel_internal
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux/a
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux/b
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux/c
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux/d
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux/e
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux/f
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux/g
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux/h
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/if_data/pcmux/i
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/id/ctrl.opcode
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4438143 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 451
configure wave -valuecolwidth 100
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
WaveRestoreZoom {4369682 ps} {4583338 ps}
