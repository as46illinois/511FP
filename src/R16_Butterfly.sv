module R16_Butterfly
(
	input logic clk,
	input logic reset,
	
	// Input 64 32-bit floating points
	input logic [31:0] Xr[15:0], // real component
	input logic [31:0] Xi[15:0], // j component
	
	// Input twiddle factors
	input logic [31:0] Wr[15:0],
	input logic [31:0] Wi[15:0],
	
	// Output 64 32-bit floating points
	output logic [31:0] Yr[15:0], // real component
	output logic [31:0] Yi[15:0]  // j component
);

	// intermediate solution pre-twiddle
	logic [31:0] Ir [15:0];
	logic [31:0] Ii [15:0];
	
	// intermediate solution post-twiddle
	logic [31:0] IWr [15:0];
	logic [31:0] IWi [15:0];
	
	// Perform first round of radix-4s

	R4_Butterfly R0 (.X0r(Xr[0]), .X1r(Xr[4]), .X2r(Xr[8]), .X3r(Xr[12]), .X0i(Xi[0]), .X1i(Xi[4]), .X2i(Xi[8]), .X3i(Xi[12]), // inputs
						  .Y0r(Ir[0]), .Y1r(Ir[1]), .Y2r(Ir[2]), .Y3r(Ir[3]), .Y0i(Ii[0]), .Y1i(Ii[1]), .Y2i(Ii[2]), .Y3i(Ii[3]), // outputs
						  .*);

	R4_Butterfly R1 (.X0r(Xr[1]), .X1r(Xr[5]), .X2r(Xr[9]), .X3r(Xr[13]), .X0i(Xi[1]), .X1i(Xi[5]), .X2i(Xi[9]), .X3i(Xi[13]), // inputs
						  .Y0r(Ir[4]), .Y1r(Ir[5]), .Y2r(Ir[6]), .Y3r(Ir[7]), .Y0i(Ii[4]), .Y1i(Ii[5]), .Y2i(Ii[6]), .Y3i(Ii[7]), // outputs
						  .*);
						  
	R4_Butterfly R2 (.X0r(Xr[2]), .X1r(Xr[6]), .X2r(Xr[10]), .X3r(Xr[14]), .X0i(Xi[2]), .X1i(Xi[6]), .X2i(Xi[10]), .X3i(Xi[14]), // inputs
						  .Y0r(Ir[8]), .Y1r(Ir[9]), .Y2r(Ir[10]), .Y3r(Ir[11]), .Y0i(Ii[8]), .Y1i(Ii[9]), .Y2i(Ii[10]), .Y3i(Ii[11]), // outputs
						  .*);
						  
	R4_Butterfly R3 (.X0r(Xr[3]), .X1r(Xr[7]), .X2r(Xr[11]), .X3r(Xr[15]), .X0i(Xi[3]), .X1i(Xi[7]), .X2i(Xi[11]), .X3i(Xi[15]), // inputs
						  .Y0r(Ir[12]), .Y1r(Ir[13]), .Y2r(Ir[14]), .Y3r(Ir[15]), .Y0i(Ii[12]), .Y1i(Ii[13]), .Y2i(Ii[14]), .Y3i(Ii[15]), // outputs
						  .*);
						  
						  
	// Multiply against twiddle factors
	
	FP_Complex_MULT_16 MULT (.a(Ir), .b(Ii), .c(Wr), .d(Wi), .q(IWr), .r(IWi), .*);
	
	
	// Perform second round of radix-4s
						  
	R4_Butterfly R4 (.X0r(IWr[0]), .X1r(IWr[4]), .X2r(IWr[8]), .X3r(IWr[12]), .X0i(IWi[0]), .X1i(IWi[4]), .X2i(IWi[8]), .X3i(IWi[12]), // inputs
						  .Y0r(Yr[0]), .Y1r(Yr[4]), .Y2r(Yr[8]), .Y3r(Yr[12]), .Y0i(Yi[0]), .Y1i(Yi[4]), .Y2i(Yi[8]), .Y3i(Yi[12]), // outputs
						  .*);
						  
	R4_Butterfly R5 (.X0r(IWr[1]), .X1r(IWr[5]), .X2r(IWr[9]), .X3r(IWr[13]), .X0i(IWi[1]), .X1i(IWi[5]), .X2i(IWi[9]), .X3i(IWi[13]), // inputs
						  .Y0r(Yr[1]), .Y1r(Yr[5]), .Y2r(Yr[9]), .Y3r(Yr[13]), .Y0i(Yi[1]), .Y1i(Yi[5]), .Y2i(Yi[9]), .Y3i(Yi[13]), // outputs
						  .*);	
						  
	R4_Butterfly R6 (.X0r(IWr[2]), .X1r(IWr[6]), .X2r(IWr[10]), .X3r(IWr[14]), .X0i(IWi[2]), .X1i(IWi[6]), .X2i(IWi[10]), .X3i(IWi[14]), // inputs
						  .Y0r(Yr[2]), .Y1r(Yr[6]), .Y2r(Yr[10]), .Y3r(Yr[14]), .Y0i(Yi[2]), .Y1i(Yi[6]), .Y2i(Yi[10]), .Y3i(Yi[14]), // outputs
						  .*);
						  
	R4_Butterfly R7 (.X0r(IWr[3]), .X1r(IWr[7]), .X2r(IWr[11]), .X3r(IWr[15]), .X0i(IWi[3]), .X1i(IWi[7]), .X2i(IWi[11]), .X3i(IWi[15]), // inputs
						  .Y0r(Yr[3]), .Y1r(Yr[7]), .Y2r(Yr[11]), .Y3r(Yr[15]), .Y0i(Yi[3]), .Y1i(Yi[7]), .Y2i(Yi[11]), .Y3i(Yi[15]), // outputs
						  .*);
endmodule
