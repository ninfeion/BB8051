module bb8051_dptr(
    clk,
    rst,
    
    sfr_action, // byte read or write, bit write
    
    // bit_addr,
    // bit_data,
    
    wr_data_h,
    wr_data_l,
    
    dptr_out_h,
    dptr_out_l
    );
    
input         clk, rst;

input  [1:0]  sfr_action;

// input  [2:0]  bit_addr;
// input         bit_data;

input  [7:0]  wr_data_h;
input  [7:0]  wr_data_l;

output [7:0]  dptr_out_h;
output [7:0]  dptr_out_l;

reg [7:0]  dptr_out_h;
reg [7:0]  dptr_out_l;

always@(posedge clk or posedge rst)
begin
    if (rst) begin
        dptr_out_h <= `BB8051_RST_DPH;
        dptr_out_l <= `BB8051_RST_DPL;
    end    
    else begin
        if (sfr_action == `BB8051_SFR_ACT_WR_BYTE) begin
            dptr_out_h <= wr_data_h;
            dptr_out_l <= wr_data_l;
        end
    end
end  
