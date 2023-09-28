module I2S(input LRCLK, SCLK,
			  input [31:0] Din,
			  output Dout);
			  
	logic[31:0] L,R;
			  
			  
	always_ff @ (posedge SCLK)begin
		if (LRCLK)begin
			L <= Din;
			Dout <= R[31];
			R <= {R[30:0], 1'b0};
		end
		else begin
			R <= Din;
			Dout <= L[31];
			L <= {L[30:0], 1'b0};
		end
	end

 

endmodule
