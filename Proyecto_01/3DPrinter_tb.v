//TestBench
//Impresora 3D
// Marco DUarte
//19022
// Proyecto # 01 - Digital
// ----------------Modulo Testbench----------------

module testbench();

reg clk, reset, signal, lector, encen, conti, sz, sx, sy, sy2, sh;
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
FSM main(clk, reset, signal, lector, encen, conti, sz, sx, sy, sy2, sh, F, C, LCD, M, W);


initial begin
    #1
    $display("\n");
    $display("3DPrinter");
    $display("---------------------");
    $monitor("%b %b %b %b %b %b %b %b %b %b %b %b| %b %b %b %b", clk, reset, signal, lector, encen, conti, sz, sx, sy, sy2, sh, F, C, LCD, M, W);

    #3 reset = 1;
    #3 reset = 0;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 1; lector = 1; encen = 1; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 1; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 1; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 1; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 1; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 1; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 1; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b01;

    #3 reset = 1;
    #3 reset = 0;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 1; lector = 1; encen = 1; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 1; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 1; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 1; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 1; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 1; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 1; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b00;
    #5 signal = 0; lector = 0; encen = 0; conti = 0; sz = 0; sx = 0; sy = 0; sy2 = 0; sh = 0; F = 2'b10;

end

initial
    #100 $finish;

initial begin
   $dumpfile("3DPrinter_tb.vcd");
   $dumpvars(0, testbench); 
end
endmodule
