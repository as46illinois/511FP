module R16_mm_test
(
	input logic clk,
	input logic reset,
	
	input logic [31:0] row_sel
);
	logic [31:0] row[15:0];
	
	logic [31:0] zeros[15:0];	
	
	logic [31:0] w16r[15:0];
	logic [31:0] w16i[15:0];
	
	logic [31:0] Yr[15:0];
	logic [31:0] Yi[15:0];
	
	initial begin
		for (int i = 0; i < 16; i++) begin
			zeros[i] <= 32'h00000000;
		end
	end
	
	magic_mem mm (.*);
	w16_rom rom (.*);
	
	R16_Butterfly r16 (.Xr(row),
							 .Xi(zeros), .Wr(w16r), .Wi(w16i), .Yr(Yr), .Yi(Yi), .*);


endmodule
