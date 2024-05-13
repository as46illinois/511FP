// Compute first batch of R4 butterflys, W16 multiplication, and 04812 reorder
module FFT_Stage_1
(
	input logic clk, reset, // Ctrl signals
	
	// Input image row/col
	input logic [31:0] Xr[63:0], // real component
	input logic [31:0] Xi[63:0], // j component
	
	// Output
	output logic [31:0] Yr[63:0],
	output logic [31:0] Yi[63:0]
);

	// X -> R4 -> I1 -> mult w16 -> I2 -> reorder -> Y 
	
	// Intermediate values
	logic [31:0] I1r[63:0]; // real component
	logic [31:0] I1i[63:0]; // j component
	
	logic [31:0] I2r[63:0];
	logic [31:0] I2i[63:0];
	
	// Twiddle factors
	logic [31:0] w16r[63:0]; // real component
	logic [31:0] w16i[63:0]; // j component
	
	// Read twiddle factors
	w16_rom w16(.*);

	// X -> R4 -> I1
	R64_Butterfly R64 (.Xr(Xr), .Xi(Xi), .Yr(I1r), .Yi(I1i), .*);
	
	// I1 -> mult w16 -> I2
	FP_Complex_MULT_64 MULT (.a(I1r), .b(I1i), .c(w16r), .d(w16i), .q(I2r), .r(I2i), .*);
	
	// I2 -> reorder 04812 -> Y
	always_comb begin
		for (int i=0; i<4; i++) begin
		Yr[16*i]    = I2r[16*i];
		Yr[16*i+ 1] = I2r[16*i+4];
		Yr[16*i+ 2] = I2r[16*i+8];
		Yr[16*i+ 3] = I2r[16*i+12];

		Yr[16*i+ 4] = I2r[16*i+1];
		Yr[16*i+ 5] = I2r[16*i+5];
		Yr[16*i+ 6] = I2r[16*i+9];
		Yr[16*i+ 7] = I2r[16*i+13];
		
		Yr[16*i+ 8] = I2r[16*i+2];
		Yr[16*i+ 9] = I2r[16*i+6];
		Yr[16*i+10] = I2r[16*i+10];
		Yr[16*i+11] = I2r[16*i+14];
		
		Yr[16*i+12] = I2r[16*i+3];
		Yr[16*i+13] = I2r[16*i+7];
		Yr[16*i+14] = I2r[16*i+11];
		Yr[16*i+15] = I2r[16*i+15];
		
		Yi[16*i]    = I2i[16*i];
		Yi[16*i+ 1] = I2i[16*i+4];
		Yi[16*i+ 2] = I2i[16*i+8];
		Yi[16*i+ 3] = I2i[16*i+12];

		Yi[16*i+ 4] = I2i[16*i+1];
		Yi[16*i+ 5] = I2i[16*i+5];
		Yi[16*i+ 6] = I2i[16*i+9];
		Yi[16*i+ 7] = I2i[16*i+13];
		
		Yi[16*i+ 8] = I2i[16*i+2];
		Yi[16*i+ 9] = I2i[16*i+6];
		Yi[16*i+10] = I2i[16*i+10];
		Yi[16*i+11] = I2i[16*i+14];
		
		Yi[16*i+12] = I2i[16*i+3];
		Yi[16*i+13] = I2i[16*i+7];
		Yi[16*i+14] = I2i[16*i+11];
		Yi[16*i+15] = I2i[16*i+15];
		end
	end
	
endmodule
