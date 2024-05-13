module R4_FFT_test
(
	input logic clk, reset,
    output logic [31:0] Y
);

    // X -> R4 -> I1 -> mult w16 -> I2 -> reorder -> I22 ||| -> R4 -> I3 -> reorder -> I33-> mult w64 -> I4 -> reorder -> I44 ||| -> R4 -> reorder -> Y

    parameter CT = 40;
    logic gated_clk;

    logic [31:0] row_sel;

    logic [31:0] Xr[63:0];
    logic [31:0] Xi[63:0];
	 
	logic [31:0] I2r[63:0];
    logic [31:0] I2i[63:0];

	logic [31:0] I22r[63:0];
    logic [31:0] I22i[63:0];
    
	logic [31:0] I4r[63:0];
    logic [31:0] I4i[63:0];

	logic [31:0] I44r[63:0];
    logic [31:0] I44i[63:0];
	 
    logic [31:0] Yr[63:0];
    logic [31:0] Yi[63:0];
    
    always_comb begin
        for (int i = 0; i < 64; i++) begin
            Xi[i] = 32'h00000000;
        end
        Y = Yr[0];
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            row_sel <= 0;
        end else if (gated_clk) begin
            row_sel <= row_sel + 1;
        end else begin
            row_sel <= row_sel;
        end
    end

    gate #(.MAX(CT)) g (.*);

    magic_mem   mm    (.row_sel(row_sel), .row(Xr), .*);
	 
	 FFT_Stage_1 ffts1 (.Xr(Xr), .Xi(Xi), .Yr(I2r), .Yi(I2i), .*);

    reg128      pipe1 (.dr(I2r), .di(I2i), .qr(I22r), .qi(I22i), .wren(gated_clk), .*);

    FFT_Stage_2 ffts2 (.Xr(I22r), .Xi(I22i), .Yr(I4r), .Yi(I4i), .*);

    reg128      pipe2 (.dr(I4r), .di(I4i), .qr(I44r), .qi(I44i), .wren(gated_clk), .*);

    FFT_Stage_3 ffts3 (.Xr(I44r), .Xi(I44i), .Yr(Yr), .Yi(Yi), .*);

endmodule
