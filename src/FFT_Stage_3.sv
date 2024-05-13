// Compute last batch of R4 butterflys, final reorder
module FFT_Stage_3
(
	input logic clk, reset, // Ctrl signals
	
	// Input image row/col
	input logic [31:0] Xr[63:0], // real component
	input logic [31:0] Xi[63:0], // j component
	
	// Output
	output logic [31:0] Yr[63:0],
	output logic [31:0] Yi[63:0]
);

    // X -> R4 -> I1 -> reorder -> Y

	// Intermediate values
	logic [31:0] I1r[63:0]; // real component
	logic [31:0] I1i[63:0]; // j component

    // X -> R4 -> I1
    R64_Butterfly R64 (.Xr(Xr), .Xi(Xi), .Yr(I1r), .Yi(I1i), .*);

    // I1 -> reorder -> Y
    always_comb begin
        for (int i=0; i<16; i++) begin
            Yr[i]      = I1r[i*4];
            Yr[16 + i] = I1r[i*4 + 1];
            Yr[32 + i] = I1r[i*4 + 2];
            Yr[48 + i] = I1r[i*4 + 3];
            Yi[i]      = I1i[i*4];
            Yi[16 + i] = I1i[i*4 + 1];
            Yi[32 + i] = I1i[i*4 + 2];
            Yi[48 + i] = I1i[i*4 + 3];
        end
    end

endmodule
