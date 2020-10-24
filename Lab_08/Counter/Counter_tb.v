// Marco Darte
// TestBench del contador de 12 bits
// Digital 1
// ----------------------------------------

module testbench();

reg Clk, reset, En, non;
reg [11:0]load;
wire [11:0]exit;

// Llamo a los modulos
counter12 C00(Clk, reset, En, non, load, exit);

// Se crea un clock
always
    #1 Clk = ~Clk;

initial begin
    #1
    $display("---------------------------------");
    $display("Clock | Reset | Enable | Non-Blocking | Load | Exit");
    $monitor("  %b      %b      %b          %b         %b      %b", Clk, reset, En, non, load, exit);
    Clk = 0; reset = 0; En = 0; non = 0; load = 12'b000000000000;
    #1 reset = 0;
    #1 reset = 0;
    #1 reset = 0;
    #1 reset = 0;
    #1 reset = 0;
    #1 reset = 1;
    #1 reset = 0;
    #1 non = 1; load = 12'b000000010000;
    #1 non = 1; load = 12'b000000010000;
    #1 non = 0; En = 1;
    #1 En = 1;
end

initial
    #200 $finish;

initial begin
   $dumpfile("Counter_tb.vcd");
   $dumpvars(0, testbench); 
end
endmodule

