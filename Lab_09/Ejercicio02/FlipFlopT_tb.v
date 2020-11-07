// Marco DUarte
// TestBench
// Ejercicio 02

module testbench();

reg clk, reset, En;
wire Q;

FFT FlipFlop(clk, reset, En, Q);

initial begin 
    #1
    $display("----------------------------------------------");
    $display("|  clk  |  Reset  |  En  |  Q  |");
    $monitor("|  %b  |   %b   |  %b  |  %b  |", clk, reset, En, Q);
    clk = 0; reset = 0; En = 0; 
    #2 reset = 1;
    #2 reset = 0;
    #2 En = 1; 
    #4 En = 0;
    #2 En = 1;
end
    
always
    #1 clk = ~clk;

initial 
    #20 $finish;

initial begin
      $dumpfile("FlipFlopT_tb.vcd");
      $dumpvars(0, testbench);    
end

endmodule
