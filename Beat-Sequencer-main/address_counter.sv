module  address_counter ( input LRCLK, poweron,
								 output[13:0] counter
					);		
					
					

always_ff @ (posedge LRCLK) begin

	if(~poweron)begin
		counter <= 'b0;
	end
	else if (counter == 14'd4096)begin
		counter <= 'd0;
	end
	else begin
		counter <= counter + 1'b1;
	end

end
					
endmodule 