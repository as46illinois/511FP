module R4_mm_test
(
	input logic clk,
	input logic reset,
	
	input logic [31:0] row_sel
);
	logic [31:0] row[3:0];

	magic_mem mm (.*);

	R4_Butterfly_test r4 (.X0r(row[0]), .X1r(row[1]), .X2r(row[2]), .X3r(row[3]), .*);

endmodule