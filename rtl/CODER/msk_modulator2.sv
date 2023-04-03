module msk_modulator (input clk, input reset, input reg i_empty, input reg i_data, output reg o_ready, output reg[3:0] o_sinI, output reg[3:0] o_sinQ, output reg[3:0] o_sinI_four, output reg[3:0] o_sinQ_four);
	reg[19:0] i;
	reg[19:0] j;
	
	reg[19:0] c;
	
	reg clk_10M;
	reg my_clk_10M;
	
	reg IorQ;
	reg sin_was_positiveI;
	reg sin_was_positiveQ;
	reg isPositiveI;
	reg isPositiveQ;
	reg is9;
	reg old_i_data;

	/*reg[19:0] next_i;
	reg[19:0] next_j;
	reg next_IorQ;
	reg next_sin_was_positiveI;
	reg next_sin_was_positiveQ;
	reg next_isPositiveI;
	reg next_isPositiveQ;
	reg next_is9;
	reg next_old_i_data;
	reg next_o_ready;*/
	
	typedef enum reg[1:0]    {state_readyI, state_bit_recI} state_tI;
	typedef enum reg[1:0]	 {state_readyQ, state_bit_recQ} state_tQ;
	state_tI stateI, next_stateI;
	state_tQ stateQ, next_stateQ;
	
	//logic signed [4:0] array_sin [10];
	//logic signed [4:0] arsim:/msk_modulator_benchray_sin_neg [10];
	
	localparam [9:0][3:0] array_sin =
				{
				 4'd1,
				 4'd3,
				 4'd5,
				 4'd6,
				 4'd7,
				 4'd7,
				 4'd6,
				 4'd5,
				 4'd3,
				 4'd1
					
				 };
	localparam [9:0][3:0] array_sin_neg =
				{
				 -4'd1,
				 -4'd3,
				 -4'd5,
				 -4'd6,
				 -4'd7,
				 -4'd7,
				 -4'd6,
				 -4'd5,
				 -4'd3,
				 -4'd1
					
				 };

	// Sinus avec 4 échantillons
	localparam [1:0][3:0] array_sin_four =
				{
				 4'd7,
				 4'd1
					
				 };
	localparam [1:0][3:0] array_sin_neg_four =
				{
				 -4'd7,
				 -4'd1
					
				 };

	/*real array_sin [0:9];
	real array_sin_neg [0:9];*/


	//_____________________________________________________________________________________________________________________________________________________always pour les changements d etats
   	
	always @(posedge clk) begin
		if(c == 4) begin
			clk_10M <= 1;
			c <= 0;		
		end
		else begin
			clk_10M <= 0;
			c <= c+1;		
		end

		//Rajouter le commentaire (1) si besoin est
		if(!reset) begin
			stateI <= state_readyI;
			stateQ <= state_readyQ;
			i <= 0;
			j <= 0;	
			c <= 0;
			IorQ <= 1'b0;
			sin_was_positiveI <= 1'b0;
			sin_was_positiveQ <= 1'b0;
			isPositiveI <= 1'b0;
			isPositiveQ <= 1'b0;
			is9 <= 1'b0;
			old_i_data <= 1'b0;
			o_ready <= 1'b0;

			o_sinI <= 4'd0;
			o_sinI_four <= 4'd0;
			o_sinQ <= 4'd0;
			o_sinQ_four <= 4'd0;
			
				//Rajouter le commentaire (2) si besoin est
		end
		
		else begin
			stateI <= next_stateI;
			stateQ <= next_stateQ;
			my_clk_10M <= clk_10M;

			/*o_ready <= next_o_ready;
			i <= next_i;
			j <= next_j;
			sin_was_positiveI <= next_sin_was_positiveI;
			sin_was_positiveQ <= next_sin_was_positiveQ;
			isPositiveI <= next_isPositiveI;
			isPositiveQ <= next_isPositiveQ;
			is9 <= next_is9;
			old_i_data <= next_old_i_data;
			IorQ <= next_IorQ; */		
		end		
		
		if(stateI == state_readyI) begin
			if(i_empty == 1'b0 && IorQ == 1'b1) begin
						if(isPositiveI && is9)  // Pour le dernier cycle du demi sinus (arche), pour eviter le decalage
							o_sinI <= array_sin[i];
						else if (is9)
							o_sinI <= array_sin_neg[i];

						sin_was_positiveI <= isPositiveI; //mémorisation du dernier arche

						is9 <= 1'b0;
						
						i <= 0;
			end
			else begin
				is9 <= 1'b0;
				o_sinI <= 4'd0;
				o_sinI_four <= 4'd0;				
			end
		end

		if(stateI == state_bit_recI) begin
			if(my_clk_10M) begin
					if(i==0) begin
						if(sin_was_positiveI == 1'b1) begin // Si le precedent arche etait > 0
							if(old_i_data == i_data) begin
								isPositiveI <= 1'b0; // alors le prochain sera negatif	
								o_sinI <= array_sin_neg[i];
								o_sinI_four <= array_sin_neg_four[0];			
							end
							else begin
								isPositiveI <= 1'b1; // sauf si changement de bit de donnee
								o_sinI <= array_sin[i];
								o_sinI_four <= array_sin_four[0];
							end					
						end
						else if(sin_was_positiveI == 1'b0) begin // pareil en oppose
							if(old_i_data != i_data) begin
								isPositiveI <= 1'b0;
								o_sinI <= array_sin_neg[i];
								o_sinI_four <= array_sin_neg_four[0];					
							end
							else begin
								isPositiveI <= 1'b1;
								o_sinI <= array_sin[i];
								o_sinI_four <= array_sin_four[0];	
							end					
						end
						o_ready <= 1'b0;		
					end
					if(i==1)
						old_i_data <= i_data; // on memorise le bit recu pour le signal Q avant qu'il ne commence a generer son arche
					if(i == 4) begin
						IorQ <= ~IorQ; // on change celui qui peut generer son arche
						// Génère le deuxième échantillon du demi sinus (pour le sinus 4 échantillons)
						if(isPositiveI)
							o_sinI_four <= array_sin_four[1]; // Si positif, on genere un point d'arche positif
						else
							o_sinI_four <= array_sin_neg_four[1]; // Sinon, on genere un point de d'arche negatif
					end
				
					if(i == 9) begin // a l'avant dernier point du sinus on passe a l'etat o_ready d'ou l'on enverra le dernier point
						is9 <= 1'b1; // On est au bout du tableau de sinus
						o_ready <= 1'b1; //pret a recuperer un bit de donnee					
					end
					if(isPositiveI && i > 0)
						o_sinI <= array_sin[i]; // Si positif, on genere un point d'arche positif
					else if (isPositiveI == 1'b0 && i>0)
						o_sinI <= array_sin_neg[i]; // Sinon, on genere un point de d'arche negatif
					if(i < 9)				
					 i<=i+1;	
			end
							
		end

		///////////////________________________________On passe au state de Q

		if(stateQ == state_readyQ) begin
			if(i_empty == 1'b0 && IorQ == 1'b0) begin
						if(isPositiveQ && is9)  // Pour le dernier cycle du demi sinus (arche), pour eviter le decalage
							o_sinQ <= array_sin[j];
						else if (is9)
							o_sinQ <= array_sin_neg[j];

						sin_was_positiveQ <= isPositiveQ; //mémorisation du dernier arche

						is9 <= 1'b0;

						j <= 0; 
			end
			else begin
				is9 <= 1'b0;	
				o_sinQ <= 4'd0;
				o_sinQ_four <= 4'd0;	
			end		
		end

		if(stateQ == state_bit_recQ) begin
			if(my_clk_10M) begin
					if(j==0) begin
						if(sin_was_positiveQ == 1'b1) begin // Si le precedent arche etait > 0
							if(old_i_data == i_data) begin
								isPositiveQ <= 1'b0; // alors le prochain sera negatif	
								o_sinQ <= array_sin_neg[j];
								o_sinQ_four <= array_sin_neg_four[0];			
							end
							else begin
								isPositiveQ <= 1'b1; // sauf si changement de bit de donnee
								o_sinQ <= array_sin[j];
								o_sinQ_four <= array_sin_four[0];
							end					
						end
						else if(sin_was_positiveQ == 1'b0) begin // pareil en oppose
							if(old_i_data != i_data) begin
								isPositiveQ <= 1'b0;
								o_sinQ <= array_sin_neg[j];
								o_sinQ_four <= array_sin_neg_four[0];					
							end
							else begin
								isPositiveQ <= 1'b1;
								o_sinQ <= array_sin[j];	
								o_sinQ_four <= array_sin_four[0];
							end					
						end	
						o_ready <= 1'b0;	
					end
					if(j==1)
						old_i_data <= i_data; // on memorise le bit recu pour le signal Q avant qu'il ne commence a generer son arche
					if(j == 4) begin
						IorQ <= ~IorQ; // on change celui qui peut generer son arche
						// Génère le deuxième échantillon du demi sinus (pour le sinus 4 échantillons)
						if(isPositiveQ)
							o_sinQ_four <= array_sin_four[1]; // Si positif, on genere un point d'arche positif
						else
							o_sinQ_four <= array_sin_neg_four[1]; // Sinon, on genere un point de d'arche negatif
					end
				
					if(j == 9) begin // a l'avant dernier point du sinus on passe a l'etat o_ready d'ou l'on enverra le dernier point
						is9 <= 1'b1; // On est au bout du tableau de sinus					
						o_ready <= 1'b1; //pret a recuperer un bit de donnee					
					end
					if(isPositiveQ && j > 0)
						o_sinQ <= array_sin[j]; // Si positif, on genere un point d'arche positif
					else if (isPositiveQ == 1'b0 && j>0)
						o_sinQ <= array_sin_neg[j]; // Sinon, on genere un point de d'arche negatif
					if(j < 9)				
					 j<=j+1;	
			end
							
		end

				
	end
	

	

	//_____________________________________________________________________________________________________________________________________________________________always pour la machine a etats

	always @(posedge clk) begin
		case(stateI)					
			state_readyI : begin
				//next_stateI = state_bit_recI;
				if(i_empty == 1'b0 && IorQ == 1'b1)
					next_stateI <= state_bit_recI; 
				else
					next_stateI <= state_readyI;	// on reste dans l'etat ou si pas a I de recevoir
								
			end
			
			state_bit_recI : begin
			      if(my_clk_10M) begin
				if(i == 9) // a l'avant dernier point du sinus on passe a l'etat o_ready d'ou l'on enverra le dernier point
					next_stateI <= state_readyI;			
			     end
			end 	
		endcase

///////////////________________________________On passe au state de Q

		case(stateQ)
			state_readyQ : begin
				//next_stateI = state_bit_recI;
				if(i_empty == 1'b0 && IorQ == 1'b0)
					next_stateQ <= state_bit_recQ; 
				else
					next_stateQ <= state_readyQ;	// on reste dans l'etat ou si pas a Q de recevoir
								
			end
			
			state_bit_recQ : begin
			      if(my_clk_10M) begin
				if(j == 9) // a l'avant dernier point du sinus on passe a l'etat o_ready d'ou l'on enverra le dernier point
					next_stateQ <= state_readyQ;				
			     end
			end 	 	
		endcase
	
	end

endmodule
