module counter(
    input clk,
    output reg [1:0] out
);
    always @(posedge clk) //Moore machine
    begin
        case (out)
            2'b00: out <= 2'b01;
            2'b01: out <= 2'b10;
            2'b10: out <= 2'b11;
            2'b11: out <= 2'b00;
        endcase
    end
endmodule

module n_bit_counter(
    input clk,
    input rst,
    output reg [7:0] out
);
    always @(posedge clk)
    begin
        if (!rst || out == 8'b11111111) out <= 8'b00000000;
        else out <= out + 1'b1;
    end
endmodule