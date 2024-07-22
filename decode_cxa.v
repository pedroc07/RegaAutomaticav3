//Modulo Decodificador do nivel da caixa

module decode_cxa(Nv1, Nv0, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);

input Nv1, Nv0; // Entradas para o decodificador
output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;

// Entradas negadas
wire notNv1, notNv0;
not Not0(notNv1, Nv1);
not Not1(notNv0, Nv0);

//SEGMENTO A

or Or1(SEG_A, notNv1, notNv0);

//SEGMENTO B

not Not3(SEG_B, 0);

//SEGMENTO C

not Not6(SEG_C, 0);

//SEGMENTO D

not Not4(SEG_D, 1);

//SEGMENTO E

or Or0(SEG_E, Nv1, Nv0);

//SEGMENTO F

not Not5(SEG_F, 0);

//SEGMENTO G

and And5(SEG_G, notNv1, Nv0);

//SEGMENTO P

not Not2(SEG_P, 0);

endmodule