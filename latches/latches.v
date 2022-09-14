module latches(
    input [1:0] sel,
    input [3:0] x,
    output reg out
);
    always @(*)
    begin
        case (sel)
            2'b00: out = x[0];
            2'b01: out = x[1];
            2'b10: out = x[2];
            2'b11: out = x[3]; //Clear this line to create unwanted latch
        endcase
    end
endmodule