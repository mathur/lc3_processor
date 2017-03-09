onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp2_tb/clk
add wave -noupdate -color {Steel Blue} /mp2_tb/dut/mcache/cdp/main_block/hit
add wave -noupdate /mp2_tb/pmem_resp
add wave -noupdate /mp2_tb/pmem_read
add wave -noupdate /mp2_tb/pmem_rdata
add wave -noupdate /mp2_tb/pmem_address
add wave -noupdate /mp2_tb/dut/mcache/mem_address
add wave -noupdate /mp2_tb/dut/mcache/cdp/mem_address
add wave -noupdate /mp2_tb/dut/mcache/mem_resp
add wave -noupdate /mp2_tb/dut/mcache/mem_rdata
add wave -noupdate /mp2_tb/dut/mcache/mem_read
add wave -noupdate /mp2_tb/dut/mcache/ccl/state
add wave -noupdate /mp2_tb/dut/mcpu/opcode
add wave -noupdate /mp2_tb/dut/mcpu/control_unit/state
add wave -noupdate -color Gold /mp2_tb/dut/mcache/cdp/main_block/set_one/in_index
add wave -noupdate -color Gold /mp2_tb/dut/mcache/cdp/main_block/set_two/in_index
add wave -noupdate -color {Violet Red} /mp2_tb/dut/mcache/cdp/main_block/load_set_one
add wave -noupdate -color {Violet Red} /mp2_tb/dut/mcache/cdp/main_block/load_set_two
add wave -noupdate -color {Orange Red} -expand -subitemconfig {{/mp2_tb/dut/mcache/cdp/main_block/set_one/data[7]} {-color {Orange Red}} {/mp2_tb/dut/mcache/cdp/main_block/set_one/data[6]} {-color {Orange Red}} {/mp2_tb/dut/mcache/cdp/main_block/set_one/data[5]} {-color {Orange Red}} {/mp2_tb/dut/mcache/cdp/main_block/set_one/data[4]} {-color {Orange Red}} {/mp2_tb/dut/mcache/cdp/main_block/set_one/data[3]} {-color {Orange Red}} {/mp2_tb/dut/mcache/cdp/main_block/set_one/data[2]} {-color {Orange Red}} {/mp2_tb/dut/mcache/cdp/main_block/set_one/data[1]} {-color {Orange Red}} {/mp2_tb/dut/mcache/cdp/main_block/set_one/data[0]} {-color {Orange Red}}} /mp2_tb/dut/mcache/cdp/main_block/set_one/data
add wave -noupdate -color Turquoise -expand -subitemconfig {{/mp2_tb/dut/mcache/cdp/main_block/set_two/data[7]} {-color Turquoise} {/mp2_tb/dut/mcache/cdp/main_block/set_two/data[6]} {-color Turquoise} {/mp2_tb/dut/mcache/cdp/main_block/set_two/data[5]} {-color Turquoise} {/mp2_tb/dut/mcache/cdp/main_block/set_two/data[4]} {-color Turquoise} {/mp2_tb/dut/mcache/cdp/main_block/set_two/data[3]} {-color Turquoise} {/mp2_tb/dut/mcache/cdp/main_block/set_two/data[2]} {-color Turquoise} {/mp2_tb/dut/mcache/cdp/main_block/set_two/data[1]} {-color Turquoise} {/mp2_tb/dut/mcache/cdp/main_block/set_two/data[0]} {-color Turquoise}} /mp2_tb/dut/mcache/cdp/main_block/set_two/data
add wave -noupdate -color {Orange Red} /mp2_tb/dut/mcache/cdp/main_block/set_one/tag
add wave -noupdate -color Turquoise /mp2_tb/dut/mcache/cdp/main_block/set_two/tag
add wave -noupdate -color {Orange Red} /mp2_tb/dut/mcache/cdp/main_block/set_two/in_tag
add wave -noupdate -color Turquoise /mp2_tb/dut/mcache/cdp/main_block/set_one/in_tag
add wave -noupdate -color {Orange Red} /mp2_tb/dut/mcache/cdp/main_block/set_one/valid
add wave -noupdate -color Turquoise /mp2_tb/dut/mcache/cdp/main_block/set_two/valid
add wave -noupdate -color {Orange Red} /mp2_tb/dut/mcache/cdp/main_lru/data
add wave -noupdate -color Turquoise /mp2_tb/dut/mcpu/data_path/rfile/data
add wave -noupdate -radix binary -childformat {{{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[15]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[14]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[13]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[12]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[11]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[10]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[9]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[8]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[7]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[6]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[5]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[4]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[3]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[2]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[1]} -radix binary} {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[0]} -radix binary}} -subitemconfig {{/mp2_tb/dut/mcache/cdp/main_block/cache_addr[15]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[14]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[13]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[12]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[11]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[10]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[9]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[8]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[7]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[6]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[5]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[4]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[3]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[2]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[1]} {-height 15 -radix binary} {/mp2_tb/dut/mcache/cdp/main_block/cache_addr[0]} {-height 15 -radix binary}} /mp2_tb/dut/mcache/cdp/main_block/cache_addr
add wave -noupdate -color {Orange Red} /mp2_tb/dut/mcache/cdp/main_block/out_tag_set_one
add wave -noupdate -color Turquoise /mp2_tb/dut/mcache/cdp/main_block/out_tag_set_two
add wave -noupdate -color {Orange Red} /mp2_tb/dut/mcache/cdp/main_block/out_valid_set_one
add wave -noupdate -color Turquoise /mp2_tb/dut/mcache/cdp/main_block/out_valid_set_two
add wave -noupdate -expand /mp2_tb/dut/mcpu/data_path/rfile/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2257909 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 192
configure wave -valuecolwidth 272
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
WaveRestoreZoom {0 ps} {5250 ns}
