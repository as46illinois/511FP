module w16_rom
(
	output logic [31:0] w16r [63:0],
	output logic [31:0] w16i [63:0]
);

	initial begin
		w16r[0] = 32'h3f800000;
		w16i[0] = 32'h00000000;
		w16r[1] = 32'h3f800000;
		w16i[1] = 32'h00000000;
		w16r[2] = 32'h3f800000;
		w16i[2] = 32'h00000000;
		w16r[3] = 32'h3f800000;
		w16i[3] = 32'h00000000;
		w16r[4] = 32'h3f800000;
		w16i[4] = 32'h00000000;
		w16r[5] = 32'h3f6c835e;
		w16i[5] = 32'hbec3ef15;
		w16r[6] = 32'h3f3504f3;
		w16i[6] = 32'hbf3504f3;
		w16r[7] = 32'h3ec3ef15;
		w16i[7] = 32'hbf6c835e;
		w16r[8] = 32'h3f800000;
		w16i[8] = 32'h00000000;
		w16r[9] = 32'h3f3504f3;
		w16i[9] = 32'hbf3504f3;
		w16r[10] = 32'h248d3132;
		w16i[10] = 32'hbf800000;
		w16r[11] = 32'hbf3504f3;
		w16i[11] = 32'hbf3504f3;
		w16r[12] = 32'h3f800000;
		w16i[12] = 32'h00000000;
		w16r[13] = 32'h3ec3ef15;
		w16i[13] = 32'hbf6c835e;
		w16r[14] = 32'hbf3504f3;
		w16i[14] = 32'hbf3504f3;
		w16r[15] = 32'hbf6c835e;
		w16i[15] = 32'h3ec3ef15;
		w16r[16] = 32'h3f800000;
		w16i[16] = 32'h00000000;
		w16r[17] = 32'h3f800000;
		w16i[17] = 32'h00000000;
		w16r[18] = 32'h3f800000;
		w16i[18] = 32'h00000000;
		w16r[19] = 32'h3f800000;
		w16i[19] = 32'h00000000;
		w16r[20] = 32'h3f800000;
		w16i[20] = 32'h00000000;
		w16r[21] = 32'h3f6c835e;
		w16i[21] = 32'hbec3ef15;
		w16r[22] = 32'h3f3504f3;
		w16i[22] = 32'hbf3504f3;
		w16r[23] = 32'h3ec3ef15;
		w16i[23] = 32'hbf6c835e;
		w16r[24] = 32'h3f800000;
		w16i[24] = 32'h00000000;
		w16r[25] = 32'h3f3504f3;
		w16i[25] = 32'hbf3504f3;
		w16r[26] = 32'h248d3132;
		w16i[26] = 32'hbf800000;
		w16r[27] = 32'hbf3504f3;
		w16i[27] = 32'hbf3504f3;
		w16r[28] = 32'h3f800000;
		w16i[28] = 32'h00000000;
		w16r[29] = 32'h3ec3ef15;
		w16i[29] = 32'hbf6c835e;
		w16r[30] = 32'hbf3504f3;
		w16i[30] = 32'hbf3504f3;
		w16r[31] = 32'hbf6c835e;
		w16i[31] = 32'h3ec3ef15;
		w16r[32] = 32'h3f800000;
		w16i[32] = 32'h00000000;
		w16r[33] = 32'h3f800000;
		w16i[33] = 32'h00000000;
		w16r[34] = 32'h3f800000;
		w16i[34] = 32'h00000000;
		w16r[35] = 32'h3f800000;
		w16i[35] = 32'h00000000;
		w16r[36] = 32'h3f800000;
		w16i[36] = 32'h00000000;
		w16r[37] = 32'h3f6c835e;
		w16i[37] = 32'hbec3ef15;
		w16r[38] = 32'h3f3504f3;
		w16i[38] = 32'hbf3504f3;
		w16r[39] = 32'h3ec3ef15;
		w16i[39] = 32'hbf6c835e;
		w16r[40] = 32'h3f800000;
		w16i[40] = 32'h00000000;
		w16r[41] = 32'h3f3504f3;
		w16i[41] = 32'hbf3504f3;
		w16r[42] = 32'h248d3132;
		w16i[42] = 32'hbf800000;
		w16r[43] = 32'hbf3504f3;
		w16i[43] = 32'hbf3504f3;
		w16r[44] = 32'h3f800000;
		w16i[44] = 32'h00000000;
		w16r[45] = 32'h3ec3ef15;
		w16i[45] = 32'hbf6c835e;
		w16r[46] = 32'hbf3504f3;
		w16i[46] = 32'hbf3504f3;
		w16r[47] = 32'hbf6c835e;
		w16i[47] = 32'h3ec3ef15;
		w16r[48] = 32'h3f800000;
		w16i[48] = 32'h00000000;
		w16r[49] = 32'h3f800000;
		w16i[49] = 32'h00000000;
		w16r[50] = 32'h3f800000;
		w16i[50] = 32'h00000000;
		w16r[51] = 32'h3f800000;
		w16i[51] = 32'h00000000;
		w16r[52] = 32'h3f800000;
		w16i[52] = 32'h00000000;
		w16r[53] = 32'h3f6c835e;
		w16i[53] = 32'hbec3ef15;
		w16r[54] = 32'h3f3504f3;
		w16i[54] = 32'hbf3504f3;
		w16r[55] = 32'h3ec3ef15;
		w16i[55] = 32'hbf6c835e;
		w16r[56] = 32'h3f800000;
		w16i[56] = 32'h00000000;
		w16r[57] = 32'h3f3504f3;
		w16i[57] = 32'hbf3504f3;
		w16r[58] = 32'h248d3132;
		w16i[58] = 32'hbf800000;
		w16r[59] = 32'hbf3504f3;
		w16i[59] = 32'hbf3504f3;
		w16r[60] = 32'h3f800000;
		w16i[60] = 32'h00000000;
		w16r[61] = 32'h3ec3ef15;
		w16i[61] = 32'hbf6c835e;
		w16r[62] = 32'hbf3504f3;
		w16i[62] = 32'hbf3504f3;
		w16r[63] = 32'hbf6c835e;
		w16i[63] = 32'h3ec3ef15;
	end

endmodule
