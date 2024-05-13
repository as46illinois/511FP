module R4_Butterfly_test
(
	input logic clk,
	input logic reset,
	
	// Real inputs
	input logic [31:0] X0r,
	input logic [31:0] X1r,
	input logic [31:0] X2r,
	input logic [31:0] X3r
);

	logic [31:0] zero;
	assign zero = 32'h00000000;

	logic [31:0] nX1r, nX1i, nX2r, nX2i, nX3r, nX3i;
	
	// Imaginary outputs
	logic [31:0] Y0i;
	logic [31:0] Y1i;
	logic [31:0] Y2i;
	logic [31:0] Y3i;
	// Real outputs
	logic [31:0] Y0r;
	logic [31:0] Y1r;
	logic [31:0] Y2r;
	logic [31:0] Y3r;
	
	
	assign nX1r = {~X1r[31],X1r[30:0]};
	//assign nX1i = {~X1i[31],X1i[30:0]};
	assign nX2r = {~X2r[31],X2r[30:0]};
	//assign nX2i = {~X2i[31],X2i[30:0]};
	assign nX3r = {~X3r[31],X3r[30:0]};
	//assign nX3i = {~X3i[31],X3i[30:0]};
	
	
	// Y0r = X0r + X1r + X2r + X3r
	FP_ADD4 add0 (.dataa(X0r), .datab(X1r), .datac(X2r), .datad(X3r), .out(Y0r), .*);
	// Y0i = X0i + X1i + X2i + X3i
	FP_ADD4 add1 (.dataa(zero), .datab(zero), .datac(zero), .datad(zero), .out(Y0i), .*);

	// Y1r = X0r + X1i - X2r - X3i
	FP_ADD4 add2 (.dataa(X0r), .datab(zero), .datac(nX2r), .datad(zero), .out(Y1r), .*);
	// Y1i = X0i - X1r - X2i + X3r
	FP_ADD4 add3 (.dataa(zero), .datab(nX1r), .datac(zero), .datad(X3r), .out(Y1i), .*);

	// Y2r = X0r - X1r + X2r - X3r
	FP_ADD4 add4 (.dataa(X0r), .datab(nX1r), .datac(X2r), .datad(nX3r), .out(Y2r), .*);
	// Y2i = X0i - X1i + X2i - X3i
	FP_ADD4 add5 (.dataa(X0r), .datab(zero), .datac(zero), .datad(zero), .out(Y2i), .*);
	
	// Y3r = X0r - X1i - X2r + X3i
	FP_ADD4 add6 (.dataa(X0r), .datab(zero), .datac(nX2r), .datad(zero), .out(Y3r), .*);
	// Y3i = X0i + X1r - X2i - X3r
	FP_ADD4 add7 (.dataa(zero), .datab(X1r), .datac(zero), .datad(nX3r), .out(Y3i), .*);

endmodule
