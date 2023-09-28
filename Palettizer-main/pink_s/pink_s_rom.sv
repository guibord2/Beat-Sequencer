module pink_s_rom (
	input logic clock,
	input logic [10:0] address,
	output logic [0:0] q
);

logic [0:0] memory [0:1224] /* synthesis ram_init_file = "./pink_s/pink_s.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
