module bb8051_acc(
    clk,
    rst,
    
    sfr_action, // byte read or write, bit write
    
    bit_addr,
    bit_data,
    
    wr_data,
    rd_data
    
    );
    
input         clk, rst;

input  [1:0]  sfr_action;

input  [2:0]  bit_addr;
input         bit_data;

input  [7:0]  wr_data;
output [7:0]  acc_out;

reg [7:0] acc_out;

//reg [7:0] acc;
/*
always@(sfr_action, bit_addr, bit_data, wr_data, rd_data)
begin
    if (sfr_action == `BB8051_SFR_ACT_WR_BYTE)
        acc = wr_data;
    else if (sfr_action == `BB8051_SFR_ACR_WR_BIT)
        case (bit_addr)
            3'b000: acc = {acc[7:1], bit_data          };
            3'b001: acc = {acc[7:2], bit_data, acc[0]  };
            3'b010: acc = {acc[7:3], bit_data, acc[1:0]};
            3'b011: acc = {acc[7:4], bit_data, acc[2:0]};
            3'b100: acc = {acc[7:5], bit_data, acc[3:0]};
            3'b101: acc = {acc[7:6], bit_data, acc[4:0]};
            3'b110: acc = {acc[7]  , bit_data, acc[5:0]};
            3'b111: acc = {bit_data, acc[6:0]          };
        endcase
    else
        rd_data = acc;
endcase
*/
always@(posedge clk or posedge rst)
begin
    if (rst)
        acc_out <= `BB8051_RST_ACC;
    else begin
        if (sfr_action == `BB8051_SFR_ACT_WR_BYTE)
            acc_out <= wr_data;
        else if (sfr_action == `BB8051_SFR_ACT_WR_BIT)
            acc_out[bit_addr] <= bit_data;
    end
end