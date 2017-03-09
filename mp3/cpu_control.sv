import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module cpu_control
(
    /* Input and output port declarations */
    input clk,

    /*datapath control signals */
    output logic [1:0] pcmux_sel,
    output logic load_pc,
    output logic storemux_sel,
    output logic load_ir,
    output logic [2:0]marmux_sel,
    output logic load_mar,
    output logic [1:0] mdrmux_sel,
    output logic load_mdr,
    output logic load_regfile,
    output logic [1:0] alumux_sel,
    output lc3b_aluop alu_op,
    output logic [2:0] regfilemux_sel,
    output logic load_cc,
    output logic br_addmux_sel,
    output logic destmux_sel,
    input lc3b_opcode opcode,
    input br_en,
    input imm_mode,
    input jsr_mode,
    input stb_mode,

    /* memory signals */
    input mem_resp,
    output logic mem_read,
    output logic mem_write,
    output lc3b_mem_wmask mem_byte_enable
);

enum int unsigned {
    /* List of states */
    fetch1,
    fetch2,
    fetch3,
    decode,
    s_add,
    s_and,
    s_not,
    br,
    br_taken,
    calc_addr,
    ldr1,
    ldr2,
    str1,
    str2,
    s_lea,
    ldi1,
    ldi2,
    ldi3,
    sti1,
    sti2,
    sti3,
    jsr1,
    jsr2_0,
    jsr2_1,
    jsr3_1,
    trap1,
    trap2,
    trap3,
    trap4,
    s_jmp,
    ldb1,
    ldb2,
    ldb3,
    stb,
    stb2,
    stb3,
    stb4,
    shf
} state, next_state;

always_comb
begin : state_actions
    /* Default output assignments */
     load_pc = 1'b0;
     load_ir = 1'b0;
     load_regfile = 1'b0;
     load_mar = 1'b0;
     load_mdr = 1'b0;
     load_cc = 1'b0;
     pcmux_sel = 2'b00;
     storemux_sel = 1'b0;
     alumux_sel = 2'b00;
     regfilemux_sel = 3'b000;
     marmux_sel = 3'b000;
     mdrmux_sel = 2'b00;
     alu_op = alu_add;
     mem_read = 1'b0;
     mem_write = 1'b0;
     mem_byte_enable = 2'b11;
     br_addmux_sel = 0;
     destmux_sel = 0;
     
     /* Actions for each state */
     case(state)
        fetch1: begin
            //MAR <= PC
            marmux_sel = 3'b001;
            load_mar = 1;
            
            //PC<=PC+2
            pcmux_sel = 2'b00;
            load_pc = 1;
        end
        fetch2: begin 
            //Read Memory
            mem_read = 1;
            mdrmux_sel = 2'b01;
            load_mdr = 1;
        end
        fetch3: begin
            //Load IR
            load_ir = 1;
        end
        
        
        
        decode: ;//do nothing
        
        
        
        s_add: begin
            //DR <= SRA + SRB
            alu_op = alu_add;
            load_regfile = 1;
            load_cc = 1;
            if (imm_mode == 1'b1)
                alumux_sel = 2'b10;
        end
        
        
        
        s_not: begin
            //DR <= NOT(SRA)
            alu_op = alu_not;
            load_regfile = 1;
            load_cc = 1;
        end
        
        
        
        s_and: begin
            //DR <= SRA & SRB
            alu_op = alu_and;
            load_regfile = 1;
            load_cc = 1;
            if (imm_mode == 1'b1)
                alumux_sel = 2'b10;
        end
        
        
        
        br: begin
            //NONE
            //do nothing
        end
        br_taken: begin
            //PC<= PC + SEXT(IR[8:0] << 1)
            pcmux_sel = 2'b01;
            load_pc = 1;
        end
        
        
        
        
        calc_addr: begin
            //MAR <= SRA + SEXT(IR[5:0] << 1)
            alumux_sel = 2'b01;
            alu_op = alu_add;
            load_mar = 1;
        end
        
        
        
        ldi1: begin
            // MAR <- BaseR + SEXT(IR[5:0] << 1)
            alumux_sel = 2'b01;
            alu_op = alu_add;
            load_mar = 1;
        end
        ldi2: begin
            //MDR<=M[MAR]
            mdrmux_sel = 2'b01;
            load_mdr = 1;
            mem_read = 1;
        end
        ldi3: begin
            //MAR <- MDR
            load_mar = 1;
            marmux_sel = 3'b011;
        end
        
        
        
        ldr1: begin
            //MDR<=M[MAR]
            mdrmux_sel = 2'b01;
            load_mdr = 1;
            mem_read = 1;
        end
        ldr2: begin
            //DR <= MDR
            regfilemux_sel = 3'b001;
            load_regfile = 1;
            load_cc = 1;
        end
        


        stb: begin
            // MAR <= BaseR + SEXT(IR[5:0])
            alumux_sel = 2'b11;
            alu_op = alu_add;
            load_mar = 1;
        end
        stb2: begin
            // MDR <- SR[7:0]
            storemux_sel = 1;
            if (stb_mode == 1)
                mdrmux_sel = 2'b10;
            else
                mdrmux_sel = 2'b00;
            alu_op = alu_pass;
            load_mdr = 1;
        end
        stb3: begin
            // M[MAR]<−MDR (Low byte)
            mem_write = 1;
            mem_byte_enable = 2'b01;
        end
        stb4: begin
        // M[MAR]<−MDR (High byte)
            mem_write = 1;
            mem_byte_enable = 2'b10;
        end

        
        
        sti1: begin
            // MAR <= BaseR + SEXT(IR[5:0]) << 1
            alumux_sel = 2'b01;
            alu_op = alu_add;
            load_mar = 1;
        end
        sti2: begin
            // MDR <= M[MAR]
            mdrmux_sel = 2'b01;
            load_mdr = 1;
            mem_read = 1;
        end
        sti3: begin
            //MAR <= MDR
            load_mar = 1;
            marmux_sel = 3'b011;
        end
        
        
        
        str1: begin
            //MDR<=SR
            storemux_sel = 1;
            alu_op = alu_pass;
            load_mdr = 1;
        end
        str2: begin
            //M[MAR] <= MDR
            mem_write = 1;
        end
        
        
        s_lea: begin
            // DR <= PC + (SEXT(PCoffset9) << 1)
            regfilemux_sel = 3'b010;
            load_regfile = 1;
            load_cc = 1;
        end

        
        
        jsr1: begin
            // PC <= PC + 2
            //pcmux_sel = 2'b00;
            //load_pc = 1;
            // Whoops, forgot I was using PC + 2 as the input
        end
        jsr2_0: begin
            // R7 <= PC (already incremented)
            destmux_sel = 1;
            regfilemux_sel = 3'b011;
            load_regfile = 1;
        end
        jsr2_1: begin
            // PC <- BR
            pcmux_sel = 2'b10;
            load_pc = 1;
        end
        jsr3_1: begin
            // PC <- PC + SEXT(PCOffset11) << 1
            br_addmux_sel = 1;
            pcmux_sel = 2'b01;
            load_pc = 1;
        end



        shf: begin
            // Do shifting
            regfilemux_sel = 3'b101;
            load_regfile = 1;
        end

        
        
        s_jmp: begin
            // PC <= BaseR (sr2_out)
            pcmux_sel = 2'b10;
            load_pc = 1;
        end
        
        
        trap1: begin
            // R7 <= PC
            destmux_sel = 1;
            load_regfile =1;
            regfilemux_sel = 3'b011;
        end
        trap2: begin
            // MAR <= ZEXT(IR[7:0] << 1)
            load_mar = 1;
            marmux_sel = 3'b100;
        end
        trap3: begin
            // MDR <= M[MAR]
            mdrmux_sel = 2'b01;
            load_mdr = 1;
            mem_read = 1;
        end
        trap4: begin
            // PC <= MDR
            pcmux_sel = 2'b11;
            load_pc = 1;
        end
        
        
        
        ldb1: begin
            // MAR <= BaseR + Offset6
            load_mar = 1;
            alumux_sel = 2'b11;
            alu_op = alu_add;
        end
        ldb2: begin
            mdrmux_sel = 2'b01;
            load_mdr = 1;
            mem_read = 1;
        end
        ldb3: begin
            regfilemux_sel = 3'b110;
            load_regfile = 1;
            load_cc = 1;
        end
        default: ;//do nothing]
    endcase
end : state_actions

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
      next_state = state;
      
    case(state)
    
    
        fetch1: begin 
            next_state = fetch2;
        end
        fetch2: begin
            if(mem_resp == 1)
                next_state = fetch3;
            else
                next_state = fetch2;
        end
        fetch3: begin
            next_state = decode;
        end

        
        
        decode: begin
            case(opcode)
                op_add: begin
                    next_state = s_add;
                end
                op_and: begin 
                    next_state = s_and;
                end
                op_br: begin
                    next_state = br;
                end
                op_not: begin
                    next_state = s_not;
                end
                op_ldr: begin
                    next_state = calc_addr;
                end
                op_str: begin
                    next_state = calc_addr;
                end
                op_lea: begin
                    next_state = s_lea;
                end
                op_ldi: begin
                    next_state = ldi1;
                end
                op_sti: begin
                    next_state = sti1;
                end
                op_jsr: begin
                    next_state = jsr1;
                end
                op_trap: begin
                    next_state = trap1;
                end
                op_jmp: begin
                    next_state = s_jmp;
                end
                op_ldb: begin
                    next_state = ldb1;
                end
                op_stb: begin
                    next_state = stb;
                end
                op_shf: begin
                    next_state = shf;
                end
                default: ; //nothing
            endcase 
        end

        
        
        s_add: begin
            next_state = fetch1;
        end

        
        
        s_and: begin
            next_state = fetch1;
        end

        
        
        s_not: begin
            next_state = fetch1;
        end

        
        
        calc_addr: begin
            if(opcode == op_ldr)
                next_state = ldr1;
            else
                next_state = str1;
        end

        
        
        ldi1: begin
            next_state = ldi2;
        end
        ldi2: begin
            if(mem_resp == 1)
                next_state = ldi3;
            else
                next_state = ldi2;
        end
        ldi3: begin
            next_state = ldr1;
        end

        
        
        ldr1:  begin
            if(mem_resp == 1)
                next_state = ldr2;
            else
                next_state = ldr1;
        end
        ldr2: begin
            next_state = fetch1;
        end

        
        
        sti1: begin
            next_state = sti2;
        end
        sti2: begin
            if(mem_resp == 1)
                next_state = sti3;
            else
                next_state = sti2;
        end
        sti3: begin
            next_state = str1;
        end

        
        
        str1: begin 
            next_state = str2;
        end
        str2: begin
            if(mem_resp == 1)
                next_state = fetch1;
            else
                next_state = str2;
        end

        
        
        br: begin
            if(br_en == 1)
                next_state = br_taken;
            else
                next_state = fetch1;
        end
        br_taken: begin 
            next_state = fetch1;
        end

        
        
        s_lea: begin
            next_state = fetch1;
        end

        
        
        jsr1: begin
            next_state = jsr2_0;
        end
        jsr2_0: begin
            if(jsr_mode == 1)
                next_state = jsr3_1;
            else
                next_state = jsr2_1;
        end
        jsr2_1: begin
            next_state = fetch1;
        end
        jsr3_1: begin
            next_state = fetch1;
        end

        
        
        s_jmp: begin
            next_state = fetch1;
        end
        
        

        shf: begin
            next_state = fetch1;
        end


        
        trap1: begin 
            next_state = trap2;
        end
        trap2: begin
            next_state = trap3;
        end
        trap3: begin
            if(mem_resp == 1)
                next_state = trap4;
            else
                next_state = trap3;
        end
        trap4: begin
            next_state = fetch1;
        end
        
        
        
        ldb1: begin
            next_state = ldb2;
        end
        ldb2: begin
            if(mem_resp == 1)
                next_state = ldb3;
            else
                next_state = ldb2;
        end
        ldb3: begin
            next_state = fetch1;
        end

        stb: begin
            next_state = stb2;
        end
        stb2: begin
            if (stb_mode == 0)
                next_state = stb3;
            else
                next_state = stb4;
        end
        stb3: begin
            if(mem_resp == 1)
                next_state = fetch1;
            else
                next_state = stb3;
        end
        stb4: begin
            if(mem_resp == 1)
                next_state = fetch1;
            else
                next_state = stb4;
        end
    endcase
end : next_state_logic

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
     state <= next_state;
end : next_state_assignment

endmodule : cpu_control 