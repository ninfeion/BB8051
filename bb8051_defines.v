`define BB8051_SFR_DEBUG

//
// sfr action
//
`define BB8051_SFR_ACT_RD_BYTE 2'b00
`define BB8051_SFR_ACT_WR_BYTE 2'b01
`define BB8051_SFR_ACT_RD_BIT  2'b10
`define BB8051_SFR_ACT_WR_BIT  2'b11


//
// src_sel
//
`define BB8051_SRC_SEL_ACC
`define BB8051_SRC_SEL_CONSTANT
`define BB8051_SRC_SEL_NO


//
// ram_action_sel
//
`define BB8051_RAM_ACTION_NO
`define BB8051_RAM_ACTION_WR
`define BB8051_RAM_ACTION_RD


//
// ram_addr_sel
//
`define BB8051_RAM_ADDR_SEL_RN
`define BB8051_RAM_ADDR_SEL_I
`define BB8051_RAM_ADDR_SEL_D 
`define BB8051_RAM_ADDR_SEL_SP 
`define BB8051_RAM_ADDR_SEL_B 
`define BB8051_RAM_ADDR_SEL_DPTR 
`deifne BB8051_RAM_ADDR_SEL_PSW
`define BB8051_RAM_ADDR_SEL_ACC

// 
// rom_action_sel (PC action)
//
`define BB8051_ROM_ACTION_CODE 
`define BB8051_ROM_ACTION_DPTR_R  
`define BB8051_ROM_ACTION_DPTR_W  
`define BB8051_ROM_ACTION_RI_R    
`define BB8051_ROM_ACTION_RI_W     
`define BB8051_ROM_ACTION_PC_NOR   


//
// sfr addresses
//
`define BB8051_SFR_ACC 		8'he0 // accumulator
`define BB8051_SFR_B 		8'hf0 // b register
`define BB8051_SFR_PSW 		8'hd0 // program status word
`define BB8051_SFR_P0 		8'h80 // port 0
`define BB8051_SFR_P1 		8'h90 // port 1
`define BB8051_SFR_P2 		8'ha0 // port 2
`define BB8051_SFR_P3 		8'hb0 // port 3
`define BB8051_SFR_DPTR_LO 	8'h82 // data pointer high bits
`define BB8051_SFR_DPTR_HI 	8'h83 // data pointer low bits
`define BB8051_SFR_IP0 		8'hb8 // interrupt priority
`define BB8051_SFR_IEN0 	8'ha8 // interrupt enable 0
`define BB8051_SFR_TMOD     8'h89 // timer/counter mode
`define BB8051_SFR_TCON     8'h88 // timer/counter control
`define BB8051_SFR_TH0      8'h8c // timer/counter 0 high bits
`define BB8051_SFR_TL0      8'h8a // timer/counter 0 low bits
`define BB8051_SFR_TH1      8'h8d // timer/counter 1 high bits
`define BB8051_SFR_TL1      8'h8b // timer/counter 1 low bits

`define BB8051_SFR_SCON     8'h98 // serial control 0
`define BB8051_SFR_SBUF     8'h99 // serial data buffer 0
`define BB8051_SFR_SADDR    8'ha9 // serila address register 0
`define BB8051_SFR_SADEN    8'hb9 // serila address enable 0

`define BB8051_SFR_PCON     8'h87 // power control
`define BB8051_SFR_SP       8'h81 // stack pointer

`define BB8051_SFR_IE       8'ha8 // interrupt enable
`define BB8051_SFR_IP       8'hb7 // interrupt priority

`define BB8051_SFR_RCAP2H   8'hcb // timer 2 capture high
`define BB8051_SFR_RCAP2L   8'hca // timer 2 capture low

`define BB8051_SFR_T2CON    8'hc8 // timer 2 control register
`define BB8051_SFR_TH2      8'hcd // timer 2 high
`define BB8051_SFR_TL2      8'hcc // timer 2 low


//
// default values (used after reset)
//
`define BB8051_RST_PC       23'h0 // program counter
`define BB8051_RST_ACC      8'h00 // accumulator
`define BB8051_RST_B        8'h00 // b register
`define BB8051_RST_PSW      8'h00 // program status word
`define BB8051_RST_SP       8'b0000_0111 // stack pointer
`define BB8051_RST_DPH      8'h00 // data pointer (high)
`define BB8051_RST_DPL      8'h00 // data pointer (low)
`define BB8051_RST_P0       8'b1111_1111 // port 0
`define BB8051_RST_P1       8'b1111_1111 // port 1
`define BB8051_RST_P2       8'b1111_1111 // port 2
`define BB8051_RST_P3       8'b1111_1111 // port 3
`define BB8051_RST_IP       8'b0000_0000 // interrupt priority
`define BB8051_RST_IE       8'b0000_0000 // interrupt enable
`define BB8051_RST_TMOD     8'b0000_0000 // timer/counter mode control
`define BB8051_RST_TCON     8'b0000_0000 // timer/counter control
`define BB8051_RST_TH0      8'b0000_0000 // timer/counter 0 high bits
`define BB8051_RST_TL0      8'b0000_0000 // timer/counter 0 low bits
`define BB8051_RST_TH1      8'b0000_0000 // timer/counter 1 high bits
`define BB8051_RST_TL1      8'b0000_0000 // timer/counter 1 low bits

`define BB8051_RST_SCON     8'b0000_0000 // serial control
`define BB8051_RST_SBUF     8'b0000_0000 // serial data buffer
`define BB8051_RST_PCON     8'b0000_0000 // power control register

`define BB8051_RST_RCAP2H   8'h00 // timer 2 capture high
`define BB8051_RST_RCAP2L 	8'h00 // timer 2 capture low

`define BB8051_RST_T2CON 	8'h00 // timer 2 control register
`define BB8051_RST_T2MOD 	8'h00 // timer 2 mode control
`define BB8051_RST_TH2 		8'h00 // timer 2 high
`define BB8051_RST_TL2 		8'h00 // timer 2 low



//
// INSTRUCTIONS SET
//

//op_code [4:0]
`define BB8051_ACALL        8'bxxx1_0001 // absolute call
`define BB8051_AJMP 	    8'bxxx0_0001 // absolute jump

//op_code [7:3]
`define BB8051_ADD_R 	    8'b0010_1xxx // add A=A+Rx
`define BB8051_ADDC_R 	    8'b0011_1xxx // add A=A+Rx+c
`define BB8051_ANL_R 	    8'b0101_1xxx // and A=A^Rx
`define BB8051_CJNE_R 	    8'b1011_1xxx // compare and jump if not equal; Rx<>constant
`define BB8051_DEC_R 	    8'b0001_1xxx // decrement reg Rn=Rn-1
`define BB8051_DJNZ_R 	    8'b1101_1xxx // decrement and jump if not zero
`define BB8051_INC_R 	    8'b0000_1xxx // increment Rn
`define BB8051_MOV_R 	    8'b1110_1xxx // move A=Rn
`define BB8051_MOV_AR 	    8'b1111_1xxx // move Rn=A
`define BB8051_MOV_DR 	    8'b1010_1xxx // move Rn=(direct)
`define BB8051_MOV_CR 	    8'b0111_1xxx // move Rn=constant
`define BB8051_MOV_RD 	    8'b1000_1xxx // move (direct)=Rn
`define BB8051_ORL_R 	    8'b0100_1xxx // or A=A or Rn
`define BB8051_SUBB_R 	    8'b1001_1xxx // substract with borrow  A=A-c-Rn
`define BB8051_XCH_R 	    8'b1100_1xxx // exchange A<->Rn
`define BB8051_XRL_R 	    8'b0110_1xxx // XOR A=A XOR Rn

//op_code [7:1]
`define BB8051_ADD_I 	    8'b0010_011x // add A=A+@Ri
`define BB8051_ADDC_I 	    8'b0011_011x // add A=A+@Ri+c
`define BB8051_ANL_I 	    8'b0101_011x // and A=A^@Ri
`define BB8051_CJNE_I 	    8'b1011_011x // compare and jump if not equal; @Ri<>constant
`define BB8051_DEC_I 	    8'b0001_011x // decrement indirect @Ri=@Ri-1
`define BB8051_INC_I 	    8'b0000_011x // increment @Ri
`define BB8051_MOV_I 	    8'b1110_011x // move A=@Ri
`define BB8051_MOV_ID 	    8'b1000_011x // move (direct)=@Ri
`define BB8051_MOV_AI 	    8'b1111_011x // move @Ri=A
`define BB8051_MOV_DI 	    8'b1010_011x // move @Ri=(direct)
`define BB8051_MOV_CI 	    8'b0111_011x // move @Ri=constant
`define BB8051_MOVX_IA 	    8'b1110_001x // move A=(@Ri)
`define BB8051_MOVX_AI 	    8'b1111_001x // move (@Ri)=A
`define BB8051_ORL_I 	    8'b0100_011x // or A=A or @Ri
`define BB8051_SUBB_I 	    8'b1001_011x // substract with borrow  A=A-c-@Ri
`define BB8051_XCH_I 	    8'b1100_011x // exchange A<->@Ri
`define BB8051_XCHD 	    8'b1101_011x // exchange digit A<->Ri
`define BB8051_XRL_I 	    8'b0110_011x // XOR A=A XOR @Ri

//
// op_code [7:0]
// http://www.keil.com/support/man/docs/is51/is51_opcodes.htm
//
`define BB8051_ADD_D 		8'b0010_0101 // add A=A+(direct)
`define BB8051_ADD_C 		8'b0010_0100 // add A=A+constant
`define BB8051_ADDC_D 		8'b0011_0101 // add A=A+(direct)+c
`define BB8051_ADDC_C 		8'b0011_0100 // add A=A+constant+c
`define BB8051_ANL_D 		8'b0101_0101 // and A=A^(direct)
`define BB8051_ANL_C 		8'b0101_0100 // and A=A^constant
`define BB8051_ANL_DD 		8'b0101_0010 // and (direct)=(direct)^A
`define BB8051_ANL_DC 		8'b0101_0011 // and (direct)=(direct)^constant
`define BB8051_ANL_B 		8'b1000_0010 // and c=c^bit
`define BB8051_ANL_NB 		8'b1011_0000 // and c=c^!bit
`define BB8051_CJNE_D 		8'b1011_0101 // compare and jump if not equal; a<>(direct)
`define BB8051_CJNE_C 		8'b1011_0100 // compare and jump if not equal; a<>constant
`define BB8051_CLR_A 		8'b1110_0100 // clear accumulator
`define BB8051_CLR_C 		8'b1100_0011 // clear carry
`define BB8051_CLR_B 		8'b1100_0010 // clear bit
`define BB8051_CPL_A 		8'b1111_0100 // complement accumulator
`define BB8051_CPL_C 		8'b1011_0011 // complement carry
`define BB8051_CPL_B 		8'b1011_0010 // complement bit
`define BB8051_DA 			8'b1101_0100 // decimal adjust (A)
`define BB8051_DEC_A 		8'b0001_0100 // decrement accumulator a=a-1
`define BB8051_DEC_D 		8'b0001_0101 // decrement direct (direct)=(direct)-1
`define BB8051_DIV 			8'b1000_0100 // divide
`define BB8051_DJNZ_D 		8'b1101_0101 // decrement and jump if not zero (direct)
`define BB8051_INC_A 		8'b0000_0100 // increment accumulator
`define BB8051_INC_D 		8'b0000_0101 // increment (direct)
`define BB8051_INC_DP 		8'b1010_0011 // increment data pointer
`define BB8051_JB 			8'b0010_0000 // jump if bit set
`define BB8051_JBC 			8'b0001_0000 // jump if bit set and clear bit
`define BB8051_JC 			8'b0100_0000 // jump if carry is set
`define BB8051_JMP_D 		8'b0111_0011 // jump indirect
`define BB8051_JNB 			8'b0011_0000 // jump if bit not set
`define BB8051_JNC 			8'b0101_0000 // jump if carry not set
`define BB8051_JNZ 			8'b0111_0000 // jump if accumulator not zero
`define BB8051_JZ 			8'b0110_0000 // jump if accumulator zero
`define BB8051_LCALL 		8'b0001_0010 // long call
`define BB8051_LJMP 		8'b0000_0010 // long jump
`define BB8051_MOV_D 		8'b1110_0101 // move A=(direct)
`define BB8051_MOV_C 		8'b0111_0100 // move A=constant
`define BB8051_MOV_DA 		8'b1111_0101 // move (direct)=A
`define BB8051_MOV_DD 		8'b1000_0101 // move (direct)=(direct)
`define BB8051_MOV_CD 		8'b0111_0101 // move (direct)=constant
`define BB8051_MOV_BC 		8'b1010_0010 // move c=bit
`define BB8051_MOV_CB 		8'b1001_0010 // move bit=c
`define BB8051_MOV_DP 		8'b1001_0000 // move dptr=constant(16 bit)
`define BB8051_MOVC_DP 		8'b1001_0011 // move A=dptr+A
`define BB8051_MOVC_PC 		8'b1000_0011 // move A=pc+A
`define BB8051_MOVX_PA 		8'b1110_0000 // move A=(dptr)
`define BB8051_MOVX_AP 		8'b1111_0000 // move (dptr)=A
`define BB8051_MUL 			8'b1010_0100 // multiply a*b
`define BB8051_NOP 			8'b0000_0000 // no operation
`define BB8051_ORL_D 		8'b0100_0101 // or A=A or (direct)
`define BB8051_ORL_C 		8'b0100_0100 // or A=A or constant
`define BB8051_ORL_AD 		8'b0100_0010 // or (direct)=(direct) or A
`define BB8051_ORL_CD 		8'b0100_0011 // or (direct)=(direct) or constant
`define BB8051_ORL_B 		8'b0111_0010 // or c = c or bit
`define BB8051_ORL_NB 		8'b1010_0000 // or c = c or !bit
`define BB8051_POP 			8'b1101_0000 // stack pop
`define BB8051_PUSH 		8'b1100_0000 // stack push
`define BB8051_RET 			8'b0010_0010 // return from subrutine
`define BB8051_RETI 		8'b0011_0010 // return from interrupt
`define BB8051_RL 			8'b0010_0011 // rotate left
`define BB8051_RLC 			8'b0011_0011 // rotate left thrugh carry
`define BB8051_RR 			8'b0000_0011 // rotate right
`define BB8051_RRC 			8'b0001_0011 // rotate right thrugh carry
`define BB8051_SETB_C 		8'b1101_0011 // set carry
`define BB8051_SETB_B 		8'b1101_0010 // set bit
`define BB8051_SJMP 		8'b1000_0000 // short jump
`define BB8051_SUBB_D 		8'b1001_0101 // substract with borrow  A=A-c-(direct)
`define BB8051_SUBB_C 		8'b1001_0100 // substract with borrow  A=A-c-constant
`define BB8051_SWAP 		8'b1100_0100 // swap A(0-3) <-> A(4-7)
`define BB8051_XCH_D 		8'b1100_0101 // exchange A<->(direct)
`define BB8051_XRL_D 		8'b0110_0101 // XOR A=A XOR (direct)
`define BB8051_XRL_C 		8'b0110_0100 // XOR A=A XOR constant
`define BB8051_XRL_AD 		8'b0110_0010 // XOR (direct)=(direct) XOR A
`define BB8051_XRL_CD 		8'b0110_0011 // XOR (direct)=(direct) XOR constant



//
// operation codes for alu
//
`define BB8051_ALU_NOP  4'b0000
`define BB8051_ALU_ADD  4'b0001
`define BB8051_ALU_SUB  4'b0010
`define BB8051_ALU_MUL  4'b0011
`define BB8051_ALU_DIV  4'b0100
`define BB8051_ALU_DA   4'b0101
`define BB8051_ALU_NOT  4'b0110
`define BB8051_ALU_AND  4'b0111
`define BB8051_ALU_XOR  4'b1000
`define BB8051_ALU_OR   4'b1001
`define BB8051_ALU_RL   4'b1010
`define BB8051_ALU_RLC  4'b1011
`define BB8051_ALU_RR   4'b1100
`define BB8051_ALU_RRC  4'b1101
`define BB8051_ALU_INC  4'b1110
`define BB8051_ALU_XCH  4'b1111
