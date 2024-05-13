`timescale 1ns/1ps

module magic_mem_tb;

	logic clk, reset;
	logic [31:0] row_sel;

	mm_test dut (.*);
	
	initial begin
	
        // Set initial values for inputs
        clk = 0;
        reset = 1;
		  
        // Add delay for reset
        #10;
        reset = 0;
        
        // Apply specific input values
        row_sel = 32'h00000000;

        // Add some delay before observing outputs
        #100;

		  // End simulation
		  $finish;
    end
	
	always #5 clk = ~clk;

endmodule