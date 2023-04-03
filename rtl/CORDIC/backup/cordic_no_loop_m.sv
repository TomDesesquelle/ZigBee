module cordic_no_loop_m( clock, o_angle, i_I, i_Q, reset, o_dir);
  
   input logic clock;
   input logic reset;
   output logic [15:0] o_angle; 
   input logic [3:0] i_I;     
   input logic [3:0] i_Q;      
   output logic o_dir;
   
   //Iterations nb 
	logic c1; // logic variable active high when translation to quadrant 1 
	logic c2; // logic variable active high when translation to quadrant 1 


	reg [3:0] r_I_k; 
	reg [3:0] r_Q_k;
	reg [3:0] r_next_I,r_present_I; 
	reg [3:0] r_next_Q,r_present_Q; 	
	reg [15:0]  r_present_alpha, r_next_alpha;

	

	wire signed [15:0] atan_table [0:5];
		// ATAN TABLE 
	   assign atan_table[0] = 45; // 45.000 degrees -> atan(2^0)
	   assign atan_table[1] = 27; // 26.565 degrees -> atan(2^-1)
	   assign atan_table[2] = 14; // 14.036 degrees -> atan(2^-2)
	   assign atan_table[3] = 7;  // 7.018	 degrees -> atan(2^-3)
	   assign atan_table[4] = 3;  // 3.509  degrees -> atan(2^-4)
	   assign atan_table[5] = 2;  // 1.7545 degrees -> atan(2^-5)
	   
	typedef enum { IDLE, CALCUL1, CALCUL2, CALCUL3, CALCUL4,CALCUL5,CALCUL6, END} STATE; 
	STATE present_state = IDLE;
	STATE next_state = IDLE;

always_ff@(posedge clock,posedge reset)

begin
	if( reset) begin
		present_state <= IDLE; 
		r_present_I<=i_I;
		r_present_Q<=i_Q;
		r_present_alpha<=0;
		end
	else begin


		r_present_I<= r_next_I;
		r_present_Q<= r_next_Q;
		r_present_alpha <=r_next_alpha;
		present_state <= next_state;
	 end

	
end

always_comb
	begin

	next_state=present_state;
	r_next_I= r_present_I;
	r_next_Q= r_present_Q;
	r_next_alpha= r_present_alpha;
	//r_I_k = r_present_I; 
	//r_Q_k = r_present_Q;

	unique case(present_state)
		
	IDLE:	begin
		//Instatiation of inputs, outputs
		// I and Q input signals recuperation

		r_next_I=i_I;
		r_next_Q=i_Q;
		r_I_k = i_I;
		r_Q_k = i_Q;

		// Reset reg ans logic variables
		o_angle=16'hffff;
		r_next_alpha=16'h00;
		o_dir=1'b0;
		c1=1'b0;
		c2=1'b0;
		next_state=CALCUL1;

		end
		
	CALCUL1: begin

		if ( r_present_I==4'b0000) 		 ////////////////////// CAS I=0
			begin
				if( r_present_Q[3]==1) begin 
						// I=0 Q negatif
					o_angle=-90;
					end
				else if (r_present_Q[3]==0) begin 
					// I=0 Q positif
					o_angle=90;
					end
				next_state= END;
			end
	
		else if ( r_present_Q==4'b0000)		////////////////////// CAS Q=0
			begin
				if( r_present_I[3]==1) begin
					// Q=0 I negatif
					o_angle=180; end
				else if (r_present_I[3]==0) begin
					// Q=0 I positif
					o_angle=0; end
				next_state= END;
			end
	
 		else begin 				///////////////////// CAS I!=0 Q!=0
			if( r_present_I[3]==0) begin 
				//  I positif pas de translation 
							/////////////////// ITERATION 0
					r_I_k = r_present_I >> 0; 
					r_Q_k = r_present_Q >> 0;
							////////////////////  CALCUL1

				if(r_present_Q[3] == 1'b0) // I positif Q positif, Q1
					begin
					r_next_I = r_present_I + r_Q_k;
					r_next_Q = r_present_Q - r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha + atan_table[0];
					end
				else 			// I positif Q negatif, Q2
					begin
					r_next_I= r_present_I - r_Q_k;
					r_next_Q= r_present_Q + r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha - atan_table[0];
					end								
			end

			else 
			begin 	// I negatif translation necessaire 

					r_next_I= (~r_I_k)+1 ; // modification   i_I= (~i_I)+1
					r_next_Q= (~r_Q_k)+1 ; // modification   i_Q= (~i_Q)+1	
					r_I_k = r_present_I >> 0; 	//ITERATION 0
					r_Q_k = r_present_Q >> 0; // modif rQK to rpresent Q

				if(r_present_Q[3]==0)begin //  I negatif Q negatif, translation en Q1
					c1=1;	// quadrant 1

							///////////////// CALCUL 1
					r_next_I= r_present_I + r_Q_k;
					r_next_Q= r_present_Q - r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha - atan_table[0];
				
				end
				
				else 			//  I negatif Q positif, translation en Q2
					c2=1;	// quadrant 2
					r_next_I= r_present_I - r_Q_k;
					r_next_Q= r_present_Q + r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha - atan_table[0];

				end
					
			end			
		
		next_state= CALCUL2;

	end
	////////////////////////////////////// Fin du 1er calcul, angles speciaux et translation

	CALCUL2: begin
					//r_I_k = r_present_I;
					//r_Q_k = r_present_Q;
 					
					r_I_k = r_present_I >> 1; 
					r_Q_k = r_present_Q >> 1;
						///////////////////// CALCUL2

				if(r_present_Q[3] == 1'b0) 
					begin
					r_next_I= r_present_I + r_Q_k;
					r_next_Q= r_present_Q - r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha + atan_table[1];
					end
				else 
					begin
					r_next_I= r_present_I - r_Q_k;
					r_next_Q= r_present_Q + r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha - atan_table[1];
					end
		next_state = CALCUL3;
		end
	//////////////////////////////////// Fin du 2eme calcul
		
	CALCUL3: begin
					//r_I_k = r_present_I;
					//r_Q_k = r_present_Q;
 					
					r_I_k = r_present_I >> 2; // ITERATION 2 
					r_Q_k = r_present_Q >> 2;
			
					///////////CALCUL3

				if(r_present_Q[3] == 1'b0) 
					begin
					r_next_I= r_present_I + r_Q_k;
					r_next_Q= r_present_Q - r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha + atan_table[2];
					end
				else 
					begin
					r_next_I= r_present_I - r_Q_k;
					r_next_Q= r_present_Q + r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha - atan_table[2];
					end
		next_state=CALCUL4;
		end
	///////////////////////////////// Fin du 3eme  calcul

	CALCUL4: begin
					//r_I_k = r_present_I;
					//r_Q_k = r_present_Q;
 					
					r_I_k = r_present_I >> 3; // ITERATION 3
					r_Q_k = r_present_Q >> 3;

					///////////CALCUL4

				if(r_present_Q[3] == 1'b0) 
					begin
					r_next_I= r_present_I + r_Q_k;
					r_next_Q= r_present_Q - r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha + atan_table[3];
					end
				else 
					begin
					r_next_I= r_present_I - r_Q_k;
					r_next_Q= r_present_Q + r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha - atan_table[3];
					end
		next_state=CALCUL5;
		end
	CALCUL5: begin
					//r_I_k = r_present_I;
					//r_Q_k = r_present_Q;
 					
					r_I_k = r_present_I >> 4; // ITERATION 4
					r_Q_k = r_present_Q >> 4;

					///////////CALCUL4

				if(r_present_Q[3] == 1'b0) 
					begin
					r_next_I= r_present_I + r_Q_k;
					r_next_Q= r_present_Q - r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha + atan_table[4];
					end
				else 
					begin
					r_next_I= r_present_I - r_Q_k;
					r_next_Q= r_present_Q + r_I_k;
					// Utilisation du tableau arctan o_angle
					r_next_alpha = r_present_alpha - atan_table[4];
					end
		next_state=CALCUL6;
		end
	///////////////////////////////// Fin du 4eme  calcul
	CALCUL6: begin
						//r_I_k = r_present_I;
						//r_Q_k = r_present_Q;
	 					
						r_I_k = r_present_I >> 5; // ITERATION 4
						r_Q_k = r_present_Q >> 5;

						///////////CALCUL4

					if(r_present_Q[3] == 1'b0) 
						begin
						r_next_I= r_present_I + r_Q_k;
						r_next_Q= r_present_Q - r_I_k;
						// Utilisation du tableau arctan o_angle
						r_next_alpha = r_present_alpha + atan_table[5];
						end
					else 
						begin
						r_next_I= r_present_I - r_Q_k;
						r_next_Q= r_present_Q + r_I_k;
						// Utilisation du tableau arctan o_angle
						r_next_alpha = r_present_alpha - atan_table[5];
						end
			next_state=END;
			end
		///////////////////////////////// Fin du 4eme  calcul
	END: begin
		o_angle = r_present_alpha;
		next_state=IDLE;
		end
	default: begin 
		next_state=END;
		end
	endcase
end
endmodule

