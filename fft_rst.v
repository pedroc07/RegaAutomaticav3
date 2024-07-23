// Declaracao do modulo do flip-flop T
module fft_rst (Prst, Rst, T, clock, Q);

	// Declaracao de portas
	input T, Prst, Rst;
   input clock;
   output reg Q;

   always @(posedge clock) begin
	
      if(Prst)begin
		Q <= 1;
		end else if(Rst)begin
		Q <= 0;
		end else if (T) begin
		Q <= ~Q;
   end
	end

endmodule 