module reorder_01632
(
	input logic clk,
	input logic [31:0] in[63:0],
	
	output logic [31:0] out[63:0]
);

	always @(posedge clk) begin
		for (int i = 0; i < 16; i++) begin
			out[4*i] = in[i];
			out[4*i + 1] = in[i + 16];
			out[4*i + 2] = in[i + 32];
			out[4*i + 3] = in[i + 48];
		end
	end


endmodule
