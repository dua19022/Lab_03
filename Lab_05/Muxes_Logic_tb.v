// Marco Duarte - 19022
// Testbench - Configuracion del timing

module testbench();

//Variables modulos
reg p1, p2, p3, p4, p5, p6, p7, p8, p9;
reg a1, a2, a3, a4, a5, a6, a7, a8, a9;
wire out1, out2, out3, out4, out5, out6;

// Conecto cables a las entradas y salidas de los modulos
t01_8 M1(out1, p1, p2, p3);
t01_4 M2(out2, p4, p5, p6);
t01_2 M3(out3, p7, p8, p9);
t02_8 M4(out4, a1, a2, a3);
t02_4 M5(out5, a4, a5, a6);
t02_2 M6(out6, a7, a8, a9);


// Empiezo en timing y la creacion de tablas
initial begin
    $display("Tabla_01 - 8:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", p1, p2, p3, out1);
     p1 = 0; p2 = 0; p3 = 0;
  #1 p1 = 0; p2 = 0; p3 = 1;
  #1 p1 = 0; p2 = 1; p3 = 0;
  #1 p1 = 0; p2 = 1; p3 = 1;
  #1 p1 = 1; p2 = 0; p3 = 0;
  #1 p1 = 1; p2 = 0; p3 = 1;
  #1 p1 = 1; p2 = 1; p3 = 0;
  #1 p1 = 1; p2 = 1; p3 = 1;
end
// termina en 7

initial begin
   #8
   $display("\n\n");
   $display("Tabla_01 - 4:1");
   $display("A B C | Y");
   $display("------|--");
   $monitor("%b %b %b | %b", p4 , p5, p6, out2);
      p4 = 0; p5 = 0; p6 = 0;
   #1 p4 = 0; p5 = 0; p6 = 1;
   #1 p4 = 0; p5 = 1; p6 = 0;
   #1 p4 = 0; p5 = 1; p6 = 1;
   #1 p4 = 1; p5 = 0; p6 = 0;
   #1 p4 = 1; p5 = 0; p6 = 1;
   #1 p4 = 1; p5 = 1; p6 = 0;
   #1 p4 = 1; p5 = 1; p6 = 1;
end
// termina en 15

initial begin
    #16
    $display("\n\n");
    $display("Tabla_01 - 2:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", p7, p8, p9, out3);
      p7 = 0; p8 = 0; p9 = 0;
   #1 p7 = 0; p8 = 0; p9 = 1;
   #1 p7 = 0; p8 = 1; p9 = 0;
   #1 p7 = 0; p8 = 1; p9 = 1;
   #1 p7 = 1; p8 = 0; p9 = 0;
   #1 p7 = 1; p8 = 0; p9 = 1;
   #1 p7 = 1; p8 = 1; p9 = 0;
   #1 p7 = 1; p8 = 1; p9 = 1;
end
// termina 23

initial begin
    #24
    $display("\n\n");
    $display("Tabla_02 - 8:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", a1, a2, a3, out4);
      a1 = 0; a2 = 0; a3 = 0;
   #1 a1 = 0; a2 = 0; a3 = 1;
   #1 a1 = 0; a2 = 1; a3 = 0;
   #1 a1 = 0; a2 = 1; a3 = 1;
   #1 a1 = 1; a2 = 0; a3 = 0;
   #1 a1 = 1; a2 = 0; a3 = 1;
   #1 a1 = 1; a2 = 1; a3 = 0;
   #1 a1 = 1; a2 = 1; a3 = 1;
end
// termina en 31

initial begin
    #32
    $display("\n\n");
    $display("Tabla_02 - 4:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", a4, a5, a6, out5);
      a4 = 0; a5 = 0; a6 = 0;
   #1 a4 = 0; a5 = 0; a6 = 1;
   #1 a4 = 0; a5 = 1; a6 = 0;
   #1 a4 = 0; a5 = 1; a6 = 1;
   #1 a4 = 1; a5 = 0; a6 = 0;
   #1 a4 = 1; a5 = 0; a6 = 1;
   #1 a4 = 1; a5 = 1; a6 = 0;
   #1 a4 = 1; a5 = 1; a6 = 1;
end
// termina en 39

initial begin
    #40
    $display("\n\n");
    $display("Tabla_02 - 2:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", a7, a8, a9, out6);
      a7 = 0; a8 = 0; a9 = 0;
   #1 a7 = 0; a8 = 0; a9 = 1;
   #1 a7 = 0; a8 = 1; a9 = 0;
   #1 a7 = 0; a8 = 1; a9 = 1;
   #1 a7 = 1; a8 = 0; a9 = 0;
   #1 a7 = 1; a8 = 0; a9 = 1;
   #1 a7 = 1; a8 = 1; a9 = 0;
   #1 a7 = 1; a8 = 1; a9 = 1;
end
// termina en 47

// Declaracion de GTKwave
initial
    #51 $finish;
initial begin
    $dumpfile("Muxes_Logic_tb.vcd");
    $dumpvars(0, testbench);
end

endmodule