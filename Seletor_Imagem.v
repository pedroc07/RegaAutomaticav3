module Seletor_Imagem(S, ContA3, ContA2, ContA1, ContA0, ContB1, ContB0, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);	
	
	input S, ContA3, ContA2, ContA1, ContA0, ContB1, ContB0;
	output SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;

	wire [1:0] Sel;	

	wire Sel0n, Sel1n, Wire0, Wire1, Wire2, Wire3, Wire4, Wire5, Wire6, Wire7, 
	Wire8, Wire9, Wire10, Wire11, Wire12, Wire13, Wire14, Wire15, Wire16, Wire17, 
	Wire18, Wire19, Wire20, Wire21, Wire22, Wire23, Wire24, Wire25, Wire26, Wire27;
	
	wire SEG_A0, SEG_B0, SEG_C0, SEG_D0, SEG_E0, SEG_F0, SEG_G0, SEG_P0,
		  SEG_A1, SEG_B1, SEG_C1, SEG_DUm, SEG_E1, SEG_F1, SEG_G1, SEG_P1;
	
	//Seleciona os segmentos
	demux_1x4(0, Sel, SEG_D1, SEG_D2, SEG_D3, SEG_D4);
	
	// Bits seletores de imagem
	cont_mod4(0, S, Sel[1], Sel[0]);
	
	// Seleciona os contadores de acordo com os bits
	not Not0(Sel0n, Sel[0]);
	not Not1(Sel1n, Sel[1]);
	
	decode(ContA3, ContA2, ContA1, ContA0, SEG_A0, SEG_B0, SEG_C0, SEG_D0, SEG_E0, SEG_F0, SEG_G0, SEG_P0);
	decode(0, 0, ContB1, ContB0, SEG_A1, SEG_B1, SEG_C1, SEG_DUm, SEG_E1, SEG_F1, SEG_G1, SEG_P1);
	
	// SEGMENTO A
	
	or Or14(Wire0, 1, Sel[1], Sel[0]);		//00
	or Or15(Wire1, 1, Sel[1], Sel0n);		//01
	or Or0(Wire2, SEG_A1, Sel1n, Sel[0]);  		//10
	or Or1(Wire3, SEG_A0, Sel1n, Sel0n);         	//11
	and And0(SEG_A, Wire0, Wire1, Wire2, Wire3);


	// SEGMENTO B
	//not Not4(Wire4, 1, Sel[1], Sel[0]);		//00
	//not Not5(Wire5, 1, Sel[1], Sel0n);		//01
	or Or2(Wire6, SEG_B1, Sel1n, Sel[0]);  		//10
	or Or3(Wire7, SEG_B0, Sel1n, Sel0n);         	//11
	and And1(SEG_B, Wire0, Wire1, Wire6, Wire7);

	// SEGMENTO C	
	//not Not6(Wire8, 1, Sel[1], Sel[0]);		//00
	//not Not7(Wire9, 1, Sel[1], Sel0n);		//01
	or Or4(Wire10, SEG_C1, Sel1n, Sel[0]);  		//10
	or Or5(Wire11, SEG_C0, Sel1n, Sel0n);         	//11
	and And2(SEG_C, Wire0, Wire1, Wire10, Wire11);
	
	// SEGMENTO D
	//not Not8(Wire12, 1, Sel[1], Sel[0]);		//00
	//not Not9(Wire13, 1, Sel[1], Sel0n);		//01
	or Or6(Wire14, SEG_DUm, Sel1n, Sel[0]);  		//10
	or Or7(Wire15, SEG_D0, Sel1n, Sel0n);         	//11
	and And3(SEG_D, Wire0, Wire1, Wire14, Wire15);

	// SEGMENTO E
	//not Not10(Wire16, 1, Sel[1], Sel[0]);		//00
	//not Not11(Wire17, 1, Sel[1], Sel0n);		//01
	or Or8(Wire18, SEG_E1, Sel1n, Sel[0]);  		//10
	or Or9(Wire19, SEG_E0, Sel1n, Sel0n);         	//11
	and And4(SEG_E, Wire0, Wire1, Wire18, Wire19);
	
	// SEGMENTO F
	//not Not12(Wire20, 1, Sel[1], Sel[0]);		//00
	//not Not13(Wire21, 1, Sel[1], Sel0n);		//01
	or Or10(Wire22, SEG_F1, Sel1n, Sel[0]);  		//10
	or Or11(Wire23, SEG_F0, Sel1n, Sel0n);         	//11
	and And5(SEG_F, Wire0, Wire1, Wire22, Wire23);
	
	// SEGMENTO G
	//not Not14(Wire24, 1, Sel[1], Sel[0]);		//00
	//not Not15(Wire25, 1, Sel[1], Sel0n);		//01
	or Or12(Wire26, SEG_G1, Sel1n, Sel[0]);  		//10
	or Or13(Wire27, SEG_G0, Sel1n, Sel0n);         	//11
	and An6(SEG_G, Wire0, Wire1, Wire26, Wire27);

	not(SEG_P, 0);
	
endmodule