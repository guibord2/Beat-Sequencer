/* File generated by helper script from https://github.com/zaydabudayyeh/wave_generator
for use with ECE385 course at the University of Illinois at Urbana Champaign */

module HiHat_rom(
input clk,
input [13:0] addr,
output logic [15:0] q
);

logic [15:0] rom [9306];
always_ff @(posedge clk) begin
	q <= rom[addr];
end
initial begin $readmemh("HiHat.txt", rom); end
endmodule