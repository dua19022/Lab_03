//Modulo para llamar a Alarm.v
//Testbench

module testbench();

//variables para modulos
reg p1, p2, p3, p4, p5, p6, p7, p8, p9;
reg a1, a2, a3, a4, a5, a6, a7, a8, a9;
wire out1, out2, out3, out4, out5, out6;

alarm_SOP01 CA(p1, p2, p3, out1);
alarm_POS01 CB(p4, p5, p6, out2);
alarm_Kmap01 CC(p7, p8, p9, out3);
alarm_SOP01 CD(a1, a2, a3, out4);
alarm_POS01 CE(a4, a5, a6, out5);
alarm_Kmap02 CF(a7, a8, a9, out6);


initial begin
    $display("\n");
   $display("W M S | A");
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
end //Termina en 7

initial begin
    #8
    $display("\n");
   $display("W M S | A");
   $display("------|--");
   $monitor("%b %b %b | %b", p4, p5, p6, out2);
     p4 = 0; p5 = 0; p6 = 0;
  #1 p4 = 0; p5 = 0; p6 = 1;
  #1 p4 = 0; p5 = 1; p6 = 0;
  #1 p4 = 0; p5 = 1; p6 = 1;
  #1 p4 = 1; p5 = 0; p6 = 0;
  #1 p4 = 1; p5 = 0; p6 = 1;
  #1 p4 = 1; p5 = 1; p6 = 0;
  #1 p4 = 1; p5 = 1; p6 = 1;
end// Termina en 15

initial begin
    #16
    $display("\n");
    $display("W M S | A");
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
end// Termina 23

initial begin
    #24
    $display("\n");
  $display("W M S | A");
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
end //Termina en 31

initial begin
    #32
    $display("\n");
  $display("W M S | A");
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
end //Termina en 39

initial begin
    #40
    $display("\n");
  $display("W M S | A");
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
end// Termina en 47

// Iniciar la funcion del GtkWave
initial // modulo final
    #48 $finish;

initial begin
  $dumpfile("Alarm_tb.vcd");
  $dumpvars(0, testbench);
end


endmodule