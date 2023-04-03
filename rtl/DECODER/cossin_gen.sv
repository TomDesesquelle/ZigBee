module cossin_gen (input i_clk,
		   input i_rst_n,
		   output reg signed [3:0] o_cos,
		   output reg signed [3:0] o_sin);




   // == Variables Declaration ====================================================
   localparam signed [3:0][3:0] cos_val =
					 {
					  -4'd7,
					  4'd0,
					  4'd7,
					  4'd0
					  };
   

   

   typedef enum bit [1:0] 			   {Init,
					    wait_sample, 
					    shift_sample} fsm_t;

   fsm_t       state, next_state;
   
 logic [2:0] counter, val_counter;
   
   // == Main Code ================================================================

always_ff @(posedge i_clk) begin
    if      (~i_rst_n)             counter <= 0;
    else if (state == wait_sample)  counter <= counter + 1;
    else                        counter <= 0;
end

always_ff @(posedge i_clk) begin
    if      (~i_rst_n)             val_counter <= 0;
    else if (state == shift_sample)begin
       if(val_counter >= 3'd3) val_counter <= 0;
       else val_counter <= val_counter + 1;
    end
end

   
always_ff @(posedge i_clk)begin
    if   (~i_rst_n) state <= Init;
    else         state <= next_state;
end

 always_comb  
  begin
     
    
    case (state) 
      Init     :  begin // initial state
         next_state   = (wait_sample);
      end
      
      wait_sample  :  begin 
	 next_state   = (counter >= 3'd3) ? shift_sample : wait_sample;
      end
      
      shift_sample :  begin
         next_state   = (wait_sample);
      end
      default:
	begin
	   next_state = Init;
	end
      
      
    endcase

  end 

   always @(posedge i_clk) begin
      if(state == Init)begin
	 o_cos <= 4'b0000;
	 o_sin <= 4'b0000;
      end
      
      if(state == shift_sample)begin
	 o_cos <=  cos_val[val_counter];
	 if(val_counter < 3 )begin
	    o_sin <= cos_val[val_counter + 1];// val counter = 1 | 2 | 3  (induce -90° for the sin)
	 end
	 else o_sin <= cos_val[0]; // val_counter = 0
      end
   end
   
endmodule


