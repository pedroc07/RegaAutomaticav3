module Seletor_Imagem(S, Limp, Mist, Nv1, Nv0, ContA3, ContA2, ContA1, ContA0, ContB1, ContB0, SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P);	
	
	input S, Limp, Mist, Nv1, Nv0, ContA3, ContA2, ContA1, ContA0, ContB1, ContB0;
	output SEG_D1, SEG_D2, SEG_D3, SEG_D4, SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P;

	wire [1:0] Sel;	

	wire Sel0n, Sel1n, Wire0, Wire1, Wire2, Wire3, Wire4, Wire5, Wire6, Wire7, 
	Wire8, Wire9, Wire10, Wire11, Wire12, Wire13, Wire14, Wire15, Wire16, Wire17, 
	Wire18, Wire19, Wire20, Wire21, Wire22, Wire23, Wire24, Wire25, Wire26, Wire27,
	Wire28, Wire29;
	
	wire SEG_A0, SEG_B0, SEG_C0, SEG_D0, SEG_E0, SEG_F0, SEG_G0, SEG_P0,
		  SEG_A1, SEG_B1, SEG_C1, SEG_DUm, SEG_E1, SEG_F1, SEG_G1, SEG_P1,
		  SEG_A2, SEG_B2, SEG_C2, SEG_DDois, SEG_E2, SEG_F2, SEG_G2, SEG_P2,
		  SEG_A3, SEG_B3, SEG_C3, SEG_DTres, SEG_E3, SEG_F3, SEG_G3, SEG_P3;
	
	//Seleciona os segmentos
	demux_1x4(0, Sel[1], Sel[0], SEG_D1, SEG_D2, SEG_D3, SEG_D4);
	
	// Bits seletores de imagem
	cont_mod4(0, S, Sel[1], Sel[0]);
	
	// Seleciona os contadores de acordo com os bits
	not Not0(Sel0n, Sel[0]);
	not Not1(Sel1n, Sel[1]);
	
	// Decodificadores para o display
	decode(ContA3, ContA2, ContA1, ContA0, SEG_A0, SEG_B0, SEG_C0, SEG_D0, SEG_E0, SEG_F0, SEG_G0, SEG_P0);
	decode(0, 0, ContB1, ContB0, SEG_A1, SEG_B1, SEG_C1, SEG_DUm, SEG_E1, SEG_F1, SEG_G1, SEG_P1);
	decode_cxa(Nv1, Nv0, SEG_A2, SEG_B2, SEG_C2, SEG_DDois, SEG_E2, SEG_F2, SEG_G2, SEG_P2);
	decode_simb(Limp, Mist, SEG_A3, SEG_B3, SEG_C3, SEG_DTres, SEG_E3, SEG_F3, SEG_G3, SEG_P3);
	
	// Demux que varre as linhas conforme o seletor
	
	// SEGMENTO A
	
	or Or14(Wire0, SEG_A2, Sel[1], Sel[0]);		//00
	or Or15(Wire1, SEG_A3, Sel[1], Sel0n);		//01
	or Or0(Wire2, SEG_A1, Sel1n, Sel[0]);  		//10
	or Or1(Wire3, SEG_A0, Sel1n, Sel0n);         	//11
	and And0(SEG_A, Wire0, Wire1, Wire2, Wire3);


	// SEGMENTO B
	or Or16(Wire4, SEG_B2, Sel[1], Sel[0]);		//00
	or Or17(Wire5, SEG_B3, Sel[1], Sel0n);		//01
	or Or2(Wire6, SEG_B1, Sel1n, Sel[0]);  		//10
	or Or3(Wire7, SEG_B0, Sel1n, Sel0n);         	//11
	and And1(SEG_B, Wire4, Wire5, Wire6, Wire7);

	// SEGMENTO C	
	or Or18(Wire12, SEG_C2, Sel[1], Sel[0]);		//00
	or Or19(Wire13, SEG_C3, Sel[1], Sel0n);		//01
	or Or4(Wire10, SEG_C1, Sel1n, Sel[0]);  		//10
	or Or5(Wire11, SEG_C0, Sel1n, Sel0n);         	//11
	and And2(SEG_C, Wire12, Wire13, Wire10, Wire11);
	
	// SEGMENTO D
	or Or20(Wire16, SEG_DDois, Sel[1], Sel[0]);		//00
	or Or21(Wire17, SEG_DTres, Sel[1], Sel0n);		//01
	or Or6(Wire14, SEG_DUm, Sel1n, Sel[0]);  		//10
	or Or7(Wire15, SEG_D0, Sel1n, Sel0n);         	//11
	and And3(SEG_D, Wire17, Wire16, Wire14, Wire15);

	// SEGMENTO E
	or Or22(Wire20, SEG_E2, Sel[1], Sel[0]);		//00
	or Or23(Wire21, SEG_E3, Sel[1], Sel0n);		//01
	or Or8(Wire18, SEG_E1, Sel1n, Sel[0]);  		//10
	or Or9(Wire19, SEG_E0, Sel1n, Sel0n);         	//11
	and And4(SEG_E, Wire21, Wire20, Wire18, Wire19);
	
	// SEGMENTO F
	or Or24(Wire24, SEG_F2, Sel[1], Sel[0]);		//00
	or Or25(Wire25, SEG_F3, Sel[1], Sel0n);		//01
	or Or10(Wire22, SEG_F1, Sel1n, Sel[0]);  		//10
	or Or11(Wire23, SEG_F0, Sel1n, Sel0n);         	//11
	and And5(SEG_F, Wire24, Wire25, Wire22, Wire23);
	
	// SEGMENTO G
	or Or26(Wire28, SEG_G2, Sel[1], Sel[0]);		//00
	or Or27(Wire29, SEG_G3, Sel[1], Sel0n);		//01
	or Or12(Wire26, SEG_G1, Sel1n, Sel[0]);  		//10
	or Or13(Wire27, SEG_G0, Sel1n, Sel0n);         	//11
	and And6(SEG_G, Wire28, Wire29, Wire26, Wire27);

	not(SEG_P, 0);
	
endmodule