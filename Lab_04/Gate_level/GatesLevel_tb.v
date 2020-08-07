// Modulo para llamar a GatesLevel.v
//TestBench

module testbench();

//Variables para modulos 
reg p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13;
wire out1, out2, out3, out4;

Gates_Level_01 G1(p1, p2, p3, p4, out1); //Configuracion del modulo Gates_Level_01
Gates_Level_02 G2(p5, p6, p7, out2); // Configuracion para mi modulo 2
Gates_Level_03 G3(p8, p9, p10, out3); // Configuracion para mi modulo 3
Gates_Level_04 G4(p11, p12, p13, out4); // Configuracion para mi modulo 4

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

// Iniciar la funcion del GtkWave

initial 
    #40 $finish;

initial begin
  $dumpfile("GatesLevel_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule