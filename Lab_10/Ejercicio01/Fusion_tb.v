// Electronica Digital 1
// Marco Duarte
// Ejercicio 01
// testbench

module testbench();

// Declaramos las variables del modulo que se quiere probar
reg Clk, reset, En, non, En2;
reg [11:0]load;
wire [3:0]Q1;
wire [3:0]Q2;
wire [7:0]B;

// Se llama al modulo
fusion U1(Clk, reset, En, non, En2, load, B, Q1, Q2);

always
    #1 Clk = ~Clk;

initial begin
    #1 
    $display("-------------------------------------------------------------------------------------------------");
    $display("| Clock | Reset | Enable | Non | Enable2 |       Load       |       B       |    Q1    |   Q2   |");
    $display("-------------------------------------------------------------------------------------------------");
    $monitor("|   %b   |   %b   |   %b    |  %b  |    %b    |   %b   |    %b   |   %b   |  %b  |", Clk, reset, En, non, En2, load, B, Q1, Q2);
    Clk = 0; reset = 0; En = 0; non = 0; En2 = 0; load = 12'b000000000000;
    #2 reset = 1;
    #2 reset = 0;
    #2 En = 1;
    #2 En2 = 1;
    #2 non = 1;
    #2 load = 12'b000000000001;
    #2 load = 12'b000000001010;
    #2 non = 0;
    #2 non = 1;
    #2 En = 1; load = 12'b000111001010;
    #2 En2 = 1; load = 12'b110001001010;
end

initial
    #25 $finish;

initial begin
    $dumpfile("Fusion_tb.vcd");
    $dumpvars(0, testbench); 
end

endmodule