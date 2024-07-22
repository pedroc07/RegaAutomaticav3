//Modulo Decodificador do simbolo de adubacao/limpeza

module decode_simb(Limp, M, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);

input Limp, M; // Entradas para o decodificador
output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;

// Entradas negadas
wire notL, notM, wire1, wire2, wire3, wire4;
not Not0(notM, M);
not Not1(notL, Limp);

//SEGMENTO A

or Or0(wire1, notM, Limp);
and And0(SEG_A, wire1, wire1);

//SEGMENTO B

and And1(SEG_B, wire1, wire1);

//SEGMENTO C

and And2(SEG_C, wire1, wire1);

//SEGMENTO D

or Or1(SEG_D, M, notL);

//SEGMENTO E

and And3(wire2, notL, notM);
and And4(wire3, notL, notM);
or Or2(wire4, wire2, wire3);
and And5(SEG_E, wire4, wire4);

//SEGMENTO F

and And6(SEG_F, wire4, wire4);

//SEGMENTO G

and And7(SEG_G, wire1, wire1);

//SEGMENTO P

not Not2(SEG_P, 0);

endmodule