module final_back_2_example (
	input logic vga_clk,
	input logic [9:0] DrawX, DrawY, BallX, BallY, BallS,
	input logic [7:0] button,
	input logic blank,
	input logic [3:0] counter,
	output logic [3:0] red, green, blue,
	output logic [15:0] row0, row1, row2, row3, row4, row5, row6,
	output logic poweron
);

logic [18:0] rom_address;
logic [3:0] rom_q;

logic [3:0] palette_red, palette_green, palette_blue, redpinks, greenpinks, bluepinks;
logic [3:0] red_oranges, green_oranges, blue_oranges;
logic [3:0] red_blues, green_blues, blue_blues;
logic [3:0] red_greens, green_greens, blue_greens;
logic [3:0] pbutt_red, pbutt_green, pbutt_blue, pobutt_red, pobutt_green, pobutt_blue;
logic [3:0] redpinks_o, greenpinks_o, bluepinks_o;

logic [3:0] red_0, green_0, blue_0;
logic [3:0] red_1, green_1, blue_1;
logic [3:0] red_2, green_2, blue_2;
logic [3:0] red_3, green_3, blue_3;
logic [3:0] red_4, green_4, blue_4;
logic [3:0] red_5, green_5, blue_5;
logic [3:0] red_6, green_6, blue_6;

logic flag;
//logic [3:0] counter;
//logic [15:0] row0, row1, row2, row3, row4, row5, row6;
//logic poweron;

logic negedge_vga_clk;

// read from ROM on negedge, set pixel on posedge
assign negedge_vga_clk = ~vga_clk;

// address into the rom = (x*xDim)/640 + ((y*yDim)/480) * xDim
// this will stretch out the sprite across the entire screen
assign rom_address = ((DrawX * 640) / 640) + (((DrawY * 480) / 480) * 640);


logic ball_on;
int DistX, DistY, Size;
assign DistX = DrawX - BallX;
assign DistY = DrawY - BallY;
assign Size = BallS;

 always_comb
 begin:Ball_on_proc
	  if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
			ball_on = 1'b1;
	  else 
			ball_on = 1'b0;
			
	
			
  end 




always_ff @ (posedge vga_clk) begin
	red = 4'h0;
	green = 4'h0;
	blue = 4'h0;


	//1 if sprite can be toggled
	if (button == 0)
		flag = 1'b1;
		
//pinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpink

	//ball0_0
	if(((BallX < 77) && (BallX > 42) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[0] = ~row0[0];
		flag = 1'b0;
	end

	//ball0_1
	if(((BallX < 114) && (BallX > 79) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[1] = ~row0[1];
		flag = 1'b0;
	end
	
	//ball0_2
	if(((BallX < 151) && (BallX > 116) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[2] = ~row0[2];
		flag = 1'b0;
	end
	
	//ball0_3
	if(((BallX < 188) && (BallX > 153) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[3] = ~row0[3];
		flag = 1'b0;
	end
	
	//ball0_4
	if(((BallX < 226) && (BallX > 191) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[4] = ~row0[4];
		flag = 1'b0;
	end
	
	//ball0_5
	if(((BallX < 263) && (BallX > 228) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[5] = ~row0[5];
		flag = 1'b0;
	end
	
	//ball0_6
	if(((BallX < 300) && (BallX > 265) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[6] = ~row0[6];
		flag = 1'b0;
	end
	
	//ball0_7
	if(((BallX < 337) && (BallX > 302) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[7] = ~row0[7];
		flag = 1'b0;
	end
	
	//ball0_8
	if(((BallX < 376) && (BallX > 341) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[8] = ~row0[8];
		flag = 1'b0;
	end
	
	//ball0_9
	if(((BallX < 413) && (BallX > 378) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[9] = ~row0[9];
		flag = 1'b0;
	end
	
	//ball0_10
	if(((BallX < 450) && (BallX > 415) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[10] = ~row0[10];
		flag = 1'b0;
	end
	
	//ball0_11
	if(((BallX < 487) && (BallX > 452) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[11] = ~row0[11];
		flag = 1'b0;
	end
	
	//ball0_12
	if(((BallX < 526) && (BallX > 491) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[12] = ~row0[12];
		flag = 1'b0;
	end
	
	//ball0_13
	if(((BallX < 563) && (BallX > 528) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[13] = ~row0[13];
		flag = 1'b0;
	end
	
	//ball0_14
	if(((BallX < 600) && (BallX > 565) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[14] = ~row0[14];
		flag = 1'b0;
	end
	
	//ball0_15
	if(((BallX < 638) && (BallX > 603) && (BallY > 39) && (BallY < 75)) && (button == 1) && flag == 1)begin
		row0[15] = ~row0[15];
		flag = 1'b0;
	end
	
//-------------------------------------------------------------------------------------------------------------------
//ORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGEORANGE
	
	//ball1_0
	if(((BallX < 77) && (BallX > 42) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[0] = ~row1[0];
		flag = 1'b0;
	end

	//ball1_1
	if(((BallX < 114) && (BallX > 79) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[1] = ~row1[1];
		flag = 1'b0;
	end
	
	//ball1_2
	if(((BallX < 151) && (BallX > 116) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[2] = ~row1[2];
		flag = 1'b0;
	end
	
	//ball1_3
	if(((BallX < 188) && (BallX > 153) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[3] = ~row1[3];
		flag = 1'b0;
	end
	
	//ball1_4
	if(((BallX < 226) && (BallX > 191) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[4] = ~row1[4];
		flag = 1'b0;
	end
	
	//ball1_5
	if(((BallX < 263) && (BallX > 228) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[5] = ~row1[5];
		flag = 1'b0;
	end
	
	//ball1_6
	if(((BallX < 300) && (BallX > 265) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[6] = ~row1[6];
		flag = 1'b0;
	end
	
	//ball1_7
	if(((BallX < 337) && (BallX > 302) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[7] = ~row1[7];
		flag = 1'b0;
	end
	
	//ball1_8
	if(((BallX < 376) && (BallX > 341) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[8] = ~row1[8];
		flag = 1'b0;
	end
	
	//ball1_9
	if(((BallX < 413) && (BallX > 378) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[9] = ~row1[9];
		flag = 1'b0;
	end
	
	//ball1_10
	if(((BallX < 450) && (BallX > 415) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[10] = ~row1[10];
		flag = 1'b0;
	end
	
	//ball1_11
	if(((BallX < 487) && (BallX > 452) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[11] = ~row1[11];
		flag = 1'b0;
	end
	
	//ball1_12
	if(((BallX < 526) && (BallX > 491) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[12] = ~row1[12];
		flag = 1'b0;
	end
	
	//ball1_13
	if(((BallX < 563) && (BallX > 528) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[13] = ~row1[13];
		flag = 1'b0;
	end
	
	//ball1_14
	if(((BallX < 600) && (BallX > 565) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[14] = ~row1[14];
		flag = 1'b0;
	end
	
	//ball1_15
	if(((BallX < 638) && (BallX > 603) && (BallY > 82) && (BallY < 117)) && (button == 1) && flag == 1)begin
		row1[15] = ~row1[15];
		flag = 1'b0;
	end
	
//orange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dos

	//ball2_0
	if(((BallX < 77) && (BallX > 42) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[0] = ~row2[0];
		flag = 1'b0;
	end

	//ball2_1
	if(((BallX < 114) && (BallX > 79) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[1] = ~row2[1];
		flag = 1'b0;
	end
	
	//ball2_2
	if(((BallX < 151) && (BallX > 116) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[2] = ~row2[2];
		flag = 1'b0;
	end
	
	//ball2_3
	if(((BallX < 188) && (BallX > 153) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[3] = ~row2[3];
		flag = 1'b0;
	end
	
	//ball2_4
	if(((BallX < 226) && (BallX > 191) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[4] = ~row2[4];
		flag = 1'b0;
	end
	
	//ball2_5
	if(((BallX < 263) && (BallX > 228) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[5] = ~row2[5];
		flag = 1'b0;
	end
	
	//ball2_6
	if(((BallX < 300) && (BallX > 265) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[6] = ~row2[6];
		flag = 1'b0;
	end
	
	//ball2_7
	if(((BallX < 337) && (BallX > 302) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[7] = ~row2[7];
		flag = 1'b0;
	end
	
	//ball2_8
	if(((BallX < 376) && (BallX > 341) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[8] = ~row2[8];
		flag = 1'b0;
	end
	
	//ball2_9
	if(((BallX < 413) && (BallX > 378) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[9] = ~row2[9];
		flag = 1'b0;
	end
	
	//ball2_10
	if(((BallX < 450) && (BallX > 415) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[10] = ~row2[10];
		flag = 1'b0;
	end
	
	//ball2_11
	if(((BallX < 487) && (BallX > 452) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[11] = ~row2[11];
		flag = 1'b0;
	end
	
	//ball2_12
	if(((BallX < 526) && (BallX > 491) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[12] = ~row2[12];
		flag = 1'b0;
	end
	
	//ball2_13
	if(((BallX < 563) && (BallX > 528) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[13] = ~row2[13];
		flag = 1'b0;
	end
	
	//ball2_14
	if(((BallX < 600) && (BallX > 565) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[14] = ~row2[14];
		flag = 1'b0;
	end
	
	//ball2_15
	if(((BallX < 638) && (BallX > 603) && (BallY > 125) && (BallY < 160)) && (button == 1) && flag == 1)begin
		row2[15] = ~row2[15];
		flag = 1'b0;
	end
	
//blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1

	//ball3_0
	if(((BallX < 77) && (BallX > 42) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[0] = ~row3[0];
		flag = 1'b0;
	end

	//ball3_1
	if(((BallX < 114) && (BallX > 79) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[1] = ~row3[1];
		flag = 1'b0;
	end
	
	//ball3_2
	if(((BallX < 151) && (BallX > 116) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[2] = ~row3[2];
		flag = 1'b0;
	end
	
	//ball3_3
	if(((BallX < 188) && (BallX > 153) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[3] = ~row3[3];
		flag = 1'b0;
	end
	
	//ball3_4
	if(((BallX < 226) && (BallX > 191) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[4] = ~row3[4];
		flag = 1'b0;
	end
	
	//ball3_5
	if(((BallX < 263) && (BallX > 228) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[5] = ~row3[5];
		flag = 1'b0;
	end
	
	//ball3_6
	if(((BallX < 300) && (BallX > 265) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[6] = ~row3[6];
		flag = 1'b0;
	end
	
	//ball3_7
	if(((BallX < 337) && (BallX > 302) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[7] = ~row3[7];
		flag = 1'b0;
	end
	
	//ball3_8
	if(((BallX < 376) && (BallX > 341) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[8] = ~row3[8];
		flag = 1'b0;
	end
	
	//ball3_9
	if(((BallX < 413) && (BallX > 378) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[9] = ~row3[9];
		flag = 1'b0;
	end
	
	//ball3_10
	if(((BallX < 450) && (BallX > 415) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[10] = ~row3[10];
		flag = 1'b0;
	end
	
	//ball3_11
	if(((BallX < 487) && (BallX > 452) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[11] = ~row3[11];
		flag = 1'b0;
	end
	
	//ball3_12
	if(((BallX < 526) && (BallX > 491) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[12] = ~row3[12];
		flag = 1'b0;
	end
	
	//ball3_13
	if(((BallX < 563) && (BallX > 528) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[13] = ~row3[13];
		flag = 1'b0;
	end
	
	//ball3_14
	if(((BallX < 600) && (BallX > 565) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[14] = ~row3[14];
		flag = 1'b0;
	end
	
	//ball3_15
	if(((BallX < 638) && (BallX > 603) && (BallY > 168) && (BallY < 203)) && (button == 1) && flag == 1)begin
		row3[15] = ~row3[15];
		flag = 1'b0;
	end

//blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2

	//ball4_0
	if(((BallX < 77) && (BallX > 42) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[0] = ~row4[0];
		flag = 1'b0;
	end

	//ball4_1
	if(((BallX < 114) && (BallX > 79) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[1] = ~row4[1];
		flag = 1'b0;
	end
	
	//ball4_2
	if(((BallX < 151) && (BallX > 116) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[2] = ~row4[2];
		flag = 1'b0;
	end
	
	//ball4_3
	if(((BallX < 188) && (BallX > 153) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[3] = ~row4[3];
		flag = 1'b0;
	end
	
	//ball4_4
	if(((BallX < 226) && (BallX > 191) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[4] = ~row4[4];
		flag = 1'b0;
	end
	
	//ball4_5
	if(((BallX < 263) && (BallX > 228) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[5] = ~row4[5];
		flag = 1'b0;
	end
	
	//ball4_6
	if(((BallX < 300) && (BallX > 265) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[6] = ~row4[6];
		flag = 1'b0;
	end
	
	//ball4_7
	if(((BallX < 337) && (BallX > 302) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[7] = ~row4[7];
		flag = 1'b0;
	end
	
	//ball4_8
	if(((BallX < 376) && (BallX > 341) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[8] = ~row4[8];
		flag = 1'b0;
	end
	
	//ball4_9
	if(((BallX < 413) && (BallX > 378) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[9] = ~row4[9];
		flag = 1'b0;
	end
	
	//ball4_10
	if(((BallX < 450) && (BallX > 415) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[10] = ~row4[10];
		flag = 1'b0;
	end
	
	//ball4_11
	if(((BallX < 487) && (BallX > 452) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[11] = ~row4[11];
		flag = 1'b0;
	end
	
	//ball4_12
	if(((BallX < 526) && (BallX > 491) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[12] = ~row4[12];
		flag = 1'b0;
	end
	
	//ball4_13
	if(((BallX < 563) && (BallX > 528) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[13] = ~row4[13];
		flag = 1'b0;
	end
	
	//ball4_14
	if(((BallX < 600) && (BallX > 565) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[14] = ~row4[14];
		flag = 1'b0;
	end
	
	//ball4_15
	if(((BallX < 638) && (BallX > 603) && (BallY > 211) && (BallY < 246)) && (button == 1) && flag == 1)begin
		row4[15] = ~row4[15];
		flag = 1'b0;
	end
	
//greengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreen

	//ball5_0
	if(((BallX < 77) && (BallX > 42) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[0] = ~row5[0];
		flag = 1'b0;
	end

	//ball5_1
	if(((BallX < 114) && (BallX > 79) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[1] = ~row5[1];
		flag = 1'b0;
	end
	
	//ball5_2
	if(((BallX < 151) && (BallX > 116) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[2] = ~row5[2];
		flag = 1'b0;
	end
	
	//ball5_3
	if(((BallX < 188) && (BallX > 153) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[3] = ~row5[3];
		flag = 1'b0;
	end
	
	//ball5_4
	if(((BallX < 226) && (BallX > 191) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[4] = ~row5[4];
		flag = 1'b0;
	end
	
	//ball5_5
	if(((BallX < 263) && (BallX > 228) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[5] = ~row5[5];
		flag = 1'b0;
	end
	
	//ball5_6
	if(((BallX < 300) && (BallX > 265) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[6] = ~row5[6];
		flag = 1'b0;
	end
	
	//ball5_7
	if(((BallX < 337) && (BallX > 302) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[7] = ~row5[7];
		flag = 1'b0;
	end
	
	//ball5_8
	if(((BallX < 376) && (BallX > 341) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[8] = ~row5[8];
		flag = 1'b0;
	end
	
	//ball5_9
	if(((BallX < 413) && (BallX > 378) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[9] = ~row5[9];
		flag = 1'b0;
	end
	
	//ball5_10
	if(((BallX < 450) && (BallX > 415) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[10] = ~row5[10];
		flag = 1'b0;
	end
	
	//ball5_11
	if(((BallX < 487) && (BallX > 452) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[11] = ~row5[11];
		flag = 1'b0;
	end
	
	//ball5_12
	if(((BallX < 526) && (BallX > 491) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[12] = ~row5[12];
		flag = 1'b0;
	end
	
	//ball5_13
	if(((BallX < 563) && (BallX > 528) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[13] = ~row5[13];
		flag = 1'b0;
	end
	
	//ball5_14
	if(((BallX < 600) && (BallX > 565) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[14] = ~row5[14];
		flag = 1'b0;
	end
	
	//ball5_15
	if(((BallX < 638) && (BallX > 603) && (BallY > 254) && (BallY < 289)) && (button == 1) && flag == 1)begin
		row5[15] = ~row5[15];
		flag = 1'b0;
	end
	
//green2green2green2green2green2green2green2green2green2green2green2green2green2green2green2green2green2green2green2green2

	//ball6_0
	if(((BallX < 77) && (BallX > 42) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[0] = ~row6[0];
		flag = 1'b0;
	end

	//ball6_1
	if(((BallX < 114) && (BallX > 79) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[1] = ~row6[1];
		flag = 1'b0;
	end
	
	//ball6_2
	if(((BallX < 151) && (BallX > 116) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[2] = ~row6[2];
		flag = 1'b0;
	end
	
	//ball6_3
	if(((BallX < 188) && (BallX > 153) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[3] = ~row6[3];
		flag = 1'b0;
	end
	
	//ball6_4
	if(((BallX < 226) && (BallX > 191) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[4] = ~row6[4];
		flag = 1'b0;
	end
	
	//ball6_5
	if(((BallX < 263) && (BallX > 228) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[5] = ~row6[5];
		flag = 1'b0;
	end
	
	//ball6_6
	if(((BallX < 300) && (BallX > 265) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[6] = ~row6[6];
		flag = 1'b0;
	end
	
	//ball6_7
	if(((BallX < 337) && (BallX > 302) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[7] = ~row6[7];
		flag = 1'b0;
	end
	
	//ball6_8
	if(((BallX < 376) && (BallX > 341) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[8] = ~row6[8];
		flag = 1'b0;
	end
	
	//ball6_9
	if(((BallX < 413) && (BallX > 378) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[9] = ~row6[9];
		flag = 1'b0;
	end
	
	//ball6_10
	if(((BallX < 450) && (BallX > 415) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[10] = ~row6[10];
		flag = 1'b0;
	end
	
	//ball6_11
	if(((BallX < 487) && (BallX > 452) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[11] = ~row6[11];
		flag = 1'b0;
	end
	
	//ball6_12
	if(((BallX < 526) && (BallX > 491) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[12] = ~row6[12];
		flag = 1'b0;
	end
	
	//ball6_13
	if(((BallX < 563) && (BallX > 528) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[13] = ~row6[13];
		flag = 1'b0;
	end
	
	//ball6_14
	if(((BallX < 600) && (BallX > 565) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[14] = ~row6[14];
		flag = 1'b0;
	end
	
	//ball6_15
	if(((BallX < 638) && (BallX > 603) && (BallY > 297) && (BallY < 332)) && (button == 1) && flag == 1)begin
		row6[15] = ~row6[15];
		flag = 1'b0;
	end
	
	if(((BallX < 339) && (BallX > 299) && (BallY > 433) && (BallY < 477)) && (button == 1) && flag == 1)begin
		poweron = ~poweron;
		flag = 1'b0;
	end
	
//---------------------------------------------------------------------------------------------------------------------------------------------------------------

if (blank) begin
	if ((ball_on == 1'b1) && (button == 0)) 
	begin 
		red = 8'hff;
		green = 8'h55;
		blue = 8'h00;
	end  
	else if((ball_on == 1'b1) && (button > 0))
	begin
		red = 8'h00;
		green = 8'hff;
		blue = 8'h00;
	end
	
//pinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpinkpink
	//ball 0_0
	else if(((DrawX < 77) && (DrawX > 42)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h0) && poweron && row0[0])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h0) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[0])begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end
	
	//ball 0_1
	else if(((DrawX < 114) && (DrawX > 79)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h1) && poweron && row0[1])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h1) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[1]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_2
	else if(((DrawX < 151) && (DrawX > 116)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h2) && poweron && row0[2])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h2) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[2]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_3
	else if(((DrawX < 188) && (DrawX > 153)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h3) && poweron && row0[3])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h3) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[3]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_4
	else if(((DrawX < 226) && (DrawX > 191)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h4) && poweron && row0[4])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h4) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[4]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_5
	else if(((DrawX < 263) && (DrawX > 228)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h5) && poweron && row0[5])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h5) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[5]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_6
	else if(((DrawX < 300) && (DrawX > 265)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h6) && poweron && row0[6])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h6) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[6]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_7
	else if(((DrawX < 337) && (DrawX > 302)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h7) && poweron && row0[7])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h7) && poweron)begin
			red = 4'hB;
			green = 4'h3;
			blue = 4'h9;
		end
		else if (row0[7])begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_8
	else if(((DrawX < 376) && (DrawX > 341)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h8) && poweron && row0[8])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h8) && poweron)begin
			red = 4'hB;
			green = 4'h3;
			blue = 4'h9;
		end
		else if (row0[8])begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_9
	else if(((DrawX < 413) && (DrawX > 378)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'h9) && poweron && row0[9])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h9) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[9]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_10
	else if(((DrawX < 450) && (DrawX > 415)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'hA) && poweron && row0[10])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hA) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[10])begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_11
	else if(((DrawX < 487) && (DrawX > 452)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'hB) && poweron && row0[11])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hB) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[11]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_12
	else if(((DrawX < 526) && (DrawX > 491)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'hC) && poweron && row0[12])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hC) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[12]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_13
	else if(((DrawX < 563) && (DrawX > 528)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'hD) && poweron && row0[13])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hD) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[13])begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_14
	else if(((DrawX < 600) && (DrawX > 565)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'hE) && poweron && row0[14])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hE) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[14]) begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
	//ball 0_15
	else if(((DrawX < 638) && (DrawX > 603)) && ((DrawY < 75) && (DrawY > 39)))
	begin
		if ((counter[3:0] == 4'hF) && poweron && row0[15])begin
			red = 4'hF;
			green = 4'h3;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hF) && poweron)begin
			red = 4'h9;
			green = 4'h0;
			blue = 4'h9;
		end
		else if (row0[15])begin
			red = 4'hD;
			green = 4'h2;
			blue = 4'hB;
		end
		else begin
			red = 4'h4;
			green = 4'h1;
			blue = 4'h4;
		end
	end	
	
//orangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorangeorange
	//ball 1_0
	else if(((DrawX < 77) && (DrawX > 42)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h0) && poweron && row1[0])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h0) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[0])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end
	
	//ball 1_1
	else if(((DrawX < 114) && (DrawX > 79)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h1) && poweron && row1[1])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h1) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[1])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_2
	else if(((DrawX < 151) && (DrawX > 116)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h2) && poweron && row1[2])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h2) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[2])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_3
	else if(((DrawX < 188) && (DrawX > 153)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h3) && poweron && row1[3])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h3) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[3])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_4
	else if(((DrawX < 226) && (DrawX > 191)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h4) && poweron && row1[4])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h4) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[4])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_5
	else if(((DrawX < 263) && (DrawX > 228)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h5) && poweron && row1[5])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h5) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[5])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_6
	else if(((DrawX < 300) && (DrawX > 265)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h6) && poweron && row1[6])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h6) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[6])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_7
	else if(((DrawX < 337) && (DrawX > 302)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h7) && poweron && row1[7])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h7) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[7])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_8
	else if(((DrawX < 376) && (DrawX > 341)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h8) && poweron && row1[8])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h8) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[8])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_9
	else if(((DrawX < 413) && (DrawX > 378)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'h9) && poweron && row1[9])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h9) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[9])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_10
	else if(((DrawX < 450) && (DrawX > 415)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'hA) && poweron && row1[10])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hA) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[10])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_11
	else if(((DrawX < 487) && (DrawX > 452)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'hB) && poweron && row1[11])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hB) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[11])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_12
	else if(((DrawX < 526) && (DrawX > 491)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'hC) && poweron && row1[12])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hC) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[12])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_13
	else if(((DrawX < 563) && (DrawX > 528)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'hD) && poweron && row1[13])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hD) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[13])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_14
	else if(((DrawX < 600) && (DrawX > 565)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'hE) && poweron && row1[14])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hE) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[14])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 1_15
	else if(((DrawX < 638) && (DrawX > 603)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		if ((counter[3:0] == 4'hF) && poweron && row1[15])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hF) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row1[15])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
//orange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dosorange_dos
	//ball 2_0
	else if(((DrawX < 77) && (DrawX > 42)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h0) && poweron && row2[0])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h0) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[0])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end
	
	//ball 2_1
	else if(((DrawX < 114) && (DrawX > 79)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h1) && poweron && row2[1])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h1) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[1])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_2
	else if(((DrawX < 151) && (DrawX > 116)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h2) && poweron && row2[2])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h2) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[2])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_3
	else if(((DrawX < 188) && (DrawX > 153)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h3) && poweron && row2[3])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h3) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[3])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_4
	else if(((DrawX < 226) && (DrawX > 191)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h4) && poweron && row2[4])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h4) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[4])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_5
	else if(((DrawX < 263) && (DrawX > 228)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h5) && poweron && row2[5])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h5) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[5])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_6
	else if(((DrawX < 300) && (DrawX > 265)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h6) && poweron && row2[6])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h6) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[6])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_7
	else if(((DrawX < 337) && (DrawX > 302)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h7) && poweron && row2[7])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h7) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[7])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_8
	else if(((DrawX < 376) && (DrawX > 341)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h8) && poweron && row2[8])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h8) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[8])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_9
	else if(((DrawX < 413) && (DrawX > 378)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'h9) && poweron && row2[9])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'h9) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[9])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_10
	else if(((DrawX < 450) && (DrawX > 415)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'hA) && poweron && row2[10])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hA) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[10])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_11
	else if(((DrawX < 487) && (DrawX > 452)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'hB) && poweron && row2[11])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hB) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[11])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_12
	else if(((DrawX < 526) && (DrawX > 491)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'hC) && poweron && row2[12])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hC) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[12])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_13
	else if(((DrawX < 563) && (DrawX > 528)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'hD) && poweron && row2[13])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hD) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[13])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_14
	else if(((DrawX < 600) && (DrawX > 565)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'hE) && poweron && row2[14])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hE) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[14])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
	//ball 2_15
	else if(((DrawX < 638) && (DrawX > 603)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		if ((counter[3:0] == 4'hF) && poweron && row2[15])begin
			red = 4'hF;
			green = 4'h9;
			blue = 4'h3;
		end
		else if ((counter[3:0] == 4'hF) && poweron)begin
			red = 4'h9;
			green = 4'h4;
			blue = 4'h0;
		end
		else if (row2[15])begin
			red = 4'hD;
			green = 4'h9;
			blue = 4'h2;
		end
		else begin
			red = 4'h4;
			green = 4'h2;
			blue = 4'h0;
		end
	end	
	
//blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1blue1

	//ball 3_0
	else if(((DrawX < 77) && (DrawX > 42)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h0) && poweron && row3[0])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h0) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[0])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end
	
	//ball 3_1
	else if(((DrawX < 114) && (DrawX > 79)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h1) && poweron && row3[1])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h1) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[1])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_2
	else if(((DrawX < 151) && (DrawX > 116)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h2) && poweron && row3[2])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h2) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[2])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_3
	else if(((DrawX < 188) && (DrawX > 153)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h3) && poweron && row3[3])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h3) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[3])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_4
	else if(((DrawX < 226) && (DrawX > 191)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h4) && poweron && row3[4])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h4) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[4])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_5
	else if(((DrawX < 263) && (DrawX > 228)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h5) && poweron && row3[5])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h5) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[5])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_6
	else if(((DrawX < 300) && (DrawX > 265)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h6) && poweron && row3[6])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h6) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[6])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_7
	else if(((DrawX < 337) && (DrawX > 302)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h7) && poweron && row3[7])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h7) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[7])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_8
	else if(((DrawX < 376) && (DrawX > 341)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h8) && poweron && row3[8])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h8) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[8])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_9
	else if(((DrawX < 413) && (DrawX > 378)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'h9) && poweron && row3[9])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h9) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[9])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_10
	else if(((DrawX < 450) && (DrawX > 415)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'hA) && poweron && row3[10])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hA) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[10])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_11
	else if(((DrawX < 487) && (DrawX > 452)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'hB) && poweron && row3[11])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hB) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[11])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_12
	else if(((DrawX < 526) && (DrawX > 491)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'hC) && poweron && row3[12])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hC) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[12])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_13
	else if(((DrawX < 563) && (DrawX > 528)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'hD) && poweron && row3[13])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hD) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[13])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_14
	else if(((DrawX < 600) && (DrawX > 565)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'hE) && poweron && row3[14])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hE) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[14])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 3_15
	else if(((DrawX < 638) && (DrawX > 603)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		if ((counter[3:0] == 4'hF) && poweron && row3[15])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hF) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row3[15])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end
	
//blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2blue2

//ball 4_0
	else if(((DrawX < 77) && (DrawX > 42)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h0) && poweron && row4[0])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h0) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[0])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end
	
	//ball 4_1
	else if(((DrawX < 114) && (DrawX > 79)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h1) && poweron && row4[1])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h1) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[1])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_2
	else if(((DrawX < 151) && (DrawX > 116)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h2) && poweron && row4[2])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h2) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[2])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_3
	else if(((DrawX < 188) && (DrawX > 153)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h3) && poweron && row4[3])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h3) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[3])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_4
	else if(((DrawX < 226) && (DrawX > 191)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h4) && poweron && row4[4])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h4) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[4])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_5
	else if(((DrawX < 263) && (DrawX > 228)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h5) && poweron && row4[5])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h5) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[5])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_6
	else if(((DrawX < 300) && (DrawX > 265)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h6) && poweron && row4[6])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h6) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[6])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_7
	else if(((DrawX < 337) && (DrawX > 302)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h7) && poweron && row4[7])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h7) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[7])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_8
	else if(((DrawX < 376) && (DrawX > 341)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h8) && poweron && row4[8])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h8) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[8])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_9
	else if(((DrawX < 413) && (DrawX > 378)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'h9) && poweron && row4[9])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'h9) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[9])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_10
	else if(((DrawX < 450) && (DrawX > 415)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'hA) && poweron && row4[10])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hA) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[10])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_11
	else if(((DrawX < 487) && (DrawX > 452)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'hB) && poweron && row4[11])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hB) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[11])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_12
	else if(((DrawX < 526) && (DrawX > 491)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'hC) && poweron && row4[12])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hC) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[12])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_13
	else if(((DrawX < 563) && (DrawX > 528)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'hD) && poweron && row4[13])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hD) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[13])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_14
	else if(((DrawX < 600) && (DrawX > 565)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'hE) && poweron && row4[14])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hE) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[14])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end	
	
	//ball 4_15
	else if(((DrawX < 638) && (DrawX > 603)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		if ((counter[3:0] == 4'hF) && poweron && row4[15])begin
			red = 4'h0;
			green = 4'hF;
			blue = 4'hF;
		end
		else if ((counter[3:0] == 4'hF) && poweron)begin
			red = 4'h0;
			green = 4'h4;
			blue = 4'h8;
		end
		else if (row4[15])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'hD;
		end
		else begin
			red = 4'h0;
			green = 4'h3;
			blue = 4'h4;
		end
	end
	
//greengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreengreen

	//ball 5_0
	else if(((DrawX < 77) && (DrawX > 42)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h0) && poweron && row5[0])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h0) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[0])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end
	
	//ball 5_1
	else if(((DrawX < 114) && (DrawX > 79)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h1) && poweron && row5[1])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h1) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[1])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_2
	else if(((DrawX < 151) && (DrawX > 116)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h2) && poweron && row5[2])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h2) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[2])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_3
	else if(((DrawX < 188) && (DrawX > 153)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h3) && poweron && row5[3])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h3) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[3])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_4
	else if(((DrawX < 226) && (DrawX > 191)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h4) && poweron && row5[4])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h4) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[4])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_5
	else if(((DrawX < 263) && (DrawX > 228)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h5) && poweron && row5[5])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h5) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[5])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_6
	else if(((DrawX < 300) && (DrawX > 265)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h6) && poweron && row5[6])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h6) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[6])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_7
	else if(((DrawX < 337) && (DrawX > 302)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h7) && poweron && row5[7])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h7) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[7])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_8
	else if(((DrawX < 376) && (DrawX > 341)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h8) && poweron && row5[8])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h8) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[8])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_9
	else if(((DrawX < 413) && (DrawX > 378)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'h9) && poweron && row5[9])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h9) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[9])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_10
	else if(((DrawX < 450) && (DrawX > 415)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'hA) && poweron && row5[10])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hA) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[10])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_11
	else if(((DrawX < 487) && (DrawX > 452)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'hB) && poweron && row5[11])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hB) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[11])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_12
	else if(((DrawX < 526) && (DrawX > 491)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'hC) && poweron && row5[12])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hC) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[12])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_13
	else if(((DrawX < 563) && (DrawX > 528)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'hD) && poweron && row5[13])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hD) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[13])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_14
	else if(((DrawX < 600) && (DrawX > 565)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'hE) && poweron && row5[14])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hE) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[14])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 5_15
	else if(((DrawX < 638) && (DrawX > 603)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		if ((counter[3:0] == 4'hF) && poweron && row5[15])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hF) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row5[15])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end
	
//green2green2green2green2green2green2green2green2green2green2green2green2green2green2green2green2green2

//ball 6_0
	else if(((DrawX < 77) && (DrawX > 42)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h0) && poweron && row6[0])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h0) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[0])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end
	
	//ball 6_1
	else if(((DrawX < 114) && (DrawX > 79)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h1) && poweron && row6[1])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h1) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[1])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_2
	else if(((DrawX < 151) && (DrawX > 116)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h2) && poweron && row6[2])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h2) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[2])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_3
	else if(((DrawX < 188) && (DrawX > 153)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h3) && poweron && row6[3])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h3) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[3])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_4
	else if(((DrawX < 226) && (DrawX > 191)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h4) && poweron && row6[4])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h4) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[4])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_5
	else if(((DrawX < 263) && (DrawX > 228)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h5) && poweron && row6[5])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h5) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[5])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_6
	else if(((DrawX < 300) && (DrawX > 265)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h6) && poweron && row6[6])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h6) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[6])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_7
	else if(((DrawX < 337) && (DrawX > 302)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h7) && poweron && row6[7])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h7) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[7])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_8
	else if(((DrawX < 376) && (DrawX > 341)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h8) && poweron && row6[8])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h8) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[8])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_9
	else if(((DrawX < 413) && (DrawX > 378)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'h9) && poweron && row6[9])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'h9) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[9])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_10
	else if(((DrawX < 450) && (DrawX > 415)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'hA) && poweron && row6[10])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hA) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[10])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_11
	else if(((DrawX < 487) && (DrawX > 452)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'hB) && poweron && row6[11])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hB) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[11])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_12
	else if(((DrawX < 526) && (DrawX > 491)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'hC) && poweron && row6[12])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hC) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[12])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_13
	else if(((DrawX < 563) && (DrawX > 528)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'hD) && poweron && row6[13])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hD) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[13])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_14
	else if(((DrawX < 600) && (DrawX > 565)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'hE) && poweron && row6[14])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hE) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[14])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end	
	
	//ball 6_15
	else if(((DrawX < 638) && (DrawX > 603)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		if ((counter[3:0] == 4'hF) && poweron && row6[15])begin
			red = 4'h6;
			green = 4'hF;
			blue = 4'h6;
		end
		else if ((counter[3:0] == 4'hF) && poweron)begin
			red = 4'h4;
			green = 4'h6;
			blue = 4'h0;
		end
		else if (row6[15])begin
			red = 4'h2;
			green = 4'hD;
			blue = 4'h2;
		end
		else begin
			red = 4'h1;
			green = 4'h4;
			blue = 4'h2;
		end
	end
	
	else if(((DrawX < 340) && (DrawX > 299)) && ((DrawY > 433) && (DrawY < 478)) && poweron)
	begin
		red = pbutt_red;
		green = pbutt_green;
		blue = pbutt_blue;
	end
	
	else if(((DrawX < 340) && (DrawX > 299)) && ((DrawY > 433) && (DrawY < 478)))
	begin
		red = pobutt_red;
		green = pobutt_green;
		blue = pobutt_blue;
	end
	
	
	
	//kick drum
	
	else if(((DrawX < 36) && (DrawX > 0)) && ((DrawY > 39) && (DrawY < 75)))
	begin
		red = red_0;
		green = green_0;
		blue = blue_0;
	end
	
	//snare
	else if(((DrawX < 36) && (DrawX > 0)) && ((DrawY > 82) && (DrawY < 117)))
	begin
		red = red_1;
		green = green_1;
		blue = blue_1;
	end
	
	//clap
	else if(((DrawX < 36) && (DrawX > 0)) && ((DrawY > 125) && (DrawY < 160)))
	begin
		red = red_2;
		green = green_2;
		blue = blue_2;
	end
	
	//hihat
	else if(((DrawX < 36) && (DrawX > 0)) && ((DrawY > 168) && (DrawY < 203)))
	begin
		red = red_3;
		green = green_3;
		blue = blue_3;
	end
	
	//open hihat
	else if(((DrawX < 36) && (DrawX > 0)) && ((DrawY > 211) && (DrawY < 246)))
	begin
		red = red_4;
		green = green_4;
		blue = blue_4;
	end
	
	//low tom
	else if(((DrawX < 36) && (DrawX > 0)) && ((DrawY > 254) && (DrawY < 289)))
	begin
		red = red_5;
		green = green_5;
		blue = blue_5;
	end
	
	//high tom
	else if(((DrawX < 36) && (DrawX > 0)) && ((DrawY > 297) && (DrawY < 332)))
	begin
		red = red_6;
		green = green_6;
		blue = blue_6;
	end
	
	
	
	
	
	else if ((DrawY < 25))
	begin
		red = 4'h4;
		green = 4'h5;
		blue = 4'h5;
	end
	else if (((DrawX > 38)) && ((DrawY > 25) && (DrawY < 432)))
	begin
		red = 4'h1;
		green = 4'h1;
		blue = 4'h1;
	end
	else if ((DrawY > 432))
	begin
		red = 4'h4;
		green = 4'h5;
		blue = 4'h5;
	end
	else
	begin
		red = 4'h1;
		green = 4'h1;
		blue = 4'h1;
	end
	
//
	
end	//if blank end


end	//always_ff end


//power button
power_button_example power_button(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(pbutt_red), .green(pbutt_green), .blue(pbutt_blue));

power_button_off_example power_button_off(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(pobutt_red), .green(pobutt_green), .blue(pobutt_blue));

kick_image_example a(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(red_0), .green(green_0), .blue(blue_0));
snare_image_example s(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(red_1), .green(green_1), .blue(blue_1));
clap_image_example d(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(red_2), .green(green_2), .blue(blue_2));
hh_image_example f(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(red_3), .green(green_3), .blue(blue_3));
ohh_image_example g(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(red_4), .green(green_4), .blue(blue_4));
lowtom_image_example h(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(red_5), .green(green_5), .blue(blue_5));
hightom_image_example j(.vga_clk(vga_clk), .DrawX(DrawX), .DrawY(DrawY), .blank(blank), .red(red_6), .green(green_6), .blue(blue_6));





endmodule
