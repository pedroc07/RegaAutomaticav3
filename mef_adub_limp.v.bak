module mef_adub_limp ( input clk ,
	input reset, input Adub, input Nv1, input Nv0, input Asp, output Ve, output Mist, output Limp) ;
	reg[2:0] state, nextstate ;
	// state code
	parameter A = 2'b00 ;
	parameter B = 2'b01 ;
	parameter C = 2'b10 ;
	parameter D = 2'b11 ;
	wire wire0, wire1, wire2, wire3, wire4, wire5, cond0, cond1, cond2, cond3, cond4, cond5, notA, notAdub, notNv1, notNv0;
	not not0(notA, Asp);
	not not1(notAdub, Adub);
	not not2(notNv1, Nv1);
	not not3(notNv0, Nv0);
	and and0(wire0, notAdub, Nv0, Asp);
	and and1(wire1, notAdub, Nv1, Asp);
	and and2(wire2, Adub, Nv0, Asp);
	and and3(wire3, Adub, Nv1, Asp);
	or or0(cond0, wire0, wire1);
	or or1(cond1, wire2, wire3);
	and and4(cond2, Nv1, Nv0);
	and and5(wire4, Nv1, notA);
	and and6(wire5, Nv0, notA);
	or or2(cond3, wire4, wire5);
	or or3(cond4, notNv1, notNv0);
	and and7(cond5, notNv0, notNv1, notA);
	// state register
	always @ ( posedge clk, posedge reset)
    	if ( reset ) state <= A ;
    	else state <= nextstate ;
    	// next state logic
	always @ (*)begin
        	if(state == A) begin
            	if (cond3) nextstate <= A ;
            	else if(cond5) nextstate <= D ;
					else nextstate <= B ;
        	end
        	else if(state == B) begin
            	if (notA) nextstate <= A ;
            	else if(cond0) nextstate <= B ;
					else if(cond1) nextstate <= C ;
					else nextstate <= D ;
        	end
        	else if(state == C) begin
            	if (1) nextstate <= C;
        	end
        	else if(state == D) begin
            	if (cond2) nextstate <= A ;
					else nextstate <= D ;
        	end
        	else nextstate <= A;
        	end
	// output logic
	assign Ve = (cond4 & (state == D)) ;
	assign Mist = (Nv1 & (state == C));
	assign Limp = (notNv1 & (state == C)) ;
    
endmodule
