VSIM = vsim
OPTS = -sv -suppress 7061
CC = vlog

SYN = quartus_map
FIT = quartus_fit
STA = quartus_sta

SEED = 13

mp3 : 
        $(SYN) mp3
        $(FIT) --seed=$(SEED) mp3
        $(STA) mp3
        grep "; Slow 1100mV 85C Model Fmax Summary" "output_files/mp3.sta.rpt" -A5 -B1

mp3_tb : 
        $(CC) $(OPTS) lc3b_types.sv
        $(CC) $(OPTS) *.sv
        $(VSIM) mp3_tb