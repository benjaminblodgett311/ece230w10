module top
#(
    parameter DIVIDE_BY = 17 // Use this when passing in to your clock div!
    // The test bench will set it appropriately
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);

    clock_div clock (
        .clock(clk),
        .reset(btnC),
        .div_clock(DIVIDE_BY)
    );

    seven_seg_scanner scanner (
        .clock(clk),
        .reset(btnC),
        .anode(an[3:0])
    );

    seven_seg_decoder decode (
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(an[2]),
        .AminusB(an[3]),
        .anode(an[3:0]),
        .segs(seg[6:0])
    );

    math_block mathy (
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(an[2]),
        .AminusB(an[3])
    );

    // Do not forget to wire up resets!!

endmodule