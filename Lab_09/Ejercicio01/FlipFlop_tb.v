// Marco DUarte
// TestBench
// Ejercicio 01

module testbench();

reg clk, reset, En, D;
reg [1:0]D2;
reg [3:0]D4;
wire Q;
wire [1:0]Q2;
wire [3:0]Q4;

FFD_1 FF01(clk, reset, En, D, Q);
FFD_2 FF02(clk, reset, En, D2, Q2);
FFD_4 FF03(clk, reset, En, D4, Q4);


initial begin
    #1
    $display("--------------------------");
    $display("| Clock | Reset | En | D   D2   D4   | Q  Q2  Q4 |");
    $monitor("|   %b  |   %b   |  %b  | %b  %b   %b  | %b  %b  %b  |", clk, reset, En, D, D2, D4, Q, Q2, Q4);
    clk = 0; reset = 0; En = 0; D = 0; D2 = 2'b00; D4 = 4'b0000; 
    #2 reset = 1;
    #2 reset = 0;
    #2 En = 1;
    #2 D = 1; D2 = 2'b01; D4 = 4'b0001;
    #2 D2 = 2'b10; D4 = 4'b0011;
    #2 D2 = 2'b11; D4 = 4'b1100;
    #2 D = 0;
  end
  
   always
    #1  clk = ~clk;
  
  initial 
  #20 $finish;

  initial begin
      $dumpfile("FlipFlop_tb.vcd");
      $dumpvars(0, testbench);
    
  end

endmodule