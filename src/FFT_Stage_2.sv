// Compute second batch of R4 butterflys, 04812 reorder, W64 multiplication, and 0163248 reorder
module FFT_Stage_2
(
	input logic clk, reset, // Ctrl signals
	
	// Input image row/col
	input logic [31:0] Xr[63:0], // real component
	input logic [31:0] Xi[63:0], // j component
	
	// Output
	output logic [31:0] Yr[63:0],
	output logic [31:0] Yi[63:0]
);

    // X -> R4 -> I1 -> reorder -> I2 -> mult w64 -> I3 -> reorder -> Y

	// Intermediate values
	logic [31:0] I1r[63:0]; // real component
	logic [31:0] I1i[63:0]; // j component
	
	logic [31:0] I2r[63:0];
	logic [31:0] I2i[63:0];

	logic [31:0] I3r[63:0];
	logic [31:0] I3i[63:0];

	// Twiddle factors
	logic [31:0] w64r[63:0]; // real component
	logic [31:0] w64i[63:0]; // j component

    // Read twiddle factors
    w64_rom w64(.*);

    // X -> R4 -> I1
    R64_Butterfly R64 (.Xr(Xr), .Xi(Xi), .Yr(I1r), .Yi(I1i), .*);

    // I1 -> reorder 04812 -> I2
	always_comb begin
		for (int i=0; i<4; i++) begin
		I2r[16*i]    = I1r[16*i];
		I2r[16*i+ 1] = I1r[16*i+4];
		I2r[16*i+ 2] = I1r[16*i+8];
		I2r[16*i+ 3] = I1r[16*i+12];

		I2r[16*i+ 4] = I1r[16*i+1];
		I2r[16*i+ 5] = I1r[16*i+5];
		I2r[16*i+ 6] = I1r[16*i+9];
		I2r[16*i+ 7] = I1r[16*i+13];
		
		I2r[16*i+ 8] = I1r[16*i+2];
		I2r[16*i+ 9] = I1r[16*i+6];
		I2r[16*i+10] = I1r[16*i+10];
		I2r[16*i+11] = I1r[16*i+14];
		
		I2r[16*i+12] = I1r[16*i+3];
		I2r[16*i+13] = I1r[16*i+7];
		I2r[16*i+14] = I1r[16*i+11];
		I2r[16*i+15] = I1r[16*i+15];
		
		I2i[16*i]    = I1i[16*i];
		I2i[16*i+ 1] = I1i[16*i+4];
		I2i[16*i+ 2] = I1i[16*i+8];
		I2i[16*i+ 3] = I1i[16*i+12];

		I2i[16*i+ 4] = I1i[16*i+1];
		I2i[16*i+ 5] = I1i[16*i+5];
		I2i[16*i+ 6] = I1i[16*i+9];
		I2i[16*i+ 7] = I1i[16*i+13];
		
		I2i[16*i+ 8] = I1i[16*i+2];
		I2i[16*i+ 9] = I1i[16*i+6];
		I2i[16*i+10] = I1i[16*i+10];
		I2i[16*i+11] = I1i[16*i+14];
		
		I2i[16*i+12] = I1i[16*i+3];
		I2i[16*i+13] = I1i[16*i+7];
		I2i[16*i+14] = I1i[16*i+11];
		I2i[16*i+15] = I1i[16*i+15];
		end
	end

    // I2 -> mult w64 -> I3
    FP_Complex_MULT_64 MULT (.a(I2r), .b(I2i), .c(w64r), .d(w64i), .q(I3r), .r(I3i), .*);

    // I3 -> reorder 0163248 -> Y
    always_comb begin
		for (int i = 0; i < 16; i++) begin
			Yr[4*i]     = I3r[i];
			Yr[4*i + 1] = I3r[i + 16];
			Yr[4*i + 2] = I3r[i + 32];
			Yr[4*i + 3] = I3r[i + 48];
			Yi[4*i]     = I3i[i];
			Yi[4*i + 1] = I3i[i + 16];
			Yi[4*i + 2] = I3i[i + 32];
			Yi[4*i + 3] = I3i[i + 48];
		end
	end

endmodule
