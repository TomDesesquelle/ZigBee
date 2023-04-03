module iq_demod (input logic i_clk,
		 input logic 		   i_rst_n,
		 input logic 		   i_adc_eoc,// pulse when sample is ready
		 input logic [3:0] 	   i_I_if,
		 input logic [3:0] 	   i_Q_if,
		 output logic signed [7:0] o_I_prefilter,
		 output logic signed [7:0] o_Q_prefilter,
		 output logic 		   o_sample_ready);


   

   // == Variables Declaration ====================================================
   
   logic [3:0] 				   I_if_buff;
   logic [3:0] 				   Q_if_buff;
   
   logic signed [3:0] 			   I_if_signed;
   logic signed [3:0] 			   Q_if_signed;
   
   logic signed [7:0] 			   mult_I_cos_out;
   logic signed [7:0] 			   mult_I_sin_out;
   logic signed [7:0] 			   mult_Q_cos_out;
   logic signed [7:0] 			   mult_Q_sin_out;

   logic signed [7:0] 			   add_I_out;
   logic signed [7:0] 			   add_Q_out;

   logic signed [3:0] 			   sin_out;
   logic signed [3:0] 			   cos_out;

   
   

   // == sin/cos Instanciation ====================================================

   //	sin_gen sinus_dig(i_clk, i_rst_n, sin_out);
   //	cos_gen cosinus_dig(i_clk, i_rst_n, cos_out);

   cossin_gen cossin_dig(i_clk, i_rst_n, cos_out, sin_out);


   typedef enum bit [1:0]			   {Init,
					    out_update, 
					    adc_wait} fsm_t;

   fsm_t       state, next_state;


   // == Main Code ================================================================


//   always_ff @(posedge i_adc_eoc or negedge i_rst_n)begin //asynchronous read of ADC output 
//      if(~i_rst_n)begin
//	 I_if_buff_async <= 4'b0000;
//	 Q_if_buff_async <= 4'b0000;
//   end
//      else  begin
//	 I_if_buff_async <= i_I_if;
//	 Q_if_buff_async <= i_Q_if;
//      end
//   end
   
   
   always_ff @(posedge i_clk)begin
      if   (~i_rst_n) begin
	 state <= Init;
	 //o_sample_ready <= 1'b0;
      end
      else         begin
	 //if(next_state == out_update)begin
	   // o_sample_ready <= ~o_sample_ready;
	 //end
	 state <= next_state;
      end
   end // always_ff @ (posedge i_clk)

   
 always_ff @(posedge i_clk)begin
      if   (~i_rst_n) begin
	 Q_if_buff <= 4'b0000;
	 I_if_buff <= 4'b0000;
      end
      else if (i_adc_eoc)        begin
	 Q_if_buff <= i_I_if;
	 I_if_buff <= i_Q_if;
      end
   end

   always @(posedge i_clk) begin
      if(state == Init)begin
	 o_Q_prefilter <= 8'b00000000;// Synchronous Active low Reset of outputs
	 o_I_prefilter <= 8'b00000000;

	 o_sample_ready <= 1'b0;


      end
 

      if(state == out_update)begin
	 o_I_prefilter <= add_I_out;
	 o_Q_prefilter <= add_Q_out;
	 o_sample_ready <= 1'b1;
	 //o_sample_ready <= ~o_sample_ready;
      end

      if(state == adc_wait)begin
	 o_sample_ready <= 1'b0;
      end
      
   end


   
   always_comb  // FSM
     begin
	
	//next_state      = state;
	
	case (state) 
	  Init     :  begin // initial state
             next_state   = (i_adc_eoc) ? out_update : Init;
	  end
	  
	  out_update :  begin
             next_state   = (adc_wait);
	  end
	  
	  adc_wait :  begin
             next_state   = (i_adc_eoc) ? out_update : adc_wait;
	  end

	  default:
	    begin
	       next_state = Init;
	    end
	endcase

     end 


 

   assign I_if_signed = I_if_buff - 4'b1000;
   assign Q_if_signed = Q_if_buff - 4'b1000;
   
   assign mult_I_cos_out = I_if_signed * cos_out; //input value multiplicated by cos
   assign mult_I_sin_out = I_if_signed * sin_out;
   assign mult_Q_cos_out = Q_if_signed * cos_out;
   assign mult_Q_sin_out = Q_if_signed * sin_out;

   assign add_I_out = mult_I_cos_out - mult_Q_sin_out;
   assign add_Q_out = mult_I_sin_out +  mult_Q_cos_out ;


   
   //   always @(o_Q_prefilter or o_I_prefilter) begin
   //      o_sample_ready <= ~o_sample_ready;
   
   //   end      
   
   //   always_ff @(posedge i_clk)begin
   //      if (~i_rst_n)	begin
   //	 o_Q_prefilter <= 8'b00000000;// Synchronous Active low Reset of outputs
   //	 o_I_prefilter <= 8'b00000000;
   //      end
   //      else  begin
   //	 o_I_prefilter <= add_I_out;
   //	 o_Q_prefilter <= add_Q_out;
   //	 
   //	 Q_if_buff <= Q_if_buff_async;// sync of inputs bufferized
   //	 I_if_buff <= I_if_buff_async;
   
   //      end
   //    end	

endmodule
