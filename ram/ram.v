module ram(
    input clk,
    input rst,
    input readWrite,
    input cs,
    input [1:0] addr,
    input [7:0] dataIn,
    output reg [7:0] dataOut
);
    wire [3:0] tempRst;
    wire [3:0] tempWrite;
    decoder decoderRst(addr, tempRst);
    decoder decoderWrite(addr, tempWrite);
    wire [7:0] tempRegOut1, tempRegOut2, tempRegOut3, tempRegOut4;
    eightBitRegister addr1(clk, ~tempRst[0] | rst, tempWrite[0] & readWrite, dataIn, tempRegOut1);
    eightBitRegister addr2(clk, ~tempRst[1] | rst, tempWrite[1] & readWrite, dataIn, tempRegOut2);
    eightBitRegister addr3(clk, ~tempRst[2] | rst, tempWrite[2] & readWrite, dataIn, tempRegOut3);
    eightBitRegister addr4(clk, ~tempRst[3] | rst, tempWrite[3] & readWrite, dataIn, tempRegOut4);
    always @(*)
    begin
        if (!cs) dataOut <= 8'b00000000;
        else begin
            case (addr)
                2'b00: dataOut = tempRegOut1;
                2'b01: dataOut = tempRegOut2;
                2'b10: dataOut = tempRegOut3;
                2'b11: dataOut = tempRegOut4;
            endcase
        end
    end
endmodule

module decoder(
    input [1:0] addr,
    output reg [3:0] out 
);
    always @(*)
    begin
        case (addr)
            2'b00: out = 4'b0001;
            2'b01: out = 4'b0010;
            2'b10: out = 4'b0100;
            2'b11: out = 4'b1000;
        endcase
    end
endmodule

module eightBitRegister(
    input clk,
    input rst,
    input readWrite,
    input [7:0] dataIn,
    output [7:0] dataOut
);
    binaryCell cells [7:0] (clk, rst, readWrite, dataIn, dataOut);
endmodule

module binaryCell(
    input clk,
    input rst,
    input readWrite,
    input data,
    output out
);
    reg tempDFF;
    d_Flipflop d_ff1(clk, rst, tempDFF, out);
    always @(*)
    begin
        case (readWrite)
            1'b0: tempDFF = out;
            1'b1: tempDFF = data;
        endcase    
    end
endmodule

module d_Flipflop(
    input clk,
    input rst,
    input d,
    output reg q
);
    always @(posedge clk)
    begin
        if (!rst) q <= 1'b0;
        else q <= d;
    end
endmodule