import lc3b_types::*;

module lru (
	input clk,

	/* index of LRU to set */
	input lc3b_cache_index lru_index,

	/* see which set was it, set the bit based on that */
	input set_one_hit,
	input set_two_hit,

	input load_lru,

	/* If the output is 1, set 1 is MRU, so evict set 2 and vice versa 
		we NOT the output here so that other components can easily use them */
	output logic lru_of_set
);

/* 8-bit lru array */
logic data [7:0];

/* Initalize everything to zero */
initial
begin
	for (int i = 0; i < 8; i++)
	begin
		data[i]  = 1'b0;
   end
end

/* Loading */
always_ff @(posedge clk)
begin
    if (load_lru == 1)
    begin
    	/* don't load if no hit! */
    	if(set_one_hit)
    		data[lru_index] = 0;
    	if(set_two_hit)
    		data[lru_index] = 1;
    end
end

always_comb
begin
	/* Again, this is NOTted, meaning that if 1 is the output, evict set 2
	and if 0 is output evict set 1 */
	lru_of_set = !(data[lru_index]);
end

endmodule: lru 