module mm_test
(
	input logic clk, reset,
	input logic [31:0] row_sel
);

	logic [31:0] row[63:0];
	
	magic_mem mm(.*);

endmodule
