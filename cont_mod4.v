//Definição do módulo Contador modulo 4 decrescente
module cont_mod4(Pos0, Pos3, Y, Clk, Q1, Q0);

input Clk, Y, Pos0, Pos3;

output Q1, Q0;

//Fios intermediários
wire Q2n, Q1n, Q0n, T1, wire1, wire2, wire3;

and and0(wire1, Y, Q0);
and and1(wire2, Yn, Q0n);

or or0(wire3, wire1, wire2);

not Not0(Q0n, Q0);
not Not1(Yn, Y);

//Flip-flops JK usados para fazer o contador
//FF0
fft_rst(Pos3, Pos0, 1, Clk, Q0);
//FF1
fft_rst(Pos3, Pos0, wire3, Clk, Q1);

endmodule