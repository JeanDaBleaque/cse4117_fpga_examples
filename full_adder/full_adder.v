module full_adder(
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

module full_adder_operators(
    input x,
    input y,
    input cin,
    output o,
    output cout
);
    assign o = (~x & ~y & cin) | (~x & y & ~cin) | (x & y & cin) | (x & ~y & ~cin);
    assign cout = (x & y) | (y & cin) | (x & cin);
endmodule