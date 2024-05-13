module reg128
(
    input logic clk, reset,
    input logic wren,

    input logic [31:0] dr[63:0],
    input logic [31:0] di[63:0],
    
    output logic [31:0] qi[63:0],
    output logic [31:0] qr[63:0]
);

    logic [31:0] qi_next [63:0];
    logic [31:0] qr_next [63:0];

    always_ff @( clk ) begin
        qr <= qr_next;
        qi <= qi_next;
    end

    always_comb begin
        if (reset) begin
            for (int i = 0; i < 64; i++) begin
                qr_next[i] = 32'h00000000;
                qi_next[i] = 32'h00000000;
            end
        end else if (wren) begin
            qr_next = dr;
            qi_next = di;
        end else begin
            qr_next = qr;
            qi_next = qi;
        end
    end

endmodule
