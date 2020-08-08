// Modulo para llamar a Digital_Modelling.v
//TestBench

module testbench();

//Variables para modulos 
reg p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13; // Una variable por input gates
reg a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15; // Una variable por input logic
wire out1, out2, out3, out4, out5, out6, out7, out8;

Gates_Level_01 G1(p1, p2, p3, p4, out1); //Configuracion del modulo Gates_Level_01
Gates_Level_02 G2(p5, p6, p7, out2); // Configuracion para mi modulo 2
Gates_Level_03 G3(p8, p9, p10, out3); // Configuracion para mi modulo 3
Gates_Level_04 G4(p11, p12, p13, out4); // Configuracion para mi modulo 4
Logic_Operator_01 L1(a1, a2, a3, out5);
Logic_Operator_02 L2(a4, a5, a6, a7, out6);
Logic_Operator_03 L3(a8, a9, a10, a11, out7);
Logic_Operator_04 L4(a12, a13, a14, a15, out8);
// Se llaman los modulos del archivo .v
// Se les pone tiempo

initial begin // Display de la tabla de verdad modulo 1
    $display("A B C D | Y");
    $display("--------|--");
    $monitor("%b %b %b %b | %b", p1, p2, p3, p4, out1);
     p1 = 0; p2 = 0; p3 = 0; p4 = 0; 
  #1 p1 = 0; p2 = 0; p3 = 0; p4 = 1;
  #1 p1 = 0; p2 = 0; p3 = 1; p4 = 0;
  #1 p1 = 0; p2 = 0; p3 = 1; p4 = 1;
  #1 p1 = 0; p2 = 1; p3 = 0; p4 = 0;
  #1 p1 = 0; p2 = 1; p3 = 0; p4 = 1;
  #1 p1 = 0; p2 = 1; p3 = 1; p4 = 0;
  #1 p1 = 0; p2 = 1; p3 = 1; p4 = 1;
  #1 p1 = 1; p2 = 0; p3 = 0; p4 = 0;
  #1 p1 = 1; p2 = 0; p3 = 0; p4 = 1;
  #1 p1 = 1; p2 = 0; p3 = 1; p4 = 0;
  #1 p1 = 1; p2 = 0; p3 = 1; p4 = 1;
  #1 p1 = 1; p2 = 1; p3 = 0; p4 = 0;
  #1 p1 = 1; p2 = 1; p3 = 0; p4 = 1;
  #1 p1 = 1; p2 = 1; p3 = 1; p4 = 0;
  #1 p1 = 1; p2 = 1; p3 = 1; p4 = 1;
end // Termina en tiempo 15

initial begin // Display de la tabla de verdad modulo 2
   #16
   $display("\n");
   $display("A B C | Y");
   $display("------|--");
   $monitor("%b %b %b | %b", p5, p6, p7, out2);
     p5 = 0; p6 = 0; p7 = 0;
  #1 p5 = 0; p6 = 0; p7 = 1;
  #1 p5 = 0; p6 = 1; p7 = 0;
  #1 p5 = 0; p6 = 1; p7 = 1;
  #1 p5 = 1; p6 = 0; p7 = 0;
  #1 p5 = 1; p6 = 0; p7 = 1;
  #1 p5 = 1; p6 = 1; p7 = 0;
  #1 p5 = 1; p6 = 1; p7 = 1;
end // Termina en tiempo 23

initial begin// Display de la tabla de verdad modulo 3
   #24
   $display("\n");
   $display("A B C | Y");
   $display("------|--");
   $monitor("%b %b %b | %b", p8, p9, p10, out3);
     p8 = 0; p9 = 0; p10 = 0;
  #1 p8 = 0; p9 = 0; p10 = 1;
  #1 p8 = 0; p9 = 1; p10 = 0;
  #1 p8 = 0; p9 = 1; p10 = 1;
  #1 p8 = 1; p9 = 0; p10 = 0;
  #1 p8 = 1; p9 = 0; p10 = 1;
  #1 p8 = 1; p9 = 1; p10 = 0;
  #1 p8 = 1; p9 = 1; p10 = 1;
end // Termina en tiempo 32

initial begin// Display de la tabla de verdad modulo 4
   #32
   $display("\n");
   $display("A B C | Y");
   $display("------|--");
   $monitor("%b %b %b | %b", p11, p12, p13, out4);
     p11 = 0; p12 = 0; p13 = 0;
  #1 p11 = 0; p12 = 0; p13 = 1;
  #1 p11 = 0; p12 = 1; p13 = 0;
  #1 p11 = 0; p12 = 1; p13 = 1;
  #1 p11 = 1; p12 = 0; p13 = 0;
  #1 p11 = 1; p12 = 0; p13 = 1;
  #1 p11 = 1; p12 = 1; p13 = 0;
  #1 p11 = 1; p12 = 1; p13 = 1;
end // Termina en tiempo 39

initial begin
  #40
  $display("A B C | Y");
  $display("------|--");
  $monitor("%b %b %b | %b", a1, a2, a3, out5);
     a1 = 0; a2 = 0; a3 = 0;
  #1 a1 = 0; a2 = 0; a3 = 1;
  #1 a1 = 0; a2 = 1; a3 = 0;
  #1 a1 = 0; a2 = 1; a3 = 1;
  #1 a1 = 1; a2 = 0; a3 = 0;
  #1 a1 = 1; a2 = 0; a3 = 1;
  #1 a1 = 1; a2 = 1; a3 = 0;
  #1 a1 = 1; a2 = 1; a3 = 1;
end //Termina en tiempo 47

initial begin
  #48
  $display("A B C D| Y");
  $display("-------|--");
  $monitor("%b %b %b %b | %b", a4, a5, a6, a7, out6);
     a4 = 0; a5 = 0; a6 = 0; a7 = 0; 
  #1 a4 = 0; a5 = 0; a6 = 0; a7 = 1;
  #1 a4 = 0; a5 = 0; a6 = 1; a7 = 0;
  #1 a4 = 0; a5 = 0; a6 = 1; a7 = 1;
  #1 a4 = 0; a5 = 1; a6 = 0; a7 = 0;
  #1 a4 = 0; a5 = 1; a6 = 0; a7 = 1;
  #1 a4 = 0; a5 = 1; a6 = 1; a7 = 0;
  #1 a4 = 0; a5 = 1; a6 = 1; a7 = 1;
  #1 a4 = 1; a5 = 0; a6 = 0; a7 = 0;
  #1 a4 = 1; a5 = 0; a6 = 0; a7 = 1;
  #1 a4 = 1; a5 = 0; a6 = 1; a7 = 0;
  #1 a4 = 1; a5 = 0; a6 = 1; a7 = 1;
  #1 a4 = 1; a5 = 1; a6 = 0; a7 = 0;
  #1 a4 = 1; a5 = 1; a6 = 0; a7 = 1;
  #1 a4 = 1; a5 = 1; a6 = 1; a7 = 0;
  #1 a4 = 1; a5 = 1; a6 = 1; a7 = 1;
end //Termina en tiempo 63

initial begin
  #64
  $display("A B C D| Y");
  $display("-------|--");
  $monitor("%b %b %b %b | %b", a8, a9, a10, a11, out7);
     a8 = 0; a9 = 0; a10 = 0; a11 = 0; 
  #1 a8 = 0; a9 = 0; a10 = 0; a11 = 1;
  #1 a8 = 0; a9 = 0; a10 = 1; a11 = 0;
  #1 a8 = 0; a9 = 0; a10 = 1; a11 = 1;
  #1 a8 = 0; a9 = 1; a10 = 0; a11 = 0;
  #1 a8 = 0; a9 = 1; a10 = 0; a11 = 1;
  #1 a8 = 0; a9 = 1; a10 = 1; a11 = 0;
  #1 a8 = 0; a9 = 1; a10 = 1; a11 = 1;
  #1 a8 = 1; a9 = 0; a10 = 0; a11 = 0;
  #1 a8 = 1; a9 = 0; a10 = 0; a11 = 1;
  #1 a8 = 1; a9 = 0; a10 = 1; a11 = 0;
  #1 a8 = 1; a9 = 0; a10 = 1; a11 = 1;
  #1 a8 = 1; a9 = 1; a10 = 0; a11 = 0;
  #1 a8 = 1; a9 = 1; a10 = 0; a11 = 1;
  #1 a8 = 1; a9 = 1; a10 = 1; a11 = 0;
  #1 a8 = 1; a9 = 1; a10 = 1; a11 = 1;
end //Termina en tiempo 79

initial begin
  #80
  $display("A B C D| Y");
  $display("-------|--");
  $monitor("%b %b %b %b | %b", a12, a13, a14, a15, out8);
     a12 = 0; a13 = 0; a14 = 0; a15 = 0; 
  #1 a12 = 0; a13 = 0; a14 = 0; a15 = 1;
  #1 a12 = 0; a13 = 0; a14 = 1; a15 = 0;
  #1 a12 = 0; a13 = 0; a14 = 1; a15 = 1;
  #1 a12 = 0; a13 = 1; a14 = 0; a15 = 0;
  #1 a12 = 0; a13 = 1; a14 = 0; a15 = 1;
  #1 a12 = 0; a13 = 1; a14 = 1; a15 = 0;
  #1 a12 = 0; a13 = 1; a14 = 1; a15 = 1;
  #1 a12 = 1; a13 = 0; a14 = 0; a15 = 0;
  #1 a12 = 1; a13 = 0; a14 = 0; a15 = 1;
  #1 a12 = 1; a13 = 0; a14 = 1; a15 = 0;
  #1 a12 = 1; a13 = 0; a14 = 1; a15 = 1;
  #1 a12 = 1; a13 = 1; a14 = 0; a15 = 0;
  #1 a12 = 1; a13 = 1; a14 = 0; a15 = 1;
  #1 a12 = 1; a13 = 1; a14 = 1; a15 = 0;
  #1 a12 = 1; a13 = 1; a14 = 1; a15 = 1;
end //Termina en tiempo 95

// Iniciar la funcion del GtkWave
initial // modulo final
    #96 $finish;

initial begin
  $dumpfile("Digital_Modelling_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule