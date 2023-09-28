module pink_s_o_palette (
	input logic [0:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:1][11:0] palette = {
	{4'hF, 4'hF, 4'hF},
	{4'hD, 4'h2, 4'hB}
};

assign {red, green, blue} = palette[index];

endmodule
