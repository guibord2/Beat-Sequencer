module sample_adder  ( 				input		[6:0]select,
											input			[15:0] bass_drum, snare, clap, hihat, cymbal, tom1, tom2,
											input        poweron, CLK,
											output		[15:0] dout);

		always_ff @ (posedge CLK)
		begin
			dout = 16'h0;
			if (~poweron)
				dout = 'b0;
			else begin
				if (select[6])
					dout = dout + bass_drum;
				if (select[5])
					dout = dout + snare;
				if (select[4])
					dout = dout + clap;
				if (select[3])
					dout = dout + hihat;
				if (select[2])
					dout = dout + cymbal;
				if (select[1])
					dout = dout + tom1;
				if (select[0])
					dout = dout + tom2;
			end
		end
		
		
endmodule 