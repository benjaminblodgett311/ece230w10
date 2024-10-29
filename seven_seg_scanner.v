module seven_seg_scanner(
    input div_clock,
    input reset,
    output reg [3:0] anode
);

    reg [1:0] count; 

    always @(reset, anode) begin
        if (reset) begin
            count = 2'b00; //assigns count to a zero literal
            anode = 4'b1111; //all anodes are off
        end else begin
            count = count + 1; //adds one to counter
            case (count)
            2'b00: anode = 4'b1110; // anode0
            2'b01: anode = 4'b1101;// anode1
            2'b10: anode = 4'b1011; // anode2
            2'b11: anode = 4'b0111; // anode3
            endcase
        end
    end
    

endmodule
    // This block should count through from zero to three, and only activate one
    // anode at a time in the seven segment displays. Keep in mind THEY ARE
    // INVERSE DRIVE, that is that 0 is on 1 is off

    // The reset line should set things back to segment 0

    // Anodes are:
    // 0: R
    // 1: RC
    // 2: LC
    // 3: L

