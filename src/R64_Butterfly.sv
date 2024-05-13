module R64_Butterfly
(
	input logic clk, reset,
	
	// Input 64-32-bit floating points
	input logic [31:0] Xr[63:0],
	input logic [31:0] Xi[63:0],
	
	// Output 64 32-bit floating points
	output logic [31:0] Yr[63:0],
	output logic [31:0] Yi[63:0]
);

	
	genvar i;
	generate
		for (i = 0; i < 16; i=i+1) begin: generate_block_identifier
			R4_Butterfly R4 (.X0r(Xr[i * 4]), .X1r(Xr[i * 4 + 1]), .X2r(Xr[i * 4 + 2]), .X3r(Xr[i * 4 + 3]),
								  .X0i(Xi[i * 4]), .X1i(Xi[i * 4 + 1]), .X2i(Xi[i * 4 + 2]), .X3i(Xi[i * 4 + 3]),
								  .Y0r(Yr[i * 4]), .Y1r(Yr[i * 4 + 1]), .Y2r(Yr[i * 4 + 2]), .Y3r(Yr[i * 4 + 3]),
								  .Y0i(Yi[i * 4]), .Y1i(Yi[i * 4 + 1]), .Y2i(Yi[i * 4 + 2]), .Y3i(Yi[i * 4 + 3]),
								  .clk(clk), .reset(reset));
		end
	endgenerate

endmodule
