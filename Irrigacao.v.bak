// Declaracao do modulo
module Irrigacao (Us, L, Bs, Vs, REGA);  

	// Declaracao de portas
	input Bs, Us, Vs, L;
	output REGA;
	
	// Declaracao dos fios intermediarios
	wire Wire_us;
	
	// Funcionamento do circuito
	
	// Fios com negações das entradas
	not Us1 (Wire_us, Us);
	
	// Tratamento de quando a rega vai ligar
	and on_Off (REGA, Wire_us, L);
	
endmodule