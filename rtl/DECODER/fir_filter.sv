module fir_filter (input logic i_clk,
		   input logic 		   i_rst_n,
		   input logic 		   i_sample_ready,// pulse when data in is ready
		   input logic signed [7:0] 	   i_I_prefilter,
		   input logic signed [7:0] 	   i_Q_prefilter,
		   output logic signed [3:0] o_I_postfilter,
		   output logic signed [3:0] o_Q_postfilter,
		   output logic 		   o_postfilter_ready);// when data out ready


   

   // == Variables Declaration ====================================================


   logic signed [15:0] 				   I_data_mult_0;
   logic signed [15:0] 				   I_data_mult_1;
   logic signed [15:0] 				   I_data_mult_2;
   logic signed [15:0] 				   I_data_mult_3;
   logic signed [15:0] 				   I_data_mult_4;
   logic signed [15:0] 				   I_data_mult_5;
   logic signed [15:0] 				   I_data_mult_6;
   logic signed [15:0] 				   I_data_mult_7;
   logic signed [15:0] 				   I_data_mult_8;

   logic signed [15:0] 				   I_data_mult_0_buff;
   logic signed [15:0] 				   I_data_mult_1_buff;
   logic signed [15:0] 				   I_data_mult_2_buff;
   logic signed [15:0] 				   I_data_mult_3_buff;
   logic signed [15:0] 				   I_data_mult_4_buff;
   logic signed [15:0] 				   I_data_mult_5_buff;
   logic signed [15:0] 				   I_data_mult_6_buff;
   logic signed [15:0] 				   I_data_mult_7_buff;
   
   logic signed [15:0] 				   I_data_mult_8_delay;// !!
   logic signed [20:0] 				   I_data_mult_8_buff;// !!

   logic signed [15:0] 				   Q_data_mult_0;
   logic signed [15:0] 				   Q_data_mult_1;
   logic signed [15:0] 				   Q_data_mult_2;
   logic signed [15:0] 				   Q_data_mult_3;
   logic signed [15:0] 				   Q_data_mult_4;
   logic signed [15:0] 				   Q_data_mult_5;
   logic signed [15:0] 				   Q_data_mult_6;
   logic signed [15:0] 				   Q_data_mult_7;
   logic signed [15:0] 				   Q_data_mult_8;

   logic signed [15:0] 				   Q_data_mult_0_buff;
   logic signed [15:0] 				   Q_data_mult_1_buff;
   logic signed [15:0] 				   Q_data_mult_2_buff;
   logic signed [15:0] 				   Q_data_mult_3_buff;
   logic signed [15:0] 				   Q_data_mult_4_buff;
   logic signed [15:0] 				   Q_data_mult_5_buff;
   logic signed [15:0] 				   Q_data_mult_6_buff;
   logic signed [15:0] 				   Q_data_mult_7_buff;
  
   logic signed [15:0] 				   Q_data_mult_8_delay;// !!
   logic signed [20:0] 				   Q_data_mult_8_buff;// !!

   logic signed [20:0] 				   I_data_add_0;
   logic signed [20:0] 				   I_data_add_1;
   logic signed [20:0] 				   I_data_add_2;
   logic signed [20:0] 				   I_data_add_3;
   logic signed [20:0] 				   I_data_add_4;
   logic signed [20:0] 				   I_data_add_5;
   logic signed [20:0] 				   I_data_add_6;
   logic signed [20:0] 				   I_data_add_7;

   logic signed [20:0] 				   Q_data_add_0;
   logic signed [20:0] 				   Q_data_add_1;
   logic signed [20:0] 				   Q_data_add_2;
   logic signed [20:0] 				   Q_data_add_3;
   logic signed [20:0] 				   Q_data_add_4;
   logic signed [20:0] 				   Q_data_add_5;
   logic signed [20:0] 				   Q_data_add_6;
   logic signed [20:0] 				   Q_data_add_7;


   logic signed [20:0] 				   I_data_add_1_buff;
   logic signed [20:0] 				   I_data_add_2_buff;
   logic signed [20:0] 				   I_data_add_3_buff;
   logic signed [20:0] 				   I_data_add_4_buff;
   logic signed [20:0] 				   I_data_add_5_buff;
   logic signed [20:0] 				   I_data_add_6_buff;
   logic signed [20:0] 				   I_data_add_7_buff;
   

   logic signed [20:0] 				   Q_data_add_1_buff;
   logic signed [20:0] 				   Q_data_add_2_buff;
   logic signed [20:0] 				   Q_data_add_3_buff;
   logic signed [20:0] 				   Q_data_add_4_buff;
   logic signed [20:0] 				   Q_data_add_5_buff;
   logic signed [20:0] 				   Q_data_add_6_buff;
   logic signed [20:0] 				   Q_data_add_7_buff;





   
   localparam signed   [4:0][7:0] rom_code  = 
				     {8'hF5, 8'hE9, // System address @4, @3
				      8'h1A, 8'h4B,
				      8'h69};  // System address @0

   

   // == sin/cos Instanciation ====================================================



   typedef  enum bit  [1:0] 				   {Init,
						    wait_sample,
//						    proc, 
						    write_out} fsm_t;

   fsm_t       state, next_state;


   // == Main Code ================================================================

   
   always_ff @(posedge i_clk)begin
      if   (~i_rst_n) begin
	 state <= Init;
      end
      else         begin
	 state <= next_state;
      end
   end

   always_comb  // FSM
     begin
	
	case (state) 
	  Init     :  begin // initial state
             next_state   = (i_sample_ready) ? write_out : Init;
	  end
	  
	  wait_sample  :  begin 
	     next_state   = (i_sample_ready) ? write_out : wait_sample;
	  end
	  
/*	  proc :  begin
             next_state   = write_out;
	  end
*/	  
	  write_out :  begin
             next_state   = wait_sample;
	  end
	  default:
	    begin
	       next_state = Init;
	    end
	  
	endcase

     end // always_comb begin
   

   always_ff @(posedge i_clk)begin
      if   (state == write_out) begin // shift all registers (including the output)
	 o_I_postfilter <= I_data_add_0[14:11];//outputs !!!!!!!!!!masked!!!!!!!!!!!!
	 o_Q_postfilter <= Q_data_add_0[14:11];
	 
	 I_data_add_1_buff <= I_data_add_1;	 
	 I_data_add_2_buff <= I_data_add_2;
	 I_data_add_3_buff <= I_data_add_3;
	 I_data_add_4_buff <= I_data_add_4;
	 I_data_add_5_buff <= I_data_add_5;
	 I_data_add_6_buff <= I_data_add_6;
	 I_data_add_7_buff <= I_data_add_7;


	 I_data_mult_0_buff <= I_data_mult_0;
	 I_data_mult_1_buff <= I_data_mult_1;
	 I_data_mult_2_buff <= I_data_mult_2;
	 I_data_mult_3_buff <= I_data_mult_3;
	 I_data_mult_4_buff <= I_data_mult_4;
	 I_data_mult_5_buff <= I_data_mult_5;
	 I_data_mult_6_buff <= I_data_mult_6;
	 I_data_mult_7_buff <= I_data_mult_7;
	 
	
	 I_data_mult_8_delay <= I_data_mult_8;
	 I_data_mult_8_buff <= I_data_mult_8_delay[15] ? {5'b11111,I_data_mult_8_delay} : {5'b00000,I_data_mult_8_delay};
	 
	 Q_data_add_1_buff <= Q_data_add_1;	 
	 Q_data_add_2_buff <= Q_data_add_2;
	 Q_data_add_3_buff <= Q_data_add_3;
	 Q_data_add_4_buff <= Q_data_add_4;
	 Q_data_add_5_buff <= Q_data_add_5;
	 Q_data_add_6_buff <= Q_data_add_6;
	 Q_data_add_7_buff <= Q_data_add_7;

	 Q_data_mult_0_buff <= Q_data_mult_0;
	 Q_data_mult_1_buff <= Q_data_mult_1;
	 Q_data_mult_2_buff <= Q_data_mult_2;
	 Q_data_mult_3_buff <= Q_data_mult_3;
	 Q_data_mult_4_buff <= Q_data_mult_4;
	 Q_data_mult_5_buff <= Q_data_mult_5;
	 Q_data_mult_6_buff <= Q_data_mult_6;
	 Q_data_mult_7_buff <= Q_data_mult_7;

	 Q_data_mult_8_delay <=  Q_data_mult_8;
	 Q_data_mult_8_buff <= Q_data_mult_8_delay[15] ? {5'b11111,Q_data_mult_8_delay} : {5'b00000,Q_data_mult_8_delay};

	 
	 o_postfilter_ready <= 1'b1;
      end // if (state == write_out)

      if(state == Init)begin   // reset of registers
	 o_Q_postfilter <= 21'd0;
	 o_I_postfilter <= 21'd0;
	 
	 I_data_add_1_buff <= 21'd0;	 
	 I_data_add_2_buff <= 21'd0;
	 I_data_add_3_buff <= 21'd0;
	 I_data_add_4_buff <= 21'd0;
	 I_data_add_5_buff <= 21'd0;
	 I_data_add_6_buff <= 21'd0;
	 I_data_add_7_buff <= 21'd0;
	 
	 I_data_mult_8_buff <= 21'd0;
	 
	 Q_data_add_1_buff <= 21'd0;	 
	 Q_data_add_2_buff <= 21'd0;
	 Q_data_add_3_buff <= 21'd0;
	 Q_data_add_4_buff <= 21'd0;
	 Q_data_add_5_buff <= 21'd0;
	 Q_data_add_6_buff <= 21'd0;
	 Q_data_add_7_buff <= 21'd0;
	 
	 Q_data_mult_8_buff <= 21'd0;


	 I_data_mult_0_buff <= 16'd0;
	 I_data_mult_1_buff <= 16'd0;
	 I_data_mult_2_buff <= 16'd0;
	 I_data_mult_3_buff <= 16'd0;
	 I_data_mult_4_buff <= 16'd0;
	 I_data_mult_5_buff <= 16'd0;
	 I_data_mult_6_buff <= 16'd0;
	 I_data_mult_7_buff <= 16'd0;
	 I_data_mult_8_delay <=16'd0;
 
	    

	 Q_data_mult_0_buff <= 16'd0;
	 Q_data_mult_1_buff <= 16'd0;
	 Q_data_mult_2_buff <= 16'd0;
	 Q_data_mult_3_buff <= 16'd0;
	 Q_data_mult_4_buff <= 16'd0;
	 Q_data_mult_5_buff <= 16'd0;
	 Q_data_mult_6_buff <= 16'd0;
	 Q_data_mult_7_buff <= 16'd0;
	 Q_data_mult_8_delay <=16'd0;

	 o_postfilter_ready <= 1'b0; 
      end // if (state == Init)
      
      if(state == wait_sample)begin
	 o_postfilter_ready <= 1'b0; 
      end
      
   end // always_ff @ (posedge i_clk)
   
   
   
   
   
   assign I_data_mult_0 = i_I_prefilter * $signed(rom_code[4]);
   assign I_data_mult_1 = i_I_prefilter * $signed(rom_code[3]);
   assign I_data_mult_2 = i_I_prefilter * $signed(rom_code[2]);
   assign I_data_mult_3 = i_I_prefilter * $signed(rom_code[1]);
   assign I_data_mult_4 = i_I_prefilter * $signed(rom_code[0]);
   assign I_data_mult_5 = i_I_prefilter * $signed(rom_code[1]);
   assign I_data_mult_6 = i_I_prefilter * $signed(rom_code[2]);
   assign I_data_mult_7 = i_I_prefilter * $signed(rom_code[3]);
   assign I_data_mult_8 = i_I_prefilter * $signed(rom_code[4]);
   
   /*
   assign I_data_add_0 = I_data_mult_0_buff[15] ? {5'b11111,I_data_mult_0_buff} + I_data_add_1_buff : {5'b00000,I_data_mult_0_buff} + I_data_add_1_buff;
   assign I_data_add_1 = I_data_mult_1_buff[15] ? {5'b11111,I_data_mult_1_buff} + I_data_add_2_buff : {5'b00000,I_data_mult_1_buff} + I_data_add_2_buff;
   assign I_data_add_2 = I_data_mult_2_buff[15] ? {5'b11111,I_data_mult_2_buff} + I_data_add_3_buff : {5'b00000,I_data_mult_2_buff} + I_data_add_3_buff;
   assign I_data_add_3 = I_data_mult_3_buff[15] ? {5'b11111,I_data_mult_3_buff} + I_data_add_4_buff : {5'b00000,I_data_mult_3_buff} + I_data_add_4_buff;
   assign I_data_add_4 = I_data_mult_4_buff[15] ? {5'b11111,I_data_mult_4_buff} + I_data_add_5_buff : {5'b00000,I_data_mult_4_buff} + I_data_add_5_buff;
   assign I_data_add_5 = I_data_mult_5_buff[15] ? {5'b11111,I_data_mult_5_buff} + I_data_add_6_buff : {5'b00000,I_data_mult_5_buff} + I_data_add_6_buff;
   assign I_data_add_6 = I_data_mult_6_buff[15] ? {5'b11111,I_data_mult_6_buff} + I_data_add_7_buff : {5'b00000,I_data_mult_6_buff} + I_data_add_7_buff;
   //assign I_data_add_7 = I_data_mult_7 + I_data_mult_8_buff; // !! 
   assign I_data_add_7 = I_data_mult_7_buff[15] ? {5'b11111,I_data_mult_7_buff} + I_data_mult_8_buff : {5'b00000,I_data_mult_7_buff} + I_data_mult_8_buff ; // !! 
   */
   
   assign I_data_add_0 = {I_data_mult_0_buff[15],I_data_mult_0_buff[15],I_data_mult_0_buff[15],I_data_mult_0_buff[15],I_data_mult_0_buff[15],I_data_mult_0_buff} + I_data_add_1_buff;
   assign I_data_add_1 = {I_data_mult_1_buff[15],I_data_mult_1_buff[15],I_data_mult_1_buff[15],I_data_mult_1_buff[15],I_data_mult_1_buff[15],I_data_mult_1_buff} + I_data_add_2_buff;
   assign I_data_add_2 = {I_data_mult_2_buff[15],I_data_mult_2_buff[15],I_data_mult_2_buff[15],I_data_mult_2_buff[15],I_data_mult_2_buff[15],I_data_mult_2_buff} + I_data_add_3_buff;
   assign I_data_add_3 = {I_data_mult_3_buff[15],I_data_mult_3_buff[15],I_data_mult_3_buff[15],I_data_mult_3_buff[15],I_data_mult_3_buff[15],I_data_mult_3_buff} + I_data_add_4_buff;
   assign I_data_add_4 = {I_data_mult_4_buff[15],I_data_mult_4_buff[15],I_data_mult_4_buff[15],I_data_mult_4_buff[15],I_data_mult_4_buff[15],I_data_mult_4_buff} + I_data_add_5_buff;
   assign I_data_add_5 = {I_data_mult_5_buff[15],I_data_mult_5_buff[15],I_data_mult_5_buff[15],I_data_mult_5_buff[15],I_data_mult_5_buff[15],I_data_mult_5_buff} + I_data_add_6_buff;
   assign I_data_add_6 = {I_data_mult_6_buff[15],I_data_mult_6_buff[15],I_data_mult_6_buff[15],I_data_mult_6_buff[15],I_data_mult_6_buff[15],I_data_mult_6_buff} + I_data_add_7_buff;
   assign I_data_add_7 = {I_data_mult_7_buff[15],I_data_mult_7_buff[15],I_data_mult_7_buff[15],I_data_mult_7_buff[15],I_data_mult_7_buff[15],I_data_mult_7_buff} + I_data_mult_8_buff ; // !! 
   
   
   assign Q_data_mult_0 =  i_Q_prefilter * $signed(rom_code[4]);
   assign Q_data_mult_1 =  i_Q_prefilter * $signed(rom_code[3]);
   assign Q_data_mult_2 =  i_Q_prefilter * $signed(rom_code[2]);
   assign Q_data_mult_3 =  i_Q_prefilter * $signed(rom_code[1]);
   assign Q_data_mult_4 =  i_Q_prefilter * $signed(rom_code[0]);
   assign Q_data_mult_5 =  i_Q_prefilter * $signed(rom_code[1]);
   assign Q_data_mult_6 =  i_Q_prefilter * $signed(rom_code[2]);
   assign Q_data_mult_7 =  i_Q_prefilter * $signed(rom_code[3]);
   assign Q_data_mult_8 =  i_Q_prefilter * $signed(rom_code[4]);
   
   /*
   assign Q_data_add_0 = Q_data_mult_0_buff[15] ? {5'b11111,Q_data_mult_0_buff} + Q_data_add_1_buff : {5'b00000,Q_data_mult_0_buff} + Q_data_add_1_buff;
   assign Q_data_add_1 = Q_data_mult_1_buff[15] ? {5'b11111,Q_data_mult_1_buff} + Q_data_add_2_buff : {5'b00000,Q_data_mult_1_buff} + Q_data_add_2_buff;
   assign Q_data_add_2 = Q_data_mult_2_buff[15] ? {5'b11111,Q_data_mult_2_buff} + Q_data_add_3_buff : {5'b00000,Q_data_mult_2_buff} + Q_data_add_3_buff;
   assign Q_data_add_3 = Q_data_mult_3_buff[15] ? {5'b11111,Q_data_mult_3_buff} + Q_data_add_4_buff : {5'b00000,Q_data_mult_3_buff} + Q_data_add_4_buff;
   assign Q_data_add_4 = Q_data_mult_4_buff[15] ? {5'b11111,Q_data_mult_4_buff} + Q_data_add_5_buff : {5'b00000,Q_data_mult_4_buff} + Q_data_add_5_buff;
   assign Q_data_add_5 = Q_data_mult_5_buff[15] ? {5'b11111,Q_data_mult_5_buff} + Q_data_add_6_buff : {5'b00000,Q_data_mult_5_buff} + Q_data_add_6_buff;
   assign Q_data_add_6 = Q_data_mult_6_buff[15] ? {5'b11111,Q_data_mult_6_buff} + Q_data_add_7_buff : {5'b00000,Q_data_mult_6_buff} + Q_data_add_7_buff;
   //assign Q_data_add_7 = Q_data_mult_7 + Q_data_mult_8_buff; // !! 
   assign Q_data_add_7 = Q_data_mult_7_buff[15] ? {5'b11111,Q_data_mult_7_buff} + Q_data_mult_8_buff : {5'b00000,Q_data_mult_7_buff} + Q_data_mult_8_buff ; // !! 
   */
      
   assign Q_data_add_0 = {Q_data_mult_0_buff[15],Q_data_mult_0_buff[15],Q_data_mult_0_buff[15],Q_data_mult_0_buff[15],Q_data_mult_0_buff[15],Q_data_mult_0_buff} + Q_data_add_1_buff;
   assign Q_data_add_1 = {Q_data_mult_1_buff[15],Q_data_mult_1_buff[15],Q_data_mult_1_buff[15],Q_data_mult_1_buff[15],Q_data_mult_1_buff[15],Q_data_mult_1_buff} + Q_data_add_2_buff;
   assign Q_data_add_2 = {Q_data_mult_2_buff[15],Q_data_mult_2_buff[15],Q_data_mult_2_buff[15],Q_data_mult_2_buff[15],Q_data_mult_2_buff[15],Q_data_mult_2_buff} + Q_data_add_3_buff;
   assign Q_data_add_3 = {Q_data_mult_3_buff[15],Q_data_mult_3_buff[15],Q_data_mult_3_buff[15],Q_data_mult_3_buff[15],Q_data_mult_3_buff[15],Q_data_mult_3_buff} + Q_data_add_4_buff;
   assign Q_data_add_4 = {Q_data_mult_4_buff[15],Q_data_mult_4_buff[15],Q_data_mult_4_buff[15],Q_data_mult_4_buff[15],Q_data_mult_4_buff[15],Q_data_mult_4_buff} + Q_data_add_5_buff;
   assign Q_data_add_5 = {Q_data_mult_5_buff[15],Q_data_mult_5_buff[15],Q_data_mult_5_buff[15],Q_data_mult_5_buff[15],Q_data_mult_5_buff[15],Q_data_mult_5_buff} + Q_data_add_6_buff;
   assign Q_data_add_6 = {Q_data_mult_6_buff[15],Q_data_mult_6_buff[15],Q_data_mult_6_buff[15],Q_data_mult_6_buff[15],Q_data_mult_6_buff[15],Q_data_mult_6_buff} + Q_data_add_7_buff;
   assign Q_data_add_7 = {Q_data_mult_7_buff[15],Q_data_mult_7_buff[15],Q_data_mult_7_buff[15],Q_data_mult_7_buff[15],Q_data_mult_7_buff[15],Q_data_mult_7_buff} + Q_data_mult_8_buff ; // !! 
   
endmodule
