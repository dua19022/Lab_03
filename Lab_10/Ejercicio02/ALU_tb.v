// Marco Duarte
// TestBench
// Ejercicio 02

module testbench();

reg [3:0]entradas;
reg En1, Clk, reset, En, En2;
reg [2:0]command;
wire carry, exit;
wire [3:0]out;

main U0(entradas, En1, Clk, reset, En, En2, command, carry, exit, out);

initial begin
    #1
    $display("-----------------------------------------------------------------------------");
    $display("| Clk | En |  entradas  | Reset | En1 | En2 | command || Carry | Exit | Out |");
    $monitor("|  %b  |  %b |    %b    |   %b   |  %b  |  %b  |   %b   ||   %b   |   %b  | %b|", Clk, En, entradas, reset, En1, En2, command, carry, exit, out);
    entradas = 4'b0000; En1 = 0; Clk = 0; reset = 0; En = 0; En2 = 0; command = 3'b000;
    #2 reset = 1;
    #2 reset = 0;
    #2 entradas = 4'b0001; En1 = 1;
    #2 En = 1; En2 = 1; command = 3'b010;

end

always
    #1 Clk = ~Clk;

initial
    #40 $finish;

initial begin
    $dumpfile("ALU_tb.vcd");
    $dumpvars(0, testbench); 
end

endmodule