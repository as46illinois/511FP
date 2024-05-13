module gate #(
    parameter MAX
)
(
    input logic clk, reset,
    output logic gated_clk
);

    logic [31:0] counter;

    always_ff @(posedge clk) begin
        if (reset) begin
            gated_clk <= 0;
            counter <= 0;
        end else if (counter < MAX) begin
            gated_clk <= 0;
            counter <= counter + 1;
        end else begin
            gated_clk <= 1;
            counter <= 0;
        end
    end

endmodule
