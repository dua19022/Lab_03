// Marco Duarte
// TestBench
// Ejercicio 03

module testbench();

reg clk, reset, En, J, K;
wire Q;

FFJK FlipFlopJK(clk, reset, En, J, K, Q);

initial begin
    #1
    $display("----------------------------------");
    $display("| Clock | Reset | En | J | K | Q |");
    $monitor("|   %b   |   %b   |  %b | %b | %b | %b |", clk, reset, En, J, K, Q);
    clk = 0; reset = 0; En = 0; J = 0; K = 0;
    #2 reset = 0;
    #2 reset = 1;
    #2 reset = 0;
    #2 En = 1; J = 1;
    #2 En = 0;
    #2 En = 1; J = 0;
    #2 K = 1;
    #2 J = 1; K = 0;
    #2 K = 1;
end

always
    #1 clk = ~clk;

initial
    #25 $finish;

initial begin
    $dumpfile("FlipFlopJK_tb.vcd");
    $dumpvars(0, testbench);   
end

endmodule