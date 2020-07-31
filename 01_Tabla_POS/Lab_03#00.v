// Marco Duarte - 19022
// SOP tabla_01

module Lab_03();

// Declaracion de variables por modulo del circuito

wire N1, N2, N3; // Not del circuito
wire O1, O2, O3; // Or del circutio
wire A1; // And del circuito

reg inA, inB, inC; // Declarando que el circuito tiene 3 entradas

//Declaracion de compuertas

not NA (N1,   inA); // A not
not NB (N2,   inB); // B not
not NC (N3,   inC); // C not
or OA (O1,    inA, inB, N3); //Las 3 entradas del Or_1
or OB (O2,    inA, N2, N3); // Las 3 entradas del Or_2
or OC (O3,    N1, N2, inC); // Las 3 entradas del Or_3
and A0 (A1,   O1, O2, O3); // Las 3 entradas del And

initial // Inicio el codigo luego de establecer las condiciones
  begin
    $monitor(
      "Time%d: inA=%b inB=%b inC=%b N1=%b N2=%b N3=%b O1=%b O2=%b O3=%b A1=%b",
          $time, inA, inB, inC, N1, N2, N3, O1, O2, O3, A1);

// Inputs en 0
inA = 0;
inB = 0;
inC = 0;

// Declaramos los cambios en los tiempos
#1 inA = 1; // #1 marca un retardo de una unidad de tiempo
#1 inB = 2;
#1 inC = 3;
#1 $finish; // termina la simulacion
end

initial
  begin
    $dumpfile("Lab_03#00_tb");
    $dumpvars(1);
  end
endmule //finalizar el modulo
