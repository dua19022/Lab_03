// Marco Duarte - 19022
// POS tabla_04

module Lab_03();

// Declaracion de variables por modulo del circuito

wire N1, N2, N3, N4; // Not del circuito
wire O1, O2, O3, O4, O5, O6, O7, O8, O9; // Or del circutio
wire A1; // And del circuito

reg inA, inB, inC, inD; // Declarando que el circuito tiene 3 entradas

//Declaracion de compuertas

not NA (N1,   inA); // A not
not NB (N2,   inB); // B not
not NC (N3,   inC); // C not
not ND (N4,   inD); // D not
or OA (O1,    inA, inB, inC, N4); // Las 4 entradas del Or_1
or OB (O2,    inA, N2, inC, inD); // Las 4 entradas del Or_2
or OC (O3,    inA, N2, inC, N4); // Las 4 entradas del Or_3
or OD (O4,    N1, inB, inC, N4); // Las 4 entradas del Or_4
or OE (O5,    N1, inB, N3, N4); // Las 4 entradas del Or_5
or OE (O6,    N1, N2, inC, inD); // Las 4 entradas del Or_6
or OE (O7,    N1, N2, inC, N4); // Las 4 entradas del Or_7
or OE (O8,    N1, N2, N3, inD); // Las 4 entradas del Or_8
or OE (O9,    N1, N2, N3, N4); // Las 4 entradas del Or_9
and A0 (A1,   O1, O2, O3, O4, O5, O6, O7, O8, O9); // Las 9 entradas del And

initial // Inicio el codigo luego de establecer las condiciones
  begin
    $display("Marco Duarte - 19022");
    $display("A B C D| Y");
    $display("-----------");
    $monitor("%b %b %b %b | %b", inA, inB, inC, inD, A1);

// Inputs en 0
inA = 0; inB = 0; inC = 0; inD = 0;

// Declaramos los cambios en los tiempos
// #1 marca un retardo de una unidad de tiempo
#1 inD = 1;
#1 inC = 1; inD = 0;
#1 inD = 1;
#1 inB = 1; inC = 0; inD = 0;
#1 inD = 1;
#1 inC = 1; inD = 0;
#1 inD = 1;
#1 inA = 1; inB = 0; inC = 0; inD = 0;
#1 inD = 1;
#1 inC = 1; inD = 0;
#1 inD = 1;
#1 inB = 1; inC = 0; inD = 0;
#1 inD = 1;
#1 inC = 1; inD = 0;
#1 inD = 1;
#1 $finish; // termina la simulacion
end

initial
  begin
    $dumpfile("POS_04_tb.vcd");
    $dumpvars(0, Lab_03);
  end
endmodule //finalizar el modulo
