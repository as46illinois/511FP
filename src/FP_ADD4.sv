module FP_ADD4
(
	input logic clk,
	input logic reset,

	input logic [31:0] dataa,
	input logic [31:0] datab,
	input logic [31:0] datac,
	input logic [31:0] datad,

	output logic [31:0] out
);

	logic [31:0] dataab, datacd;
	
	FP_ADD add1 (.a(dataa), .b(datab), .q(dataab), .areset(reset), .clk(clk));
	FP_ADD add2 (.a(datac), .b(datad), .q(datacd), .areset(reset), .clk(clk));
	FP_ADD add3 (.a(dataab), .b(datacd), .q(out), .areset(reset), .clk(clk));

endmodule