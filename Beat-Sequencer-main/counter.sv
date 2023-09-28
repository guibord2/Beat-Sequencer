module  counter( input clk, poweron,
               output[3:0] counter
					);
					

logic [30:0] clock_counter;					
					
					

always_ff @ (posedge clk) begin

	if(~poweron)begin
		counter <= 4'b0;
		clock_counter <= 26'd00000000;
	end
	else if (clock_counter == 26'd05000000)begin
		counter <= counter + 4'b0001;
		clock_counter <= 26'd0;
	end
	else begin
		clock_counter <= clock_counter + 26'd00000001;
	end

end



					

					
endmodule 