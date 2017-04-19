transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/lc3b_types.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/plus2.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/register.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/mux2.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/benable.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/badder.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/mux3.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/mux4.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/mux8.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/shiftunit.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/forwarding_unit.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/cache_set.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/cache_datapath.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/cache_control.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/cache_block.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/cache.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/arbiter.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/control_rom.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/buffer.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/mem_datapath.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/if_datapath.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/id_datapath.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/ex_datapath.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/byte_insert.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/lru.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/cpu_datapath.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/adj.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/alu.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/gencc.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/ir.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/regfile.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/udj.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/adjns.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/udjns.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/l2_cache.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/l2_cache_datapath.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/l2_cache_block.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/l2_cache_set.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/l2_cache_control.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/cpu.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/mp3.sv}

vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/mp3_tb.sv}
vlog -sv -work work +incdir+/home/rmathur2/fmax_420/mp3 {/home/rmathur2/fmax_420/mp3/physical_memory.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiii_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb

add wave *
view structure
view signals
run 200 ns
