module cordic_block( clock, o_angle, i_I, i_Q, reset);
  
   	input logic clock;
   	input logic reset;
  	output logic [15:0] o_angle; 
   	input logic [3:0] i_I;     
   	input logic [3:0] i_Q;      
   	
   
	wire signed [15:0] atan_table [5:0];
		// ATAN TABLE 
	assign atan_table[0] = 45; // 45.000 degrees -> atan(2^0)
	assign atan_table[1] = 27; // 26.565 degrees -> atan(2^-1)
	assign atan_table[2] = 14; // 14.036 degrees -> atan(2^-2)
	assign atan_table[3] = 7;  // 7.018	 degrees -> atan(2^-3)
	assign atan_table[4] = 3;  // 3.509  degrees -> atan(2^-4)
	assign atan_table[5] = 2;  // 1.7545 degrees -> atan(2^-5)

	reg signed [7:0] present_I_table [6:0];
	reg signed [7:0] next_I_table [6:0];;
	reg signed [7:0] present_Q_table [6:0];
	reg signed [7:0] next_Q_table [6:0];
	reg signed [15:0] present_ANGLE_table [6:0];
	reg signed [15:0] next_ANGLE_table [6:0];

	reg unsigned[2:0] present_C_table [7:0];
	reg unsigned[2:0] next_C_table [6:0];	

always_ff@(posedge clock) // sauvegarde dans des registres des résultats des calculs combinatoires
begin
	present_I_table[6] <= next_I_table[5];
	present_I_table[5] <= next_I_table[4];
	present_I_table[4] <= next_I_table[3];
	present_I_table[3] <= next_I_table[2];
	present_I_table[2] <= next_I_table[1];
	present_I_table[1] <= next_I_table[0];

	present_Q_table[6] <= next_Q_table[5];
	present_Q_table[5] <= next_Q_table[4];
	present_Q_table[4] <= next_Q_table[3];
	present_Q_table[3] <= next_Q_table[2];
	present_Q_table[2] <= next_Q_table[1];
	present_Q_table[1] <= next_Q_table[0];

		
	present_ANGLE_table[6] <= next_ANGLE_table[5];
	present_ANGLE_table[5] <= next_ANGLE_table[4];
	present_ANGLE_table[4] <= next_ANGLE_table[3];
	present_ANGLE_table[3] <= next_ANGLE_table[2];
	present_ANGLE_table[2] <= next_ANGLE_table[1];
	present_ANGLE_table[1] <= next_ANGLE_table[0];
	
	present_C_table[7] <= next_C_table[6];
	present_C_table[6] <= next_C_table[5];
	present_C_table[5] <= next_C_table[4];
	present_C_table[4] <= next_C_table[3];
	present_C_table[3] <= next_C_table[2];
	present_C_table[2] <= next_C_table[1];
	present_C_table[1] <= next_C_table[0];

	if(reset == 1'b1) begin
		o_angle <= 0;	
	end

	else begin
		o_angle 	       <= next_ANGLE_table[6];
	end

end

always_ff@(posedge clock) // Recuperation des des échantillons I et Q dans un registre sur 5 bits
			  // (conversion des valeurs sur 4 bits récupérés sur 5 bits)
begin
	if(i_I[3] == 1'b1) begin
		present_I_table[0] <= (i_I | 8'b11110000)<<<3; // Multiplication par 8 
	end else begin
		present_I_table[0] <= (i_I & 8'b00001111)<<<3;
	end

	if(i_Q[3] == 1'b1) begin
		present_Q_table[0] <= (i_Q | 8'b11110000)<<<3;
	end else begin
		present_Q_table[0] <= (i_Q & 8'b00001111)<<<3;
	end

	present_ANGLE_table[0] <= 0;
	present_C_table[0] <= 0;
end


always_comb begin

	next_ANGLE_table[0]=0;
	next_ANGLE_table[1]=present_ANGLE_table[0];
	next_ANGLE_table[2]=present_ANGLE_table[1];
	next_ANGLE_table[3]=present_ANGLE_table[2];
	next_ANGLE_table[4]=present_ANGLE_table[3];
	next_ANGLE_table[5]=present_ANGLE_table[4];
	next_ANGLE_table[6]=present_ANGLE_table[5];

	
	next_I_table[1]=present_I_table[0];
	next_I_table[2]=present_I_table[1];
	next_I_table[3]=present_I_table[2];
	next_I_table[4]=present_I_table[3];
	next_I_table[5]=present_I_table[4];
	next_I_table[6]=present_I_table[5];
	
	next_Q_table[1]=present_Q_table[0];
	next_Q_table[2]=present_Q_table[1];
	next_Q_table[3]=present_Q_table[2];
	next_Q_table[4]=present_Q_table[3];
	next_Q_table[5]=present_Q_table[4];
	next_Q_table[6]=present_Q_table[5];

	
	/////////////////////////////////////////////////////////////////////////// TRANSLATION

	if(present_I_table[0][7] == 1'b1) begin
		next_I_table[0] = (~present_I_table[0]) +1; 
		next_Q_table[0] = (~present_Q_table[0]) +1;
		if(present_Q_table[0][7] == 1'b0) begin
			next_C_table[0] = 3'b010; // c2 on c1 off
		end else begin
			next_C_table[0] = 3'b001; // c2 off c1 on
		end
	end else begin			
		next_I_table[0] = present_I_table[0]; 
		next_Q_table[0] = present_Q_table[0];
		if(present_Q_table[0] == 8'b00000000) begin
			next_C_table[0] = 3'b111; // Angle SPECIAL de 0 degre
		end else begin
			if(present_Q_table[0][7] == 1'b0) begin
				next_C_table[0] = 3'b000; // c2 off c1 off
			end else begin
				next_C_table[0] = 3'b011; // c2 on c1 on
			end
		end
	end

	//next_I_table[0] = present_I_table[0];
	//next_Q_table[0] = present_Q_table[0];
	//next_ANGLE_table[0] = present_ANGLE_table[0];
	//////////////////////////////////////////////////////////////////////////////// CALCUL

	if(present_Q_table[1][7] == 1'b0)begin
		next_I_table[1] = present_I_table[1] + (present_Q_table[1] >>> 0);
		next_Q_table[1] = present_Q_table[1] - (present_I_table[1] >>> 0);
		next_ANGLE_table[0] = present_ANGLE_table[0] + atan_table[0];
	end
	else begin
		next_I_table[1] = present_I_table[1] - (present_Q_table[1] >>> 0);
		next_Q_table[1] = present_Q_table[1] + (present_I_table[1] >>> 0);
		next_ANGLE_table[0] = present_ANGLE_table[0] - atan_table[0];
	end


	if(present_Q_table[2][7] == 1'b0)begin
		next_I_table[2] = present_I_table[2] + (present_Q_table[2] >>> 1);
		next_Q_table[2] = present_Q_table[2] - (present_I_table[2] >>> 1);
		next_ANGLE_table[1] = present_ANGLE_table[1] + atan_table[1];
	end
	else begin
		next_I_table[2] = present_I_table[2] - (present_Q_table[2] >>> 1);
		next_Q_table[2] = present_Q_table[2] + (present_I_table[2] >>> 1);
		next_ANGLE_table[1] = present_ANGLE_table[1] - atan_table[1];
	end

	if(present_Q_table[3][7] == 1'b0)begin
		next_I_table[3] = present_I_table[3] + (present_Q_table[3] >>> 2);
		next_Q_table[3] = present_Q_table[3] - (present_I_table[3] >>> 2);
		next_ANGLE_table[2] = present_ANGLE_table[2] + atan_table[2];
	end
	else begin
		next_I_table[3] = present_I_table[3] - (present_Q_table[3] >>> 2);
		next_Q_table[3] = present_Q_table[3] + (present_I_table[3] >>> 2);
		next_ANGLE_table[2] = present_ANGLE_table[2] - atan_table[2];
	end

	if(present_Q_table[4][7] == 1'b0)begin
		next_I_table[4] = present_I_table[4] + (present_Q_table[4] >>> 3);
		next_Q_table[4] = present_Q_table[4] -(present_I_table[4] >>> 3);
		next_ANGLE_table[3] = present_ANGLE_table[3] + atan_table[3];
	end
	else begin
		next_I_table[4] = present_I_table[4] - (present_Q_table[4] >>> 3);
		next_Q_table[4] = present_Q_table[4] + (present_I_table[4] >>> 3);
		next_ANGLE_table[3] = present_ANGLE_table[3] - atan_table[3];
	end
	
	if(present_Q_table[5][7] == 1'b0)begin
		next_I_table[5] = present_I_table[5] + (present_Q_table[5] >>> 4);
		next_Q_table[5] = present_Q_table[5] -(present_I_table[5] >>> 4);
		next_ANGLE_table[4] = present_ANGLE_table[4] + atan_table[4];
	end
	else begin
		next_I_table[5] = present_I_table[5] - (present_Q_table[5] >>> 4);
		next_Q_table[5] = present_Q_table[5] +(present_I_table[5] >>> 4);
		next_ANGLE_table[4] = present_ANGLE_table[4] - atan_table[4];
	end

	if(present_Q_table[6][7] == 1'b0)begin
		next_ANGLE_table[5] = present_ANGLE_table[5] + atan_table[5];
	end
	else begin
		next_ANGLE_table[5] = present_ANGLE_table[5] - atan_table[5];
	end


	// Decalage de la carry
	next_C_table[1] = present_C_table[1];
	next_C_table[2] = present_C_table[2];
	next_C_table[3] = present_C_table[3];
	next_C_table[4] = present_C_table[4];
	next_C_table[5] = present_C_table[5];
	next_C_table[6] = present_C_table[6];

	unique case (present_C_table[7])
	
		3'b001: begin
			$display ( "C1" ) ;
			next_ANGLE_table[6] = 180 + present_ANGLE_table[6]; 
		end

		3'b010: begin
			$display ( "C2" ) ;
			next_ANGLE_table[6] = 180 + present_ANGLE_table[6]; 
		end

		3'b011: begin
			$display ( "C2 AND C1" ) ;
			next_ANGLE_table[6] = 360 + present_ANGLE_table[6]; 
		end

		3'b111: begin
			$display ( "Angle de 0 degre" ) ;
			next_ANGLE_table[6] = 0; 
		end

		default: begin
			$display ( "DEFAULT" ) ;
			next_ANGLE_table[6] = present_ANGLE_table[6];
		end

	endcase
	
end
	
endmodule
