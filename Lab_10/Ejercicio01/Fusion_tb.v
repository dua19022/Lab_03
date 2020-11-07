// Electronica Digital 1
// Marco Duarte
// Ejercicio 01
// testbench

module testbench ();

// Declaramos las variables del modulo que se quiere probar
reg Clk, reset, En, non, En2;
reg [11:0]load;
wire [3:0]Q1;
wire [3:0]Q2;

// Se llama al modulo
fusion U1(Clk, reset, En, non, En2, load, Q1, Q2);

always
    #5 Clk = ~Clk;

initial begin
    #1 
    $display("--------------------------------------------------------------------------------");
    $display("| Clock | Reset | Enable | Non | Enable2 |       Load       |    Q1    |   Q2   |");
    $display("--------------------------------------------------------------------------------");
    $monitor("|   %b   |   %b   |   %b    |  %b  |    %b    |   %b   |   %b   |  %b  |", Clk, reset, En, non, En2, load, Q1, Q2);
    Clk = 0; reset = 0; En = 0; non = 0; En2 = 0; load = 12'b000000000000;
    #10 reset = 1;
    #10 reset = 0;
    #10 En = 1;
    #10 En2 = 1;
    #10 non = 1;
    #10 load = 12'b000000000001;
    #10 load = 12'b000000001010;
    #10 non = 0;
    #10 En = 0;
    #10 En2 = 0;
    #10 reset = 0;
    #10 reset = 1;
    #10 reset = 0;    
    #10 En = 1;
    #10 En2 = 1;
    #10 load = 12'b000111001010;
    #10 non = 1;
    #10 load = 12'b110001001010;
end

initial
    #200 $finish;

initial begin
    $dumpfile("Fusion_tb.vcd");
    $dumpvars(0, testbench); 
end

endmodule