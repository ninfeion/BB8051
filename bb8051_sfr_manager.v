module bb8051_sfr_manager(
    clk,
    rst,
    
    wr_addr,
    rd_addr,
    
    wr_data,
    rd_data,
    
    
    
    );
    
input clk, rst;


    
        
bb8051_acc bb8051_acc_inst(
    .clk(),
    .rst(),
    
    .sfr_action(), 
    
    .bit_addr(),
    .bit_data(),
    
    .wr_data(),
    .rd_data()
    );
    
bb8051_b_reg bb8051_b_reg_inst(
    .clk(),
    .rst(),
    
    .sfr_action(), 
    
    .bit_addr(),
    .bit_data(),
    
    .wr_data(),
    .rd_data()
    );

bb8051_dptr bb8051_dptr_inst(
    .clk(),
    .rst(),
    
    .sfr_action(), 
    
    .wr_data_h(),
    .wr_data_l(),
    
    .dptr_out_h(),
    .dptr_out_l()
    );

bb8051_tc1 bb8051_tc1_inst(  // timer/counter control
    );
    
bb8051_tc2 bb8051_tc2_inst(
    );

bb8051_int_reg bb8051_int_reg_inst(
    );

bb8051_ports bb8051_ports(
    );

bb8051_psw bb8051_psw(
    ); 

bb8051_sp bb8051_sp(
    );


//bb8051_uart