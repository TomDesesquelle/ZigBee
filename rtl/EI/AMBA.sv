//////////////////////////////////////////////////////////////////////////////////
//School: PHELMA
// Engineer: Tom Désesquelle / Axel Baldacchino
//
// Create Date: 17.03.2022 10:25:04
// Design Name: APB AMBA model
// Module Name: AMBA
// Project Name: zigbee_project
// Tool Versions: VIVADO 2018.3
// Description: APB AMBA CPU model which will be connected to the Zigbee Tx/Rx interfaces
//
//
// Revision:
// Revision 0.01 - First Commit
// Revision 0.02 - First Try 
//////////////////////////////////////////////////////////////////////////////////

 

module AMBA #(
    parameter DATA_WIDTH =  8,
    parameter ADDR_WIDTH =  2 

)(
    input                   PCLK    ,
    input                   PRESET ,    
    input                   PENABLE ,    
    input                   PnR_W   ,    
    input  [DATA_WIDTH-1:0] PWDATA  ,
    input  [ADDR_WIDTH-1:0] PADDR   , 
    output                  PREADY  ,    
    output [DATA_WIDTH-1:0] PRDATA  
) ;

reg sig_fsm_start;
reg [DATA_WIDTH-1:0] internal_CPU_mem [3:0];
reg [DATA_WIDTH-1:0] sigReadData;

initial begin 
    internal_CPU_mem[0] = 'h01;
    internal_CPU_mem[1] = 'h02; 
    internal_CPU_mem[2] = 'hFE;
    internal_CPU_mem[3] = 'hFF;
end


typedef enum {S0, S1, S2, S3, S4} State ;
State currentState = S0 ;
State nextState    = S0 ;
 

OS os(
            .i_CLK      (PCLK )         ,
            .i_RST      (PRESET )       ,
            .i_EN       (1'b1)          ,
            .i_DATA     (PENABLE)       ,
            .o_QOUT_LE  (sig_fsm_start) ,
            .o_QOUT_TE  ()
            ) ;



always @(posedge PCLK) begin : FSM0
    if(PRESET == 1'b0) begin
        currentState <= S0;
    end
    else begin
        currentState <= nextState;
    end
end

 

always @(currentState, sig_fsm_start, PnR_W) begin : FSM1

    case(currentState)

        S0 : begin
            if(sig_fsm_start == 1'b1) begin
                nextState <= S1;
            end
            else begin
                nextState <= S0;
            end
        end


        S1 : begin
            if(PnR_W == 1'b0) begin
		nextState <= S2;
	    end
	    else begin 
		if(PnR_W == 1'b1) begin
			nextState <= S3;
	   	end
	    end
        end


       	S2 : begin
		nextState <= S4;
        end


       	S3 : begin
		nextState <= S4;
        end


       	S4 : begin
		nextState <= S0;
        end


        default : begin
            nextState <= S0 ;
        end

    endcase
end

always @(currentState, PADDR) begin : PRDATA_assign
	if(PRESET == 1'b0) begin 
		sigReadData <= '1;	
	end
	else begin 
		if(currentState == S2) begin
			sigReadData <= internal_CPU_mem[PADDR];
		end
		else begin
			sigReadData <= sigReadData;
		end 
	end
end

always @(currentState, PRESET, PADDR) begin : PWDATA_assign
	if(PRESET == 1'b0) begin 
	        internal_CPU_mem[0] = 'h01;
    		internal_CPU_mem[1] = 'h02; 
    		internal_CPU_mem[2] = 'hFE;
    		internal_CPU_mem[3] = 'hFF;	
	end	
	else begin 
		if(currentState == S3) begin
			internal_CPU_mem[PADDR] <= PWDATA ;
		end
		else begin
			internal_CPU_mem[PADDR] <= internal_CPU_mem[PADDR];
		end 
	end
end


assign PREADY = (currentState == S4) ? 1'b1 : 1'b0 ;
assign PRDATA = sigReadData;


endmodule

