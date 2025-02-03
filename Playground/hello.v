// dff_tb.v
module dff (
    input d,
    input rstn,
    input clk,
    output reg q
);

    always @ (posedge clk) begin
        if (!rstn)
            q <= 0;
        else
            q <= d;
    end
endmodule

module top;
    reg d;
    reg rstn;
    reg clk;
    wire q;

    dff my_dff (
        .d(d),
        .rstn(rstn),
        .clk(clk),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock 10t
    end

    initial begin
    
        rstn = 0;
        d = 1;
        #10;

        rstn = 1;
        #10;

        d = 0;
        #10;

        d = 1;
        #10;

        $finish;
    end

    // Gera um arquivo VCD para visualização no GTKWave
    initial begin
        $dumpfile("waveform.vcd"); // out
        $dumpvars(0, top);        // save all top
    end
endmodule