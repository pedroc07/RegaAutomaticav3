module mef_adub_limp ( input clk ,
	input reset, input Adub, input Nv1, input Nv0, input Asp, output Ve, output Mist, output Limp) ;
	reg[2:0] state, nextstate ;
	// state code
	parameter A = 2'b00 ;
	parameter B = 2'b01 ;
	parameter C = 2'b10 ;
	parameter D = 2'b11 ;
	wire wire0, wire1, wire2, wire3, wire4, wire5, wire6, cond0, cond1, cond2, cond3, cond4, notcond4, cond5, cond6, notA, notAdub, notNv1, notNv0;
	
	//entradas negadas	
	
	not not0(notA, Asp);
	not not1(notAdub, Adub);
	not not2(notNv1, Nv1);
	not not3(notNv0, Nv0);
	
	//condicoes estado A
	
	and and0(cond0, notNv1, notNv0, notA);
	
	//condicoes estado B
	
	and and1(cond1, notNv1, notNv0, Asp);
	and and2(wire0, notAdub, Nv0, Asp);
	and and3(wire1, notAdub, Nv1, Asp);
	and and4(wire2, notAdub, Nv2, Asp);	
	or or0(cond2, wire0, wire1, wire2);

	//condicoes estado C
	
	//condicoes estado D
	
	and and6(cond4, Nv1, Nv0);
	
	//condicoes saidas
	
	//Ve
	
	//Mist
	
	or or1(cond5, Nv1, Nv2);

	//Limp
	
	not not5(cond6, cond5);
	
	// state register
	always @ ( posedge clk, posedge reset)
    	if ( reset ) state <= A ;
    	else state <= nextstate ;
    	// next state logic
	always @ (*)begin
        	if(state == A) begin
            	if (Asp) nextstate <= B ;
            	else if(cond0) nextstate <= D ;
					else nextstate <= A ;
        	end
        	else if(state == B) begin
            	if (notA) nextstate <= A ;
            	else if(cond1) nextstate <= D ;
					else if(cond2) nextstate <= B ;
					else nextstate <= C ;
        	end
        	else if(state == C) begin
            	if (1) nextstate <= C ;
        	end
        	else if(state == D) begin
            	if (cond4) nextstate <= A ;
					else nextstate <= D ;
        	end
        	else nextstate <= A;
        	end
	// output logic
	assign Ve = (state == D) ;
	assign Mist = (Nv1 & (state == C));
	assign Limp = (notNv1 & (state == C)) ;
    
endmodule
