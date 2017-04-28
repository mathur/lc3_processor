onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate -radix hexadecimal -childformat {{{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} -radix hexadecimal} {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[7]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[6]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[5]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[4]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[3]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[2]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[1]} {-height 18 -radix hexadecimal} {/mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data[0]} {-height 18 -radix hexadecimal}} /mp3_tb/dut/mcpu/cpu_datapath/id/rfile/data
add wave -noupdate -color Salmon -label ID /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_in.opcode
add wave -noupdate -color Gold -label EX /mp3_tb/dut/mcpu/cpu_datapath/id_ex_buf/ctrl_out.opcode
add wave -noupdate -color Cyan -label MEM /mp3_tb/dut/mcpu/cpu_datapath/ex_mem_buf/ctrl_out.opcode
add wave -noupdate -color Orchid -label WB /mp3_tb/dut/mcpu/cpu_datapath/mem_wb_buf/ctrl_out.opcode
add wave -noupdate -radix hexadecimal /mp3_tb/dut/mcpu/cpu_datapath/if_data/pc_out
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/clk
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/memstall
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/ex_dest
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/mem_dest
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/ex_sr1
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/ex_sr2
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/leap_frog_data_mux
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/leap_frog_reg_mux
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/mem_load_cc
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/other_stage_stall_override
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/mem_load_cc_int
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/mem_load_cc_reg_int
add wave -noupdate /mp3_tb/dut/mcpu/cpu_datapath/puff_puff_pass/ex_crtl.opcode
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5775000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 588
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
WaveRestoreZoom {5693348 ps} {5831299 ps}
