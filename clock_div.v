module div(
    input clock,
    input reset,
    output reg div_clock  //original until here
);
    reg intreset;
    wire [16:0] intcount;

    counter #(.WIDTH(17)) count(
        .clock(clock),
        .reset(intreset),
        .count(intcount)
    );
    
    always @(reset, intcount) begin
        if (reset) begin
            intreset = 1;
            div_clock = 0;
        end else if (intcount == 100000) begin
            intreset = 1;
            div_clock = ~div_clock;
        end else begin
            intreset = 0;
        end
        
    end

endmodule