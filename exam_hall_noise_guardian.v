module noise_guardian (
    input  wire       clk,
    input  wire       reset,
    input  wire [3:0] noise_level,

    output reg        quiet,
    output reg        normal,
    output reg        noisy,
    output reg        critical
);

always @(posedge clk or posedge reset) begin

    if (reset) begin
        quiet    <= 1'b0;
        normal   <= 1'b0;
        noisy    <= 1'b0;
        critical <= 1'b0;
    end

    else begin

        quiet    <= 1'b0;
        normal   <= 1'b0;
        noisy    <= 1'b0;
        critical <= 1'b0;

        if (noise_level <= 4'd3)
            quiet <= 1'b1;

        else if (noise_level <= 4'd7)
            normal <= 1'b1;

        else if (noise_level <= 4'd11)
            noisy <= 1'b1;

        else
            critical <= 1'b1;

    end

end

endmodule
