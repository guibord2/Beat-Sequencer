module audio(	input logic MCLK, poweron,
					input logic [15:0] row0, row1, row2, row3, row4, row5, row6,
					input logic [3:0] counter
					);
					


//psuedo code

logic LRCLK;


if(poweron) begin	//audio only plays if this is true
	if(row0[counter]) begin
		//play bass drum
	end
	if(row1[counter]) begin
		//play snare
	end
	if(row2[counter]) begin
		//play clap
	end
	if(row3[counter]) begin
		//play hihat
	end
	if(row4[counter])	begin
		//play open hihat
	end
	if(row5[counter]) begin
		//play low tom
	end
	if(row6[counter]) begin
		//play high tom
	end
	
	
end	//poweron if statement end

