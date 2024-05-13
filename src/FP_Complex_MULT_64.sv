module FP_Complex_MULT_64
(
	input logic clk, reset,
	
	// (a + jd) * (c + jd) = q + jr
	input logic [31:0] a[63:0],
	input logic [31:0] b[63:0],
	input logic [31:0] c[63:0],
	input logic [31:0] d[63:0],
	
	output logic [31:0] q[63:0],
	output logic [31:0] r[63:0]
	
);

	genvar i;
	generate
		for (i = 0; i < 64; i=i+1) begin: generate_mult_identifier
			FP_Complex_MULT MULT (.a(a[i]), .b(b[i]), .c(c[i]), .d(d[i]), .q(q[i]), .r(r[i]), .areset(reset), .clk(clk));
		end
	endgenerate

endmodule
