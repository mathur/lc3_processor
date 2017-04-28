import lc3b_types::*;

module data_insert (
    input   logic[3:0]      offset,
    input   logic[127:0]    input_data,
    input   logic[15:0]     input_word,
    input   lc3b_mem_wmask  mem_byte_enable,
    output  logic[127:0]    output_data
);

    always_comb
    begin
        unique case ({mem_byte_enable, offset})
            6'b010000: begin
                output_data = {input_data[127:8], input_word[7:0]};
            end
            6'b010001: begin
                output_data = {input_data[127:16], input_word[7:0], input_data[7:0]};
            end
            6'b010010: begin
                output_data = {input_data[127:24], input_word[7:0], input_data[15:0]};
            end
            6'b010011: begin
                output_data = {input_data[127:32], input_word[7:0], input_data[23:0]};
            end
            6'b010100: begin
                output_data = {input_data[127:40], input_word[7:0], input_data[31:0]};
            end
            6'b010101: begin
                output_data = {input_data[127:48], input_word[7:0], input_data[39:0]};
            end
            6'b010110: begin
                output_data = {input_data[127:56], input_word[7:0], input_data[47:0]};
            end
            6'b010111: begin
                output_data = {input_data[127:64], input_word[7:0], input_data[55:0]};
            end
            6'b011000: begin
                output_data = {input_data[127:72], input_word[7:0], input_data[63:0]};
            end
            6'b011001: begin
                output_data = {input_data[127:80], input_word[7:0], input_data[71:0]};
            end
            6'b011010: begin
                output_data = {input_data[127:88], input_word[7:0], input_data[79:0]};
            end
            6'b011011: begin
                output_data = {input_data[127:96], input_word[7:0], input_data[87:0]};
            end
            6'b011100: begin
                output_data = {input_data[127:104], input_word[7:0], input_data[95:0]};
            end
            6'b011101: begin
                output_data = {input_data[127:112], input_word[7:0], input_data[103:0]};
            end
            6'b011110: begin
                output_data = {input_data[127:120], input_word[7:0], input_data[111:0]};
            end
            6'b011111: begin
                output_data = {input_word[7:0], input_data[119:0]};
            end
            ///////////////////////////////////////////////////////////////////////////////
            6'b100000: begin
                output_data = {input_data[127:16], input_word[15:8], input_data[7:0]};
            end
            6'b100001: begin
                output_data = {input_data[127:24], input_word[15:8], input_data[15:0]};
            end
            6'b100010: begin
                output_data = {input_data[127:32], input_word[15:8], input_data[23:0]};
            end
            6'b100011: begin
                output_data = {input_data[127:40], input_word[15:8], input_data[31:0]};
            end
            6'b100100: begin
                output_data = {input_data[127:48], input_word[15:8], input_data[39:0]};
            end
            6'b100101: begin
                output_data = {input_data[127:56], input_word[15:8], input_data[47:0]};
            end
            6'b100110: begin
                output_data = {input_data[127:64], input_word[15:8], input_data[55:0]};
            end
            6'b100111: begin
                output_data = {input_data[127:72], input_word[15:8], input_data[63:0]};
            end
            6'b101000: begin
                output_data = {input_data[127:80], input_word[15:8], input_data[71:0]};
            end
            6'b101001: begin
                output_data = {input_data[127:88], input_word[15:8], input_data[79:0]};
            end
            6'b101010: begin
                output_data = {input_data[127:96], input_word[15:8], input_data[87:0]};
            end
            6'b101011: begin
                output_data = {input_data[127:104], input_word[15:8], input_data[95:0]};
            end
            6'b101100: begin
                output_data = {input_data[127:112], input_word[15:8], input_data[103:0]};
            end
            6'b101101: begin
                output_data = {input_data[127:120], input_word[15:8], input_data[111:0]};
            end
            6'b101110: begin
                output_data = {input_word[15:8], input_data[119:0]};
            end
            6'b101111: begin
                output_data = input_data;
            end
            ///////////////////////////////////////////////////////////////////////////////
            6'b110000: begin
                output_data = {input_data[127:16], input_word};
            end
            6'b110001: begin
                output_data = {input_data[127:24], input_word, input_data[7:0]};
            end
            6'b110010: begin
                output_data = {input_data[127:32], input_word, input_data[15:0]};
            end
            6'b110011: begin
                output_data = {input_data[127:40], input_word, input_data[23:0]};
            end
            6'b110100: begin
                output_data = {input_data[127:48], input_word, input_data[31:0]};
            end
            6'b110101: begin
                output_data = {input_data[127:56], input_word, input_data[39:0]};
            end
            6'b110110: begin
                output_data = {input_data[127:64], input_word, input_data[47:0]};
            end
            6'b110111: begin
                output_data = {input_data[127:72], input_word, input_data[55:0]};
            end
            6'b111000: begin
                output_data = {input_data[127:80], input_word, input_data[63:0]};
            end
            6'b111001: begin
                output_data = {input_data[127:88], input_word, input_data[71:0]};
            end
            6'b111010: begin
                output_data = {input_data[127:96], input_word, input_data[79:0]};
            end
            6'b111011: begin
                output_data = {input_data[127:104], input_word, input_data[87:0]};
            end
            6'b111100: begin
                output_data = {input_data[127:112], input_word, input_data[95:0]};
            end
            6'b111101: begin
                output_data = {input_data[127:120], input_word, input_data[103:0]};
            end
            6'b111110: begin
                output_data = {input_word, input_data[111:0]};
            end
            6'b111111: begin
                output_data = {input_word[7:0], input_data[119:0]};
            end
            default: begin
                output_data = input_data;
            end
        endcase
    end

endmodule : data_insert
