`timescale 1ns / 1ps

module xor_gate (
    input A,
    input B,
    output Y
);
    assign Y = (A ^ B);
endmodule

module xor_gate_tb;
    reg A, B;
    wire Y;

   
    xor_gate uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        $dumpfile("xor_wave.vcd"); 
        $dumpvars(0, xor_gate_tb);

        A = 0; B = 0; #0.1;
        A = 0; B = 1; #0.1;
        A = 1; B = 0; #0.1;
        A = 1; B = 1; #0.1;

        $finish;
    end
endmodule
