module bb8051_alu_src_sel(
    clk,
    rst,
    
    src1_sel, // from decoder
    src2_sel,
    src3_sel,
    
    src1, // to alu
    src2,
    src3,
    
    ram_addr,
    
    op1_in,
    op2_in,
    op3_in,
    
    acc_in,
    b_reg_in
    
    
    );
    
always@(src1_sel or src2_sel or src3_sel)
begin
    case(src1_sel)
        `BB8051_SRC_SEL_ACC : begin
            src1 = acc_in;
        end
        `BB8051_SRC_SEL_CONSTANT : begin
            src1 = op2_in;
        end
        `BB8051_SRC_SEL_NO : begin
            src1 = 8'b0;
        end
    endcase
    
    case(src2_sel)
        `BB8051_SRC_SEL_ACC : begin
            src2 = acc_in;
        end
        `BB8051_SRC_SEL_CONSTANT : begin
            src2 = op2_in;
        end
        `BB8051_SRC_SEL_NO : begin
            src2 = 8'b0;
        end
    endcase    
    
    case(src3_sel)
        `BB8051_SRC_SEL_ACC : begin
            src3 = acc_in;
        end
        `BB8051_SRC_SEL_CONSTANT : begin
            src3 = op2_in;
        end
        `BB8051_SRC_SEL_NO : begin
            src3 = 8'b0;
        end
    endcase    
end
        
        
        
        
        
        
        
        
        