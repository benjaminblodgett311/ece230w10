module counter(
    input count,
    input reset,
    output reg [7:0] value
);
    
    always @(posedge count, posedge reset) begin
        if (reset) begin
            value <= 'b0;
        end else if (count) begin
            value <= value + 1;
        end
    end
    
endmodule
