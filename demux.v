module Seletor_Imagem();	
	
	wire Sel0n, Sel1n, Wire0, Wire1, Wire2, Wire3, Wire4, Wire5, Wire6, Wire7, 
	Wire8, Wire9, Wire10, Wire11, Wire12, Wire13, Wire14, Wire15, Wire16, Wire17, 
	Wire18, Wire19, Wire20, Wire21, Wire22, Wire23, Wire24, Wire25, Wire26, Wire27,
	Wire28, Wire29, Wire30, Wire31, Wire32, Wire33, Wire34, Wire35, Wire36, Wire37, Wire38, Wire39,
	Wire40, Wire41;
	
	//Seleciona os segmentos
	demux_1x4(REGA, Sel, SEG_D1, SEG_D2, SEG_D3, SEG_D4);
	
	// Bits seletores de imagem
	cont_2b(S, Rst, Sel[1], Sel[0]);
	
	// Seleciona os contadores de acordo com os bits
	not Not0(Sel0n, Sel[0]);
	not Not1(Sel1n, Sel[1]);
	
	// SEGMENTO A
	
	not Not2(Wire0, 1);		         							 //00
	not Not3(Wire1, 1);										       //01
	or Or28(Wire28, Vs, Cont4_SegA, Sel[1], Sel0n);  		//10
	or Or3(Wire3, Cont2_SegA, Sel1n, Sel0n);         		//11
	and And7(Cont_SegA, Wire0, Wire1, Wire2, Wire3, Wire28, Wire29);


	// SEGMENTO B
	or Or4(Wire4, Ve_SegB, Sel[1], Sel[0]);         //00
	or Or6(Wire6, Bs, Cont0_SegB, Sel[1], Sel0n);       //01
	or Or5(Wire5, Bs, Cont1_SegB, Sel1n, Sel[0]);       //10
	or Or30(Wire30, Vs, Cont4_SegB, Sel[1], Sel0n);       //01
	or Or31(Wire31, Vs, Cont3_SegB, Sel1n, Sel[0]);       //10
	or Or7(Wire7, Cont2_SegB, Sel1n, Sel0n);        //11
	and And8(Cont_SegB, Wire4, Wire5, Wire6, Wire7, Wire30, Wire31);

	// SEGMENTO C	
	or Or24(Wire24, Ve_SegC, Sel[1], Sel[0]);        //00
	or Or26(Wire26, Bs, Cont0_SegC, Sel[1], Sel0n);      //01
	or Or25(Wire25, Bs, Cont1_SegC, Sel1n, Sel[0]);      //10
	or Or32(Wire32, Vs, Cont4_SegC, Sel[1], Sel0n);      //01
	or Or33(Wire33, Vs, Cont3_SegC, Sel1n, Sel[0]);      //10
	or Or27(Wire27, Cont2_SegC, Sel1n, Sel0n);       //11
	and And9(Cont_SegC, Wire24, Wire25, Wire26, Wire27, Wire32, Wire33);
	
	// SEGMENTO D
	or Or8(Wire8, Ve_SegD, Sel[1], Sel[0]);         //00
	or Or10(Wire10, Bs, Cont0_SegD, Sel[1], Sel0n);     //01
	or Or9(Wire9, Bs, Cont1_SegD, Sel1n, Sel[0]);       //10
	or Or34(Wire34, Vs, Cont4_SegD, Sel[1], Sel0n);     //01
	or Or35(Wire35, Vs, Cont3_SegD, Sel1n, Sel[0]);       //10
	or Or11(Wire11, Cont2_SegD, Sel1n, Sel0n);      //11
	and And10(Cont_SegD, Wire8, Wire9, Wire10, Wire11, Wire34, Wire35);

	// SEGMENTO E
	or Or12(Wire12, Ve_SegE, Sel[1], Sel[0]);        //00
	or Or14(Wire14, Bs, Cont0_SegE, Sel[1], Sel0n);      //01
	or Or13(Wire13, Bs, Cont1_SegE, Sel1n, Sel[0]);      //10
	or Or36(Wire36, Vs, Cont4_SegE, Sel[1], Sel0n);      //01
	or Or37(Wire37, Vs, Cont3_SegE, Sel1n, Sel[0]);      //10
	or Or15(Wire15, Cont2_SegE, Sel1n, Sel0n);       //11
	and And11(Cont_SegE, Wire12, Wire13, Wire14, Wire15, Wire36, Wire37);
	
	// SEGMENTO F
	or Or16(Wire16, Ve_SegF, Sel[1], Sel[0]);        //00
	or Or18(Wire18, Bs, Cont0_SegF, Sel[1], Sel0n);      //01
	or Or17(Wire17, Bs, Cont1_SegF, Sel1n, Sel[0]);      //10
	or Or38(Wire38, Vs, Cont4_SegF, Sel[1], Sel0n);      //01
	or Or39(Wire39, Vs, Cont3_SegF, Sel1n, Sel[0]);      //10
	or Or19(Wire19, Cont2_SegF, Sel1n, Sel0n);       //11
	and And12(Cont_SegF, Wire16, Wire17, Wire18, Wire19, Wire38, Wire39);
	
	// SEGMENTO G
	or Or20(Wire20, Ve_SegG, Sel[1], Sel[0]);        //00
	or Or22(Wire22, Bs, Cont0_SegG, Sel[1], Sel0n);      //01
	or Or21(Wire21, Bs, Cont1_SegG, Sel1n, Sel[0]);      //10
	or Or40(Wire40, Vs, Cont4_SegG, Sel[1], Sel0n);      //01
	or Or41(Wire41, Vs, Cont3_SegG, Sel1n, Sel[0]);      //10
	or Or23(Wire23, Cont2_SegG, Sel1n, Sel0n);       //11
	and And13(Cont_SegG, Wire20, Wire21, Wire22, Wire23, Wire40, Wire41);
	
	// Medicao de erro
	decode_erro(ERRO, Sel[1], Sel[0], Erro_SegA, Erro_SegB, Erro_SegC, Erro_SegD, Erro_SegE, Erro_SegF, Erro_SegG);

	and And0(SEGs[0], Cont_SegA, Erro_SegA);
	and And1(SEGs[1], Cont_SegB, Erro_SegB);
	and And2(SEGs[2], Cont_SegC, Erro_SegC);
	and And3(SEGs[3], Cont_SegD, Erro_SegD);
	and And4(SEGs[4], Cont_SegE, Erro_SegE);
	and And5(SEGs[5], Cont_SegF, Erro_SegF);
	and And6(SEGs[6], Cont_SegG, Erro_SegG);

	not(SEG_P, 0);