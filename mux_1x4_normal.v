// Declaracao do modulo do multiplexador de 4 saidas e 1 entrada com seletor de 2 bits logica NORMAL.
module mux_1x4_normal (out, S1, S0, A0, A1, A2, A3);

	 // Declaracao de portas
    input S1, S0;      // Chaves seletoras
    input A0, A1, A2, A3;
	 output out;  // saída

    // Declaração de fios para os complementos do seletor
    wire wire1, wire2, wire3, wire0, notS0, notS1;

    // Inversores para os bits do seletor
    not (notS0, S0);
    not (notS1, S1);
	 
	 // Decodificador para cada saída do demux 1x7 usando portas "OR" para saida de valor logico BAIXO
    and (wire0, A0, notS1, notS0);       // S == 00
    and (wire1, A1, notS1, S0);      // S == 01
    and (wire2, A2, S1, notS0);     // S == 10
    and (wire3, A3, S1, S0);    // S == 11
	 
	 or(out, wire0, wire1, wire2, wire3);

endmodule 