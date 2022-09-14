module eight_bit_full_adder(
    input [7:0] x,
    input [7:0] y,
    output [7:0] o,
    output carryout
);
    wire cout1, cout2, cout3, cout4, cout5, cout6, cout7;
    one_bit_adder(x[0], y[0], 1'b0, o[0], cout1);
    one_bit_adder(x[1], y[1], cout1, o[1], cout2);
    one_bit_adder(x[2], y[2], cout2, o[2], cout3);
    one_bit_adder(x[3], y[3], cout3, o[3], cout4);
    one_bit_adder(x[4], y[4], cout4, o[4], cout5);
    one_bit_adder(x[5], y[5], cout5, o[5], cout6);
    one_bit_adder(x[6], y[6], cout6, o[6], cout7);
    one_bit_adder(x[7], y[7], cout7, o[7], carryout);
endmodule

module one_bit_adder(
    input x,
    input y,
    input cin,
    output o,
    output cout
);
    wire t1, t2, t3;
    xor(t1, x, y);
    xor(o, t1, cin);
    and(t2, x, y);
    and(t3, t1, cin);
    or(cout, t2, t3);
endmodule