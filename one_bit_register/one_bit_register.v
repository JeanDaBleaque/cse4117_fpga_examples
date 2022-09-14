module one_bit_register(
    input data,
    input store,
    input rst,
    input clk,
    output out
);
    wire t1;
    mux mux1(store, out, data, t1);
    d_Flipflop d_ff1(t1, clk, rst, out); 
endmodule

module d_Flipflop(
    input d,
    input clk,
    input rst,
    output reg q
);
    always @(posedge clk)
    begin
        if (!rst) q <= 1'b0;
        else q <= d;
    end
endmodule

module mux(
    input sel,
    input x,
    input y,
    output reg o
);
    always @(*)
    begin
        case (sel)
            1'b0: o = x;
            1'b1: o = y;
        endcase
    end
endmodule