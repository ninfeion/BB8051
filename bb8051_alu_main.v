module bb8051_alu_main( 
	clk,
	rst,

	op_act,		// (in)  the action signal of alu that send from decoder 
	
	src1,		// (in)  source operand 1 that come from selector.
	src2,
	src3,
	src_c,		// (in)  carry input
	src_ac,		// (in)  auxiliary carry input
	
	des1,		// (out) destination operand
	des2,
	des_acc,	// (out) 
	des_c,		// (out) carry output
	des_ac,		// (out) auxiliary carry output
	des_ov		// (out) overflow output
	);
	
input clk, rst;
input [3:0] op_act;
input [7:0] src1, src2, src3;
input src_c, src_ac;

output reg [7:0] des1, des2, des_acc;
output reg des_c, des_ac, des_ov;