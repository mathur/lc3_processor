module tag_check (
    input   logic[8:0]      input_tag, tag_1, tag_2,
    input   logic           valid_1, valid_2,
    input   logic[127:0]    data_1, data_2,
    output  logic           sig,
    output  logic[127:0]    data,
	 output  logic			    tag1_hit, tag2_hit
);

    always_comb
    begin
        if(input_tag == tag_1 && valid_1) begin
            sig     = 1'b1;
            data    = data_1;
				tag1_hit = 1'b1;
				tag2_hit = 1'b0;
        end else if (input_tag == tag_2 && valid_2) begin
            sig     = 1'b1;
            data    = data_2;
				tag1_hit = 1'b0;
				tag2_hit = 1'b1;
        end else begin
            sig     = 1'b0;
            data    = 128'b0;
				tag1_hit = 1'b0;
				tag2_hit = 1'b0;
        end
    end

endmodule : tag_check
