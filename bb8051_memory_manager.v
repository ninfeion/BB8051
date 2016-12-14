module bb8051_memory_manager(
	clk,
    
    rom_clk,
    ram_clk,
    
	rst,
	
	op1_out,
	op2_out,
	op3_out,
	
	alu_des1,
	alu_des2,
	
	alu_des_acc,
	alu_des_c,
	alu_des_ac,
	alu_des_ov,
    
    pc_wr,
    pc_reg,
    
	
	int_ram_data,
	int_ram_addr_sel,
    int_ram_action,
  
    decoder_wait,
    int_rom_action
//	int_rom_data,
//	int_rom_addr
	);
    
input   rst, 
        clk;

input   rom_clk,
        ram_clk;

output  [7:0]   op1_out, 
                op2_out, 
                op3_out;
reg     [7:0]   op1_out,
                op2_out,
                op3_out;

input   alu_des1, 
        alu_des2;
        
input   alu_des_acc, 
        alu_des_c,
        alu_des_ac,
        alu_des_ov;
        
input   [1:0]   pc_wr_or_rd;
output  [23:0]  pc_reg;
reg     [23:0]  pc_reg;

output          int_ram_data;
input           int_ram_addr_sel;
input           int_ram_action;
reg     [7:0]   int_ram_addr;

input           int_rom_action;
reg     [15:0]  int_rom_addr;
wire    [23:0]  int_rom_data;

// wire    [15:0]  int_rom_addr_wire;
// assign  int_rom_addr_wire = int_rom_addr;

// input   int_rom_addr;
// output  int_rom_data;


bb8051_sfr_manager bb8051_sfr_manager_inst(
    );    

bb8051_rom_altera bb8051_rom_altera_inst(
	.address (int_rom_addr),    // 12bit (4k)
	.clock (rom_clk),
	.q (int_rom_data)   // 24bit
	);
		
//
// ram operation address selecting process
//
always@(int_ram_addr_sel or sp or ri or imm)
begin
    case (int_ram_addr_sel)
        `BB8051_RAM_ADDR_SEL_RN :   int_ram_addr = {3'b0, rn};
        `BB8051_RAM_ADDR_SEL_I  :   int_ram_addr = ri;
        `BB8051_RAM_ADDR_SEL_D  :   int_ram_addr = imm;   
        `BB8051_RAM_ADDR_SEL_SP :   int_ram_addr = sp_reg;
        
        `BB8051_RAM_ADDR_SEL_B  :   int_ram_addr = `BB8051_SFR_B;
        `BB8051_RAM_ADDR_SEL_DPTR : int_ram_addr = `BB8051_SFR_DPTR_LO;
        `BB8051_RAM_ADDR_SEL_PSW:   int_ram_addr = `BB8051_SFR_PSW;
        `BB8051_RAM_ADDR_SEL_ACC:   int_ram_addr = `BB8051_SFR_ACC;
        default: int_ram_addr = 8'b0000_0000;
    endcase
end

//
//  rom read address selecting process 
//	
always@(int_rom_action or alu or dptr or ri)
begin
    case (int_rom_action)
        `BB8051_ROM_ACTION_CODE     : begin
            int_rom_addr = {7'b0, alu };
            pc = {7'b0, alu};
        end                
        `BB8051_ROM_ACTION_DPTR_R   : begin
            int_rom_addr = {7'b0, dptr};
            pc = {3'b0, dptr};
        end    
        `BB8051_ROM_ACTION_DPTR_W   : begin
            int_rom_addr = {7'b0, dptr};
            pc = {3'b0, dptr};
        end                
        `BB8051_ROM_ACTION_RI_R     : begin
            int_rom_addr = {7'b0, ri};
            pc = {7'b0, ri};
        end    
        `BB8051_ROM_ACTION_RI_W     : begin
            int_rom_addr = {7'b0, ri};
            pc = {7'b0, ri};
        end            
        `BB8051_ROM_ACTION_PC_NOR   : int_rom_addr = pc[15:0];
        default : int_rom_addr = pc[15:0];
    endcase
end

//
// pc register process
//
always@(posedge clk or posedge rst)
begin
    if(rst)
        pc <= `BB8051_RST_PC;
    else if(int_rom_action == `BB8051_ROM_ACTION_PC_NOR && !decoder_wait)
        pc <= pc + instruction_len;
end 

//
// op code output process
//
always@(posedge clk or posedge rst)
begin
    if(rst) begin
        op1_out <= 8'b0;
        op2_out <= 8'b0;
        op3_out <= 8'b0;
    end else begin
        op1_out <= int_rom_data[ 7: 0];
        op2_out <= int_rom_data[15: 8];
        op3_out <= int_rom_data[23:16];
    end
end
     


        