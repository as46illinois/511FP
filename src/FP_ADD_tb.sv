`timescale 1ns/1ps

module FP_ADD_tb;

	logic clk, reset;
	logic [31:0] a, b;
	logic [31:0] q;

	FP_ADD dut (.areset(reset), .*);
	
	initial begin
	
        // Set initial values for inputs
        clk = 0;
        reset = 1;
		  
        // Add delay for reset
        #10;
        reset = 0;
        
        // Apply specific input values
        a = 32'h00000000;
        b = 32'h3f800000;

        // Add some delay before observing outputs
        #1000;

        // Display output
        $display("Output: %d", q);

		  // End simulation
		  $finish;
    end
	
	always #5 clk = ~clk;

endmodule