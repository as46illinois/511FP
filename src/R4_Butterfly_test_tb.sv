`timescale 1ns/1ps

module R4_Butterfly_test_tb;

	logic clk, reset;
	logic [31:0] dataa, datab, datac, datad;

	R4_Butterfly_test dut (.X0r(dataa), .X1r(datab), .X2r(datac), .X3r(datad), .clk(clk), .reset(reset));
	
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

		  // End simulation
		  $finish;
    end
	
	always #5 clk = ~clk;

endmodule