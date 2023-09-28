module power_button_off_rom (
	input logic clock,
	input logic [10:0] address,
	output logic [0:0] q
);

logic [0:0] memory [0:1759] /* synthesis ram_init_file = "./power_button_off/power_button_off.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
