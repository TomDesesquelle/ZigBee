//////////////////////////////////////////////////////////////////////////////////
//School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 24.03.2022 14:11:44
// Design Name: FIFO model
// Module Name: FIFO
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: FIFO for Zigbee Tx/Rx interfaces
//
//
// Revision:
// Revision 0.01 - First Commit
//////////////////////////////////////////////////////////////////////////////////

 

module inFIFO #(
    parameter      DATA_SIZE_BIT  =    2, 
    parameter          DATA_WIDTH =    2**DATA_SIZE_BIT,  //  = 2**DATA_SIZE_BIT = 2**3 = 8  
    
    parameter      FIFO_SIZE_BIT  =   7, 	             
    parameter          FIFO_WIDTH =   2**FIFO_SIZE_BIT,

    parameter ALMOST_EMPTY_OFFSET =    (FIFO_WIDTH)/4,
    parameter  ALMOST_FULL_OFFSET =  3*(FIFO_WIDTH)/4
)(
    input                   inClock        ,   	//                 (50 MHz)
    input                   inReset        ,    
    input                   inReadEnable   ,   	// Handcheck --> Antho & Bruno
    input                   inWriteEnable  ,   	// PREADY from CPU
    input  [DATA_WIDTH-1:0] inData         ,    // AMBA
    
    output [FIFO_SIZE_BIT:0] outWriteCount,   
    output [FIFO_SIZE_BIT-1:0] outReadCount   ,
    output                  outReadError   ,
    output                  outWriteError  ,
    output                  outFull        ,
    output                  outEmpty       ,
    output                  outAlmostEmpty ,
    output                  outAlmostFull  ,
    output                  outDone        ,  	// Handcheck back --> to Antho & Bruno
    output 		    outData
    ) ;

reg [FIFO_WIDTH-1:0] [DATA_WIDTH-1:0] FIFO ;
reg sig_fsm_start_R	  		  ;    
reg sig_fsm_start_W			  ;

reg [FIFO_SIZE_BIT-1:0]   sigRDCOUNT 	  ;
reg [FIFO_SIZE_BIT:0] sigWRCOUNT 	  ; 

reg [FIFO_SIZE_BIT:0] sigCurrentFilling  ; 

reg sigFULL 				  ;

reg [FIFO_SIZE_BIT - 1 : 0]   i_FIFO         ;    // READ
reg [FIFO_SIZE_BIT - 1 : 0]   j_FIFO         ;    // WRITE
reg [DATA_SIZE_BIT - 1 : 0]   k_FIFO         ;    // READ (bit)
    
reg                    sigEnableCounter   ;       
reg 		       sigOutData 	  ; 
localparam [FIFO_WIDTH-1:0] [DATA_WIDTH-1:0] FIFO_reset  = '0;

reg sigWError ;
reg sigRError ;


typedef enum bit [3:0] {IDLE, SWrRdCheck, SWrCheck, SRdCheck, SREADnWRITE, SWRITE, SREAD, SWAIT, SDONE, SWERROR, SRERROR} State ;
State currentState ;
State nextState    ;




/////////////////////////////////////////////////////
//  OS for inReadEnable leading edge
/////////////////////////////////////////////////////
OS os1(
            .i_CLK      (inClock)         ,
            .i_RST      (inReset)         ,
            .i_DATA     (inReadEnable)    ,
            .o_QOUT_LE  (sig_fsm_start_R) 
            ) ;
/////////////////////////////////////////////////////


/////////////////////////////////////////////////////
// OS for inWriteEnable leading edge
/////////////////////////////////////////////////////
OS os2(
            .i_CLK      (inClock)         ,
            .i_RST      (inReset)         ,
            .i_DATA     (inWriteEnable)   ,
            .o_QOUT_LE  (sig_fsm_start_W) 
            ) ;
/////////////////////////////////////////////////////


/////////////////////////////////////////////////////
// FSM 
/////////////////////////////////////////////////////
always @(posedge inClock) begin : ClknRst
    if(inReset == 1'b0) begin
        currentState <= IDLE;
    end
    else begin
        currentState <= nextState;
    end
end
/////////////////////////////////////////////////////
 

/////////////////////////////////////////////////////
// FSM
/////////////////////////////////////////////////////
always_comb begin : FSM 
    case(currentState)
        IDLE : begin
            	if(sig_fsm_start_R == 1'b1 && sig_fsm_start_W == 1'b1) begin
                	nextState = SWrRdCheck; // --> FIFO transparente
            	end
		    else begin 
			if(sig_fsm_start_R == 1'b1) begin
		        	nextState = SRdCheck;
		    	end
			    else begin
				if(sig_fsm_start_W == 1'b1) begin
					nextState = SWrCheck;
			    	end
				else begin
					nextState = IDLE;
				end
			    end
		    end
               end







        SWrRdCheck : begin         // Read & Write Check --> FIFO transparente
		if(sigFULL == 1'b1) begin
			nextState = SWERROR ;
		end
		else begin 
			nextState = SREADnWRITE ;
		end
        end






       	SWrCheck : begin        // Write Check
		if(sigFULL == 1'b1) begin
			nextState = SWERROR ;
		end
		else begin 
			nextState = SWRITE ;
		end
        end






       	SRdCheck : begin       // Read Check
			if(sigRDCOUNT >= sigWRCOUNT) begin 
				nextState = SRERROR ;
			end
			else begin 
				//counter increments
				//OVF check
				nextState = SREAD;
			end
        end




	SREADnWRITE : begin 
			//priority on write state
			nextState = SREAD ;
        end





	SWRITE : begin //Write
		 	nextState = SDONE ;	
	end





	SREAD : begin  	// READ
			nextState = SWAIT ;
	end



	SWAIT : begin  	// READ
			nextState = SDONE ;
	end



       	SDONE : begin
		nextState = IDLE ;
        end
	


	SRERROR : begin
		nextState = IDLE ;
	end


	SWERROR : begin
		nextState = IDLE ;
	end


        default : begin
            nextState = IDLE ;
        end

    endcase
end
/////////////////////////////////////////////////////


///////////////////////////////////////////////////// 
// Counters
/////////////////////////////////////////////////////
always @(posedge inClock) begin
	if(inReset == 1'b0) begin
		sigRDCOUNT <= 0   ;
		i_FIFO     <= 0   ;
		sigWRCOUNT <= 'b0 ;
	end
	else begin
		if(sigEnableCounter == 1'b1) begin 
			sigRDCOUNT <= sigRDCOUNT + 1;
			i_FIFO     <=  i_FIFO    + 1 ;
		end
		else begin 
			if(sigWRCOUNT == FIFO_WIDTH) begin //overflow
				sigWRCOUNT <= sigWRCOUNT - sigRDCOUNT;
				sigRDCOUNT <= 0;
				i_FIFO     <= i_FIFO     ;
			end
			else begin
				if(currentState == SWRITE || currentState == SREADnWRITE) begin 
					sigWRCOUNT <= sigWRCOUNT + 1 ;
					i_FIFO     <= i_FIFO     ;
				end
				else begin
					sigRDCOUNT <= sigRDCOUNT;
					i_FIFO     <= i_FIFO     ;
					sigWRCOUNT <= sigWRCOUNT ;
				end
			end
		end
	end
end	
/////////////////////////////////////////////////////



///////////////////////////////////////////////////// 
// k_FIFO
/////////////////////////////////////////////////////
always_ff @(posedge inClock) begin : kFIFO
	if(inReset == 1'b0) begin
		k_FIFO <= 0;
	end
	else begin
		if(currentState == SREAD) begin
				if(k_FIFO < DATA_WIDTH - 1) begin
					k_FIFO <= k_FIFO + 1 ;
				end
				else begin
					k_FIFO  <=    0 ;
				end
		end
		else begin
			k_FIFO  <= k_FIFO  ;
		end
	end	
end
/////////////////////////////////////////////////////





///////////////////////////////////////////////////// 
// sigEnable
/////////////////////////////////////////////////////
always @(posedge inClock) begin : sigENABLE // k_FIFO
	if(inReset == 1'b0) begin
		sigEnableCounter <= 1'b0;
	end
	else begin
		if(currentState == SREAD && k_FIFO == DATA_WIDTH - 1) begin 
			sigEnableCounter <= 1'b1;
		end
		else begin
			sigEnableCounter <= 1'b0;
		end
	end	
end	
/////////////////////////////////////////////////////


/////////////////////////////////////////////////////
// outData assignement
/////////////////////////////////////////////////////
always_ff @(posedge inClock) begin : outputData
	if(inReset == 1'b0) begin
		sigOutData <= 1'b0 ;
	end
	else begin
		if(currentState == SREAD) begin 
			sigOutData <= FIFO[i_FIFO][k_FIFO] ;
		end
		else begin
			sigOutData <= sigOutData ;
		end
	end	
end
/////////////////////////////////////////////////////


///////////////////////////////////////////////////// 
// j_FIFO
/////////////////////////////////////////////////////
always @(posedge inClock) begin : jFIFO
	if(inReset == 1'b0) begin
		j_FIFO     <= 0   ;
	end
	else begin
		if(currentState == SWRITE || currentState == SREADnWRITE) begin
			if(sigWRCOUNT == FIFO_WIDTH) begin //overflow
				j_FIFO     <= 0;
			end
			else begin
				j_FIFO    <=  j_FIFO     + 1 ;
			end
		end
		else begin
			j_FIFO     <= j_FIFO     ;
		end
	end		
end
/////////////////////////////////////////////////////


/////////////////////////////////////////////////////
// inData Shift into FIFO
/////////////////////////////////////////////////////
always @(posedge inClock) begin : SR
	if(inReset == 1'b0) begin
		FIFO <= FIFO_reset ;
	end
	else begin
		if(currentState == SWRITE || currentState == SREADnWRITE) begin 
			FIFO[j_FIFO] <= inData ;
		end
		else begin
			FIFO <= FIFO ;
		end
	end	
end
/////////////////////////////////////////////////////


/////////////////////////////////////////////////////
// FIFO Current Filling 
/////////////////////////////////////////////////////
always @* begin
	sigCurrentFilling <= sigWRCOUNT - sigRDCOUNT;	
	sigFULL <= (sigCurrentFilling == FIFO_WIDTH) ? 1'b1 : 1'b0;
	
end 
/////////////////////////////////////////////////////


/////////////////////////////////////////////////////
// ERRORS
/////////////////////////////////////////////////////
always @(posedge inClock) begin : ERRORS
	if(inReset == 1'b0) begin
		sigRError <= 1'b0;
		sigWError <= 1'b0;
	end
	else begin
		if(currentState == SWERROR) begin 
			sigWError <= 1'b1;
			sigRError <= sigRError;
		end
		else begin
			if(currentState == SRERROR) begin 
				sigRError <= 1'b1;
				sigWError <= sigWError;
			end
			else begin 
				if(currentState == SWRITE || currentState == SREAD || currentState == SREADnWRITE) begin 
					sigWError <= 1'b0;
					sigRError <= 1'b0;
				end
				else begin
					sigWError <= sigWError;
					sigRError <= sigRError;
				end
			end
		end	
	end
end
/////////////////////////////////////////////////////



/////////////////////////////////////////////////////
// Assignements
/////////////////////////////////////////////////////
assign outWriteCount 	= sigWRCOUNT 	;
assign outReadCount 	= sigRDCOUNT	;

assign outFull 		= sigFULL 	;
assign outAlmostFull    = (sigCurrentFilling >= ALMOST_FULL_OFFSET)  ?  1'b1 : 1'b0;
assign outAlmostEmpty   = (sigCurrentFilling <= ALMOST_EMPTY_OFFSET) ?  1'b1 : 1'b0;
assign outEmpty         = (sigWRCOUNT == sigRDCOUNT) ? 1'b1 : 1'b0;

assign outReadError     = sigRError;
assign outWriteError    = sigWError;

assign outDone          = (currentState == SDONE) ? 1'b1 : 1'b0;

assign outData          = sigOutData ;
/////////////////////////////////////////////////////


endmodule
