// Marco Duarte - 19022
// Operadores Logicos
// Ejercicio 01 - Tabla 03

module Gates_Level_01();

// Declaracion de variables por modulo del circuito

wire N1, N2, N3, N4;                  // Not del circuito
wire O1;                              // Or del circutio
wire A1, A2, A3, A4, A5, A6, A7, A8;  // And del circuito
reg inA, inB, inC, inD;               // Declarando que el circuito tiene 3 entradas

//Declaracion de compuertas

not NA (N1,   inA); // A not
not NB (N2,   inB); // B not
not NC (N3,   inC); // C not
not ND (N4,   inD); // D not
and AA (A1,   N1, N2, N3, N4); // Las 4 entradas del And
and AB (A2,   N1, N2, inC, inD); // Las 4 entradas del And
and AC (A3,   N1, inB, N3, inD); // Las 4 entradas del And
and AD (A4,   N1, inB, inC, N4); // Las 4 entradas del And
and AE (A5,   inA, inB, N3, N4); // Las 4 entradas del And
and AF (A6,   inA, inB, inC, inD); // Las 4 entradas del And
and AG (A7,   inA, N2, N3, inD); // Las 4 entradas del And
and AG (A8,   inA, N2, inC, N4); // Las 4 entradas del And
or O0 (O1,    A1, A2, A3, A4, A5, A6, A7, A8); //Las 8 entradas del Or_1

initial // Inicio el codigo luego de establecer las condiciones
  begin
    $display("A B C D| Y");
    $display("----------");
    $monitor("%b %b %b %b | %b", inA, inB, inC, inD,  O1);

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
    $dumpfile("GA_01_tb.vcd"); // nombre del archivo de test bench + .vcd
    $dumpvars(0, Gates_Level_01); // nombre del modulo
  end
endmodule //finalizar el modulo
