module bb8051_decoder(
	clk,
	rst,
	
    op1_in,
    op2_in,
    op3_in,
    
	alu_op_code,  // to alu
	
	src1_sel, // to alu src sel
	src2_sel, 
	src3_sel,
	
	comp_sel,
	
	pc_act,
    
    decoder_wait
    
    );
    
input       clk, rst;

output  [7:0]   op1_out, 
                op2_out,    
                op3_out;
reg     [7:0]   op1_out,
                op2_out,
                op3_out;
                
output  [7:0]   alu_op_code;
reg     [7:0]   alu_op_code;

output  [7:0]   src1_sel,
                src2_sel,
                src3_sel;
reg     [7:0]   src1_sel,
                src2_sel,
                src3_sel;
                
output          decoder_wait;
reg             decoder_wait;
                
                
                
reg     [1:0]   state;  // most of instructions only need one clock, state variable 
                        // is set for the instructions that need more than one clock                 

//
// execution block for multiple clock instruction
//                        
always@(state or op1_out)
begin
    case(state)
        2'b00: begin 
            casex(op1_in):
                `BB8051_
        end        
        2'b01: begin
        end
        2'b10: begin
        end
        2'b11: begin
        end
        default:
    endcase
end

//
// register ouput of op_code to alu
//
always@(posedge clk or posedge rst)
begin   
    if(rst)
        op_code <= 8'b0;
    else 
        case(state)
            2'b00: begin 
                casex(op1_out):
                    // op_code [7:3]
                    `define BB8051_ADD_R : begin // add A=A+Rx
                        alu_op_code <= `BB8051_ALU_ADD;
                        src1_sel <= `
                        src2_sel <=
                        src3_sel <= 
                        
                        
                    end
                    `define BB8051_ADDC_R : begin // add A=A+Rx+c
                        alu_op_code <= `BB8051_ALU_ADD;
                    end 
                    
                    //op_code [7:1]
                    `define BB8051_ADD_I : begin // add A=A+@Ri
                        alu_op_code <= `BB8051_ALU_ADD;
                    end
                        
                    `define BB8051_ADDC_I : begin // add A=A+@Ri+c
                        alu_op_code <= `BB8051_ALU_ADD;
                    end
                    
                    // op_code [7:0]
                    `define BB8051_ADD_D : begin // add A=A+(direct)
                        alu_op_code <= `BB8051_ALU_ADD;
                    end
                    `define BB8051_ADD_C : begin // add A=A+constant
                        src1_sel <= `BB8051_SRC_SEL_ACC;
                        src2_sel <= `BB8051_SRC_SEL_CONSTANT;
                        src3_sel <= `BB8051_SRC_SEL_NO;
                        
                        ram_action_sel <= `BB8051_RAM_ACTION_NO;
                        ram_addr_sel <= `BB8051_RAM_ADDR_SEL_NO;
                        
                        rom_action_sel <= `BB8051_ROM_ACTION_NO;
                        pc_wr <= `BB8051_NO;
                       
                        alu_op_code <= `BB8051_ALU_ADD;
                    end
                    `define BB8051_ADDC_D : begin // add A=A+(direct)+c
                        alu_op_code <= `BB8051_ALU_ADD;
                    end
                    `define BB8051_ADDC_C : begin // add A=A+constant+c
                        alu_op_code <= `BB8051_ALU_ADD;
                    end
                
                    default:
                endcase    
                    `
            end
            2'b01: begin
            end
            2'b10: begin
            end
            2'b11: begin
            end
            default:
        endcase    
end

//
// state change process
//
always@(posedge clk or posedge rst)
begin
    if(rst)
        state <= 2'b00;
    else
        case(state)
            2'b00: begin
                casex(op1_out):
                
            end
            2'b01: begin
                state <= 2'b10;
            end
            2'b10: begin
                state <= 2'b11;
            end
            2'b11: begin
                state <= 2'b00;
            end
            default: state <= 2'b00;
        endcase
end
        
