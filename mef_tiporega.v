module mef_tiporega ( input clk ,
	input reset , input REGA, input Vs, input Bs, output Asp, output Got) ;
	reg[2:0] state, nextstate ;
	// state code
	parameter A = 2'b00 ;
	parameter B = 2'b01 ;
	parameter C = 2'b10 ;
	parameter D = 2'b11 ;
	wire wire0, cond0, cond1, cond2, cond3, notREGA, notVs, notBs;
	not not0(notREGA, REGA);
	not not1(notVs, Vs);
	not not2(notBs, Bs);
	and and0(wire0, notVs, notBs);
	or or0(cond0, notREGA, wire0);
	and and1(cond1, REGA, Vs, Bs);
	and and2(cond2, REGA, notVs, Bs);
	and and3(cond3, REGA, Vs, notBs);
	// state register
	always @ ( posedge clk, posedge reset)
    	if ( reset ) state <= A ;
    	else state <= nextstate ;
    	// next state logic
	always @ (*)begin
        	if(state == A) begin
            	if (cond0) nextstate <= A ;
            	else if(cond1) nextstate <= B ;
					else if(cond2) nextstate <= C ;
					else nextstate <= D ;
        	end
        	else if(state == B) begin
            	if (cond0) nextstate <= A ;
            	else if(cond1) nextstate <= B ;
					else if(cond2) nextstate <= C ;
					else nextstate <= D ;
        	end
        	else if(state == C) begin
            	if (cond0) nextstate <= A ;
            	else if(cond1) nextstate <= B ;
					else if(cond2) nextstate <= C ;
					else nextstate <= D ;
        	end
        	else if(state == D) begin
            	if (cond0) nextstate <= A ;
            	else if(cond1) nextstate <= B ;
					else if(cond2) nextstate <= C ;
					else nextstate <= D ;
        	end
        	else nextstate <= A;
        	end
	// output logic
	assign Asp = (state == C) ;
	assign Got = (state == D) ;
    
endmodule
