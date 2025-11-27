module clock_divider #(
    parameter DIVISOR = 25_000_000  // 50MHz / 25M = 2Hz
)(
    input  logic clk_in,
    input  logic reset,
    output logic clk_out
);

    logic [$clog2(DIVISOR)-1:0] counter;

    always_ff @(posedge clk_in or posedge reset) begin
        if (reset)
            counter <= 0;
        else if (counter == DIVISOR-1)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    assign clk_out = (counter < DIVISOR/2);

endmodule
