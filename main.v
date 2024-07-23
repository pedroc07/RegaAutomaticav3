//parar irrigacao quando tiver na limpeza

// Declaracao do modulo
module main (Clk, Rst, Us, Bs, Vs, A, G, Nv1, Nv0, Adub, Ve, Mist, Limp0, Limp1, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P, T1);  

	// Declaracao de portas
	input Clk, Rst, Bs, Us, Vs, Adub, T1;
	output A, G, Ve, Mist, Limp0, Limp1, Nv1, Nv0, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;
	
	// Declaracao dos fios intermediarios
	wire clk_rega, T0, wire1, wire2, Asp, REGA, wire_Adub, ContB1n, ContB0n, S, Y, clock_Asp, clock_Got, clock_Reduzido, clk_NULL;
	wire ContA0, ContA1, ContA2, ContA3;
	wire ContB0, ContB1;
	
	assign clk_NULL = 0;
	assign Asp = A;
	assign Limp1 = Limp0;
	not not0(wire_Adub, Adub);
	and and0(Nv1, ContB1, 1);
	and and1(Nv0, ContB0, 1);
	
	// Funcionamento do circuito
	
	//Divisor de clock
	
	DivisorClock (Clk, S, clock_Asp, clock_Got);

	
	//Circuito da chave seletora dos contadores crescente/decrescente
	not not1(ContB0n, ContB0);
	not not2(ContB1n, ContB1);
	not not3(CRn, clock_Reduzido);
	nor Nor0(wire1, ContA3, ContA2, ContA1, ContA0, ContB1, ContB0);
	//nor Nor1(wire2, ContA3, ContA2, ContA1, ContA0, ContB1n, ContB0n);
	//or Or0(T0, wire1, wire2);
	fft chave_seletora (.T(wire1),.clock(CRn),.Q(Y));
	
	//Contadores do cronometro
	
	mux_1x4_normal (clock_Reduzido, Bs, Vs, clk_NULL, clock_Got, clock_Asp, clk_NULL);
	cont_mod16(Y, clock_Reduzido, ContA3, ContA2 , ContA1, ContA0);
	cont_mod2(Y, ContA3, ContB1, ContB0);
	
	//Seletor dos displays
	Seletor_Imagem(S, Limp0, Mist, Nv1, Nv0, ContA3, ContA2, ContA1, ContA0, ContB1, ContB0, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);
	
	//Definicao do acionamento da REGA
	Irrigacao(Us, Nv0, Bs, Vs, REGA);
	
	// Maquinas de estado
	mef_tiporega ( Clk, Rst, REGA, Vs, Bs, A, G) ;
	mef_adub_limp (Clk, Rst, wire_Adub, ContB1, ContB0, Asp, Ve, Mist, Limp0);
	
endmodule
