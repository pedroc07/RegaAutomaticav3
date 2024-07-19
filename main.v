// Declaracao do modulo
module main (Clk, Rst, Us, Bs, Vs, A, G, Nv1, Nv0, Adub, Ve, Mist, Limp0, Limp1, Sel, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);  

	// Declaracao de portas
	input Clk, Rst, Bs, Us, Vs, Adub, Sel;
	output A, G, Ve, Mist, Limp0, Limp1, Nv1, Nv0, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;
	
	// Declaracao dos fios intermediarios
	wire Asp, REGA, wire_Adub, clock_Reduzido, ContA0n, ContB0n;
	wire ContA0, ContA1, ContA2, ContA3;
	wire ContB0, ContB1;
	
	assign Asp = A;
	assign Limp1 = Limp0;
	not not0(wire_Adub, Adub);
	and and0(Nv1, ContB1, 1);
	and and1(Nv0, ContB0, 1);
	//not(ContA0n, ContA0);
	//not(ContB0n, ContB0);
	//and(chave_seletora, ContA0n, ContB0n);
	
	// Funcionamento do circuito
	
	//Divisor de clock
	
	DivisorClock (Clk, clock_Reduzido);
	
	//Contadores do cronometro
	
	cont_mod16(Sel, clock_Reduzido, ContA3, ContA2, ContA1, ContA0);
	cont_mod4(Sel, ContA3, ContB1, ContB0);
	decode(ContA3, ContA2, ContA1, ContA0, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);
	
	//Definicao do acionamento da REGA
	Irrigacao(Us, Nv0, Bs, Vs, REGA);
	
	// Maquinas de estado
	mef_tiporega ( Clk, Rst, REGA, Vs, Bs, A, G) ;
	mef_adub_limp (Clk, Rst, wire_Adub, ContB1, ContB0, Asp, Ve, Mist, Limp0);
	
endmodule
