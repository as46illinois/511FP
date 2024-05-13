module FP_Complex_MULT_16
(
	input logic reset, clk,

	input logic [31:0] a[15:0],
	input logic [31:0] b[15:0],
	input logic [31:0] c[15:0],
	input logic [31:0] d[15:0],
	
	output logic [31:0] q[15:0],
	output logic [31:0] r[15:0]
);

	FP_Complex_MULT FP_MULT0 (.a(a[0]), .b(b[0]), .c(c[0]), .d(d[0]), .q(q[0]), .r(r[0]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT1 (.a(a[1]), .b(b[1]), .c(c[1]), .d(d[1]), .q(q[1]), .r(r[1]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT2 (.a(a[2]), .b(b[2]), .c(c[2]), .d(d[2]), .q(q[2]), .r(r[2]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT3 (.a(a[3]), .b(b[3]), .c(c[3]), .d(d[3]), .q(q[3]), .r(r[3]), .areset(reset), .*);

	FP_Complex_MULT FP_MULT4 (.a(a[4]), .b(b[4]), .c(c[4]), .d(d[4]), .q(q[4]), .r(r[4]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT5 (.a(a[5]), .b(b[5]), .c(c[5]), .d(d[5]), .q(q[5]), .r(r[5]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT6 (.a(a[6]), .b(b[6]), .c(c[6]), .d(d[6]), .q(q[6]), .r(r[6]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT7 (.a(a[7]), .b(b[7]), .c(c[7]), .d(d[7]), .q(q[7]), .r(r[7]), .areset(reset), .*);

	FP_Complex_MULT FP_MULT8 (.a(a[8]), .b(b[8]), .c(c[8]), .d(d[8]), .q(q[8]), .r(r[8]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT9 (.a(a[9]), .b(b[9]), .c(c[9]), .d(d[9]), .q(q[9]), .r(r[9]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT10 (.a(a[10]), .b(b[10]), .c(c[10]), .d(d[10]), .q(q[10]), .r(r[10]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT11 (.a(a[11]), .b(b[11]), .c(c[11]), .d(d[11]), .q(q[11]), .r(r[11]), .areset(reset), .*);

	FP_Complex_MULT FP_MULT12 (.a(a[12]), .b(b[12]), .c(c[12]), .d(d[12]), .q(q[12]), .r(r[12]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT13 (.a(a[13]), .b(b[13]), .c(c[13]), .d(d[13]), .q(q[13]), .r(r[13]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT14 (.a(a[14]), .b(b[14]), .c(c[14]), .d(d[14]), .q(q[14]), .r(r[14]), .areset(reset), .*);
	FP_Complex_MULT FP_MULT15 (.a(a[15]), .b(b[15]), .c(c[15]), .d(d[15]), .q(q[15]), .r(r[15]), .areset(reset), .*);

endmodule