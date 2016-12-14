module bb8051_top(
	e_clk,
	e_rst
	);
	
input e_clk;
input e_rst;

bb8051_alu_main bb8051_alu_main_inst( 
	.clk(e_clk),
	.rst(e_rst)

	.op_act(),
	
	.src1(),
	.src2(),
	.src3(),
	.src_c(),
	.src_ac(),
	
	.des1(),
	.des2(),
	.des_acc(),
	.des_c(),
	.des_ac(),
	.des_ov()
	);
    
bb8051_alu_src_sel bb8051_alu_src_sel_inst(
    .clk(e_clk),
    .rst(e_rst),
    
    .src1_sel(),
    .src2_sel(),
    .src3_sel(),
    
    .src1(),
    .src2(),
    .src3()
    );
	
bb8051_decoder bb8051_decoder_inst(
	.clk(e_clk),
	.rst(e_rst),
	
    .op1_in(),
    .op2_in(),
    .op3_in()
    
    
	.op_code(),
	
	.src1_sel(),
	.src2_sel(),
	.src3_sel(),
	
	.comp_sel(),
	
	.pc_act()
	);
	
bb8051_memory_manager bb8051_memory_manager_inst(
	.clk(e_clk),
	.rst(e_rst),
	
	.op1_out(),
	.op2_out(),
	.op3_out(),
	
	.alu_des1(),
	.alu_des2(),
	
	.alu_des_acc(),
	.alu_des_c(),
	.alu_des_ac(),
	.alu_des_ov()
	
	.int_ram_data_rd(),
	.int_ram_addr_rd(),
	
	.int_ram_data_wr(),
	.int_ram_addr_wr(),
	
	.int_rom_data(),
	.int_ram_addr()
	
	);
	


	
	
	
	
	
	