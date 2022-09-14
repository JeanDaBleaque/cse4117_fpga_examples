module sevenSegment2(
    input [1:0] instruction,
    output reg [6:0] seg1,
    output reg [6:0] seg2
);
    always @(*)
    begin
        case(instruction)
            2'b00: begin
                seg1 = 7'b1011011;
                seg2 = 7'b0011100; 
            end
            2'b01: begin
                seg1 = 7'b1110111;
                seg2 = 7'b0010101;
            end
            2'b10: begin
                seg1 = 7'b1111110;
                seg2 = 7'b0000101;
            end
            2'b11: begin
                seg1 = 7'b0001110;
                seg2 = 7'b0111101;
            end
        endcase
    end
endmodule


module sevenSegment(
    input clk,
    input [7:0] data,
    output reg [6:0] seg1,
    output reg [6:0] seg2,
    output reg [6:0] seg3
);

    reg [7:0] temp;
    reg [3:0] hundreds;
    reg [3:0] tens;
    reg [3:0] ones;

    always @(posedge clk)
    begin
        temp = data;
        if (temp >= 200) begin
            hundreds = 2;
        end
        else if (temp >= 100) begin
            hundreds = 1;
        end
        else begin
            hundreds = 0;
        end

        temp = data - hundreds*100;

        if (temp >= 90) begin
            tens = 9;
        end
        else if (temp >= 80) begin
            tens = 8;
        end
        else if (temp >= 70) begin
            tens = 7;
        end
        else if (temp >= 60) begin
            tens = 6;
        end
        else if (temp >= 50) begin
            tens = 5;
        end
        else if (temp >= 40) begin
            tens = 4;
        end
        else if (temp >= 30) begin
            tens = 3;
        end
        else if (temp >= 20) begin
            tens = 2;
        end
        else if (temp >= 10) begin
            tens = 1;
        end
        else begin
            tens = 0;
        end

        ones = temp - tens*10;
    end

    always @(*)
    begin
        case (hundreds)
            4'b0000: seg1 = 7'b0111111;
            4'b0001: seg1 = 7'b0000110;
            4'b0010: seg1 = 7'b1011011;
            default: seg1 = 7'b0111111;
        endcase

        case (tens)
            4'b0000: seg2 = 7'b0111111;
            4'b0001: seg2 = 7'b0000110;
            4'b0010: seg2 = 7'b1011011;
            4'b0011: seg2 = 7'b1001111;
            4'b0100: seg2 = 7'b1100110;
            4'b0101: seg2 = 7'b1101101;
            4'b0110: seg2 = 7'b1111100;
            4'b0111: seg2 = 7'b0000111;
            4'b1000: seg2 = 7'b1111111;
            4'b1001: seg2 = 7'b1100111;
            default: seg2 = 7'b0111111;
        endcase

        case (ones)
            4'b0000: seg3 = 7'b0111111;
            4'b0001: seg3 = 7'b0000110;
            4'b0010: seg3 = 7'b1011011;
            4'b0011: seg3 = 7'b1001111;
            4'b0100: seg3 = 7'b1100110;
            4'b0101: seg3 = 7'b1101101;
            4'b0110: seg3 = 7'b1111100;
            4'b0111: seg3 = 7'b0000111;
            4'b1000: seg3 = 7'b1111111;
            4'b1001: seg3 = 7'b1100111;
            default: seg3 = 7'b0111111;
        endcase
    end
endmodule