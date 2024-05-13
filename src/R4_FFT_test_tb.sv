`timescale 1ns/1ps

module R4_FFT_test_tb;

	logic clk, reset, gated_clk;
    logic [31:0] Y;

	R4_FFT_test dut (.*);
	
	initial begin
	
        // Set initial values for inputs
        clk = 0;
        gated_clk = 0;
        reset = 1;
		  
        // Add delay for reset
        #150;
        reset = 0;

        // Add some delay before observing outputs
        #10000;

		  // End simulation
		  $finish;
    end
	
	always #5 clk = ~clk;
	always #150 clk = ~clk;


endmodule