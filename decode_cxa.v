//Modulo Decodificador do nivel da caixa

module decode_cxa(Nv1, Nv0, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);

input Nv1, Nv0; // Entradas para o decodificador
output SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;

// Entradas negadas
wire notNv1, notNv0;
not Not0(notNv1, Nv1);
not Not1(notNv0, Nv0);

//SEGMENTO A

and And0(SEG_A, notNv1, notNv0);

//SEGMENTO B

and And1(SEG_B, 1, 1);

//SEGMENTO C

and And2(SEG_C, C2n, C1, C0n);

//SEGMENTO D

and And3(SEG_D, 0, 0);

//SEGMENTO E

or Or0(SEG_E, Nv1, Nv0);

//SEGMENTO F

and And4(SEG_F, 1, 1);

//SEGMENTO G

and And5(SEG_G, notNv0, Nv1);

//SEGMENTO P

not (SEG_P, 0);

endmodule