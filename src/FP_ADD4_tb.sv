`timescale 1ns/1ps

module FP_ADD4_tb;

	logic clk, reset;
	logic [31:0] dataa, datab, datac, datad;
	logic [31:0] out;

	FP_ADD4 dut (.*);
	
	initial begin
	
        // Set initial values for inputs
        clk = 0;
        reset = 1;
		  
        // Add delay for reset
        #10;
        reset = 0;
        
        // Apply specific input values
        dataa = 32'h00000000;
        datab = 32'h3f800000;
        datac = 32'h40000000;
        datad = 32'h40400000;

        // Add some delay before observing outputs
        #100;

        // Display output
        $display("Output: %d", out);

		  // End simulation
		  $finish;
    end
	
	always #5 clk = ~clk;

endmodule