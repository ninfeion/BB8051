module bb8051_b_reg(
    clk,
    rst,
    
    sfr_action, // byte read or write, bit write
    
    bit_addr,
    bit_data,
    
    wr_data,
    b_reg_out
    );
    
input         clk, rst;

input  [1:0]  sfr_action;

input  [2:0]  bit_addr;
input         bit_data;

input  [7:0]  wr_data;
output [7:0]  b_reg_out;

reg [7:0] b_reg_out;

always@(posedge clk or posedge rst)
begin
    if (rst)
        b_reg_out <= `BB8051_RST_B;
    else begin
        if (sfr_action == `BB8051_SFR_ACT_WR_BYTE)
            b_reg_out <= wr_data;
        else if (sfr_action == `BB8051_SFR_ACT_WR_BIT)
            b_reg_out[bit_addr] <= bit_data;
    end
end    