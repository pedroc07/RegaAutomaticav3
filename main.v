// Declaracao do modulo
module main (Clk, Rst, Us, Nv1, Nv0, Bs, Vs, A, G);  

	// Declaracao de portas
	input Clk, Rst, Bs, Us, Vs, Nv1, Nv0;
	output A, G;
	
	// Declaracao dos fios intermediarios
	wire Wire_us, REGA;
	
	// Funcionamento do circuito
	
	Irrigacao(Us, Nv0, Bs, Vs, REGA);
	mef_tiporega ( Clk, Rst, REGA, Vs, Bs, A, G) ;
	
endmodule