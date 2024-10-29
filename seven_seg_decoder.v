module seven_seg_decoder(
    input [3:0] A,
    input [3:0] B,
    input [3:0] AplusB,
    input [3:0] AminusB,
    input [3:0] anode,
    output reg [6:0] segs
);
    reg [3:0] selected_sig; 

       always @(*) begin
       case (anode)
          4'b1110: selected_sig = A;
          4'b1101: selected_sig = B;
          4'b1011: selected_sig = AplusB;
          4'b0111: selected_sig = AminusB;
          default: selected_sig = 4'b0000;
       endcase
    end

    always @(*) begin
        case(selected_sig)
            
            4'b0000: segs = 7'b1000000;        
            4'b0001: segs = 7'b1111001;        
            4'b0010: segs = 7'b0100100;        
            4'b0011: segs =  7'b0110000;        
            4'b0100: segs =  7'b0011001;        
            4'b0101: segs = 7'b0010010;        
            4'b0110: segs =  7'b0000010;        
            4'b0111: segs =  7'b1111000;        
            4'b1000: segs = 7'b0000000;
            4'b1001: segs = 7'b0010000;        
            4'b1010: segs = 7'b0001000;        
            4'b1011: segs = 7'b0000011;        
            4'b1100: segs = 7'b1000110;        
            4'b1101: segs =  7'b0100001;        
            4'b1110: segs =  7'b0000110;        
            4'b1111: segs =  7'b0001110;  
            default: segs = 7'b1111111;     
        endcase
    end

endmodule