module rom(
    input [2:0] addr,
    output reg [11:0] data
);
    always @(*)
    begin
        case (addr)
            3'b000: data = 12'b000000000000;
            3'b001: data = 12'b000000000001;
            3'b010: data = 12'b000000000010;
            3'b011: data = 12'b000000000011;
            3'b100: data = 12'b000000000100;
            3'b101: data = 12'b000000000101;
            3'b110: data = 12'b000000000110;
            3'b111: data = 12'b000000000111;
        endcase
    end
endmodule