module reorder_048
(
	input logic clk,
	input logic [31:0] in[63:0],
	output logic [31:0] out[63:0]
);

always @(posedge clk) begin
	for (int i = 0; i < 4; i++) begin
		out[16*i] = in[16*i];
		out[16*i+1] = in[16*i+4];
		out[16*i+2] = in[16*i+8];
		out[16*i+3] = in[16*i+12];

		out[16*i+4] = in[16*i+1];
		out[16*i+5] = in[16*i+5];
		out[16*i+6] = in[16*i+9];
		out[16*i+7] = in[16*i+13];
		
		out[16*i+8] = in[16*i+2];
		out[16*i+9] = in[16*i+6];
		out[16*i+10] = in[16*i+10];
		out[16*i+11] = in[16*i+14];
		
		out[16*i+12] = in[16*i+3];
		out[16*i+13] = in[16*i+7];
		out[16*i+14] = in[16*i+11];
		out[16*i+15] = in[16*i+15];
	end
end

endmodule
