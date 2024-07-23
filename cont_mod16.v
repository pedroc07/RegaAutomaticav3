//Definição do módulo Contador de Dezena de modulo 16 Decrescente

module cont_mod16(Pos9, Y, Clk, Q3, Q2, Q1, Q0);

input Clk, Y, Pos9;

output Q3, Q2, Q1, Q0;


//Fios intermediários
wire Wire1, Wire2, Wire3, Wire4, Wire5, Wire6, Wire7, Wire8, Wire9, T1, T2, T3;
wire Q3n, Q2n, Q1n, Q0n;

not Not4(Q3n, Q3);
not Not0(Q2n, Q2);
not Not1(Q1n, Q1);
not Not2(Q0n, Q0);
not Not3(Yn, Y);

and And1(Wire0, Y, Q3n, Q0);
and And2(Wire1, Yn, Q0n, Q1);
and And3(Wire2, Yn, Q0n, Q2);
and And4(Wire3, Yn, Q0n, Q3);

and And5(Wire4, Y, Q0, Q1);
and And6(Wire5, Yn, Q0n, Q3 );
and And7(Wire6, Yn, Q0n, Q1n, Q2 );

and And8(Wire7, Y, Q0, Q1, Q2);
and And9(Wire8, Y, Q0, Q3);
and And10(Wire9, Yn, Q0n, Q1n, Q2n);



or Or0(T1, Wire0, Wire1, Wire2, Wire3);
or Or1(T2, Wire4, Wire5, Wire6);
or Or2(T3, Wire7, Wire8, Wire9);


//Flip-flops JK usados para fazer o contador
fft_rst(Pos9, 0, 1, Clk, Q0);
fft_rst(0, Pos9, T1, Clk, Q1);
fft_rst(0, Pos9, T2, Clk, Q2);
fft_rst(Pos9, 0, T3, Clk, Q3);

endmodule