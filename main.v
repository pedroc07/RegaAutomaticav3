// Declaracao do modulo
module main (Clk, Rst, Us, Nv1, Nv0, Bs, Vs, A, G, Adub, Ve, Mist, Limp0, Limp1);  

	// Declaracao de portas
	input Clk, Rst, Bs, Us, Vs, Nv1, Nv0, Adub;
	output A, G, Ve, Mist, Limp0, Limp1;
	
	// Declaracao dos fios intermediarios
	wire Asp, REGA, wire_Adub;
	assign Asp = A;
	assign Limp1 = Limp0;
	not not0(wire_Adub, Adub);
	
	// Funcionamento do circuito
	
	Irrigacao(Us, Nv0, Bs, Vs, REGA);
	mef_tiporega ( Clk, Rst, REGA, Vs, Bs, A, G) ;
	mef_adub_limp (Clk, Rst, wire_Adub, Nv1, Nv0, Asp, Ve, Mist, Limp0);
	
endmodule
