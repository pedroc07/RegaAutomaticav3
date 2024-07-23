//Definição do módulo Contador modulo 2 crescente e decrescente
module cont_mod2(Y, Clk, Q1, Q0);

input Clk, Y;

output Q1, Q0;

//Fios intermediários
wire Q1n, Q0n, wire1, wire2, wire3, wire7, wire4, wire5, wire6, wire8;

and and0(wire1, Y, Q0);
and and1(wire2, Yn, Q0n);
and and5(wire8, Y, Q1);

or or0(wire3, wire1, wire2, wire8);

and and2(wire4, Y, Q1n);
and and3(wire5, Yn, Q1);
and and4(wire6, Yn, Q0);

or or1(wire7, wire4, wire5, wire6);

not Not0(Q1n, Q1);
not Not1(Yn, Y);
not Not2(Q0n, Q0);

//Flip-flops T usados para fazer o contador
//FF0
fft(wire7, Clk, Q0);
//FF1
fft(wire3, Clk, Q1);

endmodule