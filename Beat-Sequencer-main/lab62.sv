//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab 62                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab62 (

      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 

);




logic Reset_h, vssig, blank, sync, VGA_Clk;


//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST, i2c_sda_in, i2c_scl_in, i2c_sda_oe, i2c_scl_oe;
	logic [1:0] aud_mclk_ctr;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	logic [7:0] Red, Blue, Green;
	logic [7:0] button, xdisp, ydisp;
	logic [3:0] catRed, catGreen, catBlue;
	logic [15:0] row0, row1, row2, row3, row4, row5, row6;
	logic poweron;
	logic [3:0] counter;

//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (hex_num_0, HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
//	assign VGA_R = Red[7:4];
//	assign VGA_B = Blue[7:4];
//	assign VGA_G = Green[7:4];

	assign VGA_R = catRed;
	assign VGA_B = catBlue;
	assign VGA_G = catGreen;
	
	
	
	lab62_soc u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.button_export(button),
		.xdisp_export(xdisp),
		.ydisp_export(ydisp),
		.i2c_sda_in(i2c_sda_in),
		.i2c_scl_in(i2c_scl_in),
		.i2c_sda_oe(i2c_sda_oe),
		.i2c_scl_oe(i2c_scl_oe)
		
	 );
	 
//provided code for i2c from lecture
assign ARDUINO_IO[3] = aud_mclk_ctr[1];	 //generate 12.5MHz CODEC mclk
always_ff @(posedge MAX10_CLK1_50) begin
	aud_mclk_ctr <= aud_mclk_ctr + 1;
end

assign i2c_scl_in = ARDUINO_IO[15];
assign ARDUINO_IO[15] = i2c_scl_oe ? 1'b0 : 1'bz;

assign i2c_sda_in = ARDUINO_IO[14];
assign ARDUINO_IO[14] = i2c_sda_oe ? 1'b0 : 1'bz;

assign ARDUINO_IO[1] = 1'bz;					//i2s Dout
assign ARDUINO_IO[2] = I2S_Dout;
assign ARDUINO_IO[5] = 1'bz;					//SCLK
assign ARDUINO_IO[4] = 1'bz;					//LRCLK
//provided code for i2c from lecture



//instantiate a vga_controller, ball, and color_mapper here with the ports.

	vga_controller VGA_cont(	.Clk(MAX10_CLK1_50),
										.Reset(Reset_h),
										.hs(VGA_HS),
										.vs(VGA_VS),
										.pixel_clk(VGA_Clk),
										.blank(blank),
										.sync(sync),
										.DrawX(drawxsig),
										.DrawY(drawysig)
										);

	assign vssig = VGA_VS;

	ball     bowl(	.Reset(Reset_h),
						.frame_clk(vssig),
						.BallX(ballxsig),
						.BallY(ballysig),
						.BallS(ballsizesig),
						.xdisp(xdisp),
						.ydisp(ydisp)
						);
						
	counter incrementer (.clk(VGA_Clk), .poweron(poweron), .counter(counter));
	
	
	//sound 
	
	//everything should be coded, the only issue I am facing is with the address counter. I am trying to have the same sample for 64 LRCLK cycles so I only need 256 registers in 1 register file
	//but I can't seem to figure out how to reset it for every change of counter so that it starts at the beginning of the sample. 
	//I also need to figure out how to initialize the register files with the correct .mif from a .wav
	
	//from V
	/*
	We might have an issue in the i2s that is making our audio sound crunchy. The guy I was working with said that we 
	might be able to fix that by implementing the i2s as 2 shift registers. Currently we have it somehwat similar but I don't really understand it fully.
	So the next step in debugging is to make the audio sound better (imo cuz that would get us the most points) and that probably begins with changing
	the i2s module so that we have onshift register output while the other one loads the next sample. Looking at it, the implementation looks very very
	similar but I don't know how we would change it to be different
	*/
	
	
	logic [15:0] IS2_IN;
	logic [14:0] address_k;
	logic [14:0] address_s;
	logic [14:0] address_c;
	logic [14:0] address_hh;
	logic [14:0] address_ohh;
	logic [14:0] address_t1;
	logic [14:0] address_t2;
	logic clock_flag;
	logic I2S_Dout;
	
	logic [15:0] kick_drum;
	logic [15:0] snare ;
	logic [15:0] clap ;
	logic [15:0] hihat;
	logic [15:0] hihatopen;
	logic [15:0] tom1;
	logic [15:0] tom2;
	

   Kick2_rom kick (.clk(ARDUINO_IO[4]), .addr(address_k), .q(kick_drum));
	Snare2_rom s (.clk(ARDUINO_IO[4]), .addr(address_s), .q(snare));
	Clap2_rom c (.clk(ARDUINO_IO[4]), .addr(address_c), .q(clap));
	HiHat3_rom hh (.clk(ARDUINO_IO[4]), .addr(address_hh), .q(hihat));
	HiHatOpen2_rom ohh (.clk(ARDUINO_IO[4]), .addr(address_ohh), .q(hihatopen));
	hightom_rom T1(.clk(ARDUINO_IO[4]), .addr(address_t1), .q(tom1));
	lowtom_rom T2(.clk(ARDUINO_IO[4]), .addr(address_t2), .q(tom2));


	sample_adder  adder(.select({row0[counter], row1[counter], row2[counter], row3[counter], row4[counter], row5[counter], row6[counter]}),
							  .bass_drum(kick_drum),
							  .snare(snare),
							  .clap(clap), 
							  .hihat(hihat), 
							  .cymbal(hihatopen), 
							  .tom1(tom1), 
							  .tom2(tom2),
							  .poweron(poweron),
							  .dout(IS2_IN),
							  .CLK(ARDUINO_IO[4]));
	
	
	I2S I2S_module(.SCLK(ARDUINO_IO[5]),
						.LRCLK(ARDUINO_IO[4]),
						.Din({IS2_IN[15], IS2_IN[15], IS2_IN , 14'b0}), 
						.Dout(I2S_Dout));
						
//						
//	address_counter test (.LRCLK(ARDUINO_IO[4]), .poweron(poweron),
//								 .counter(address_t2));

	address_counter_edit #(8261) kick_add
											(.LRCLK(ARDUINO_IO[4]),
										  .poweron(poweron),
										  .counter(address_k),
										  .beat(counter),
										  .row(row0)
											);
											
	address_counter_edit #(7906) snare_add
											(.LRCLK(ARDUINO_IO[4]),
										  .poweron(poweron),
										  .counter(address_s),
										  .beat(counter),
										  .row(row1)
											);
	address_counter_edit #(2185) clap_add
											(.LRCLK(ARDUINO_IO[4]),
										  .poweron(poweron),
										  .counter(address_c),
										  .beat(counter),
										  .row(row2)
											);
						
	address_counter_edit #(5224) hh_add
											(.LRCLK(ARDUINO_IO[4]),
										  .poweron(poweron),
										  .counter(address_hh),
										  .beat(counter),
										  .row(row3)
											);

	address_counter_edit #(8000) ohh_add
											(.LRCLK(ARDUINO_IO[4]),
										  .poweron(poweron),
										  .counter(address_ohh),
										  .beat(counter),
										  .row(row4)
											);				
		
	address_counter_edit #(5371) t1_add
											(.LRCLK(ARDUINO_IO[4]),
										  .poweron(poweron),
										  .counter(address_t1),
										  .beat(counter),
										  .row(row5)
											);							

	address_counter_edit #(8131) t2_add
											(.LRCLK(ARDUINO_IO[4]),
										  .poweron(poweron),
										  .counter(address_t2),
										  .beat(counter),
										  .row(row6)
											);		
						
						

						
	final_back_2_example 		cat(	.vga_clk(VGA_Clk),
										    	.DrawX(drawxsig), .DrawY(drawysig),
										  	   .blank(blank),
												.counter(counter),
												.red(catRed), .green(catGreen), .blue(catBlue),
												.BallX(ballxsig), .BallY(ballysig), .BallS(ballsizesig), .button(button),
												.row0(row0), .row1(row1), .row2(row2), .row3(row3), .row4(row4), .row5(row5), .row6(row6), 
												.poweron(poweron)
												);
												


endmodule
