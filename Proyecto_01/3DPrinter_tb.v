//TestBench
//Impresora 3D
// Marco DUarte
//19022
// Proyecto # 01 - Digital
// ----------------Modulo Testbench----------------

module testbench();

reg clk, reset, signal, I, O, P2, PB, sz, sx, sy, sy2, sh, AB;
reg [1:0]F;
wire [1:0]C;
wire [2:0]LCD;
wire [2:0]M;
wire [2:0]W;

initial begin
   clk <= 1;
   forever #5 clk = ~clk; 
end

//Llamo a mi FSM
FSM main(clk, reset, signal, I, O, P2, PB, sz, sx, sy, sy2, sh, AB, F, C, LCD, M, W);


initial begin
    #1
    $display("\n");
    $display("3DPrinter");
    $display("---------------------");
    $display("Clk r s I O P2 PB sz sx sy sy2 sh  AB  F ");
    $monitor("%b   %b %b %b %b %b %b  %b  %b  %b  %b  %b   %b  %b  ", clk, reset, signal, I, O, P2, PB, sz, sx, sy, sy2, sh, AB, F);

    #3 reset = 1;
    #3 reset = 0;
    #2 AB = 0; P2 = 0;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 1; I = 1; O = 1; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 1; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 1; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 1; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 1; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 1; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 1; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b01;

    #3 reset = 1;
    #3 reset = 0;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 1; I = 1; O = 1; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 1; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 1; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 1; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 1; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 1; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 1; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b10;

    #3 reset = 1;
    #3 reset = 0;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 1; I = 1; O = 1; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 1; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 1; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 1; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 1; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 1; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 1; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; I = 0; O = 0; PB = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b11;

end

initial
    #165 $finish;

initial begin
   $dumpfile("3DPrinter_tb.vcd");
   $dumpvars(0, testbench); 
end
endmodule
