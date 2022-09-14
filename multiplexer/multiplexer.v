module multiplexer( //Four to one
    input [1:0] s,
    input [3:0] x,
    output o
);
    wire t1, t2;
    two_to_one_multiplexer(s[0], x[0], x[1], t1);
    two_to_one_multiplexer(s[0], x[2], x[3], t2);
    two_to_one_multiplexer(s[1], t1, t2, o);
endmodule

module two_to_one_multiplexer(
    input s,
    input x,
    input y,
    output o
);
    wire t1, t2;
    and(t1, s, y);
    and(t2, ~s, x);
    or(o, t1, t2);
endmodule