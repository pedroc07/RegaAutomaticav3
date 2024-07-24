// Declaracao do modulo do multiplexador de 2 saidas e 1 entrada logica NORMAL.
module mux_1x2_normal (out, Y, A0, A1);

	 // Declaracao de portas
    input Y;      // Chave seletora
    input A0, A1;
	 output out;  // saída

    // Declaração de fios para os complementos do seletor
    wire wire1, wire2, wire3, wire0, notS0, notS1;

    // Inversores para os bits do seletor
    not (notY, Y);
	 
	 // Decodificador para cada saída do demux 1x7 usando portas "OR" para saida de valor logico BAIXO
    and (wire0, A0, notY);      
    and (wire1, A1, Y);      
	 
	 or(out, wire0, wire1);

endmodule 