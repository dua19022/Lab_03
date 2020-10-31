// Marco Duarte
// TestBench
// Ejercicio 04

module testbench();

reg En;
reg [3:0]entradas;
wire [3:0]salidas;

BTri CON(En, entradas, salidas);

initial begin
    #1
    $display("--------------------------");
    $display("| Enable | Entradas | Salidas |");
    $monitor("|   %b   |    %b    |    %b   |", En, entradas, salidas);
    En = 0; entradas = 4'b0000;
    #2 En = 0; entradas = 4'b0001;
    #2 En = 1; entradas = 4'b0000;
    #2 En = 1; entradas = 4'b0110;
    #2 En = 1; entradas = 4'b0110;
    #2 En = 0; entradas = 4'b0110;
    #2 En = 1; entradas = 4'b1110;
    #2 En = 1; entradas = 4'b1010;
end

initial 
    #10 $finish;

initial begin
    $dumpfile("BuffTri_tb.vcd");
    $dumpvars(0, testbench); 
end

endmodule