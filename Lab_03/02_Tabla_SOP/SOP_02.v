// Marco Duarte - 19022
// SOP tabla_02

module Lab_03();

// Declaracion de variables por modulo del circuito
wire N1, N2, N3; // Not del circuito
wire O1; // Or del circutio
wire A1, A2, A3; // And del circuito

reg inA, inB, inC; // Declarando que el circuito tiene 3 entradas

//Declaracion de compuertas
not NA (N1,   inA); // A not
not NB (N2,   inB); // B not
not NC (N3,   inC); // C not
and AA (A1,   N1, N2, inC); // Las 3 entradas del And_1
and AB (A2,   inA, inB, N3); // Las 3 entradas del And_2
and AC (A3,   inA, inB, inC); // Las 3 entradas del And_3
or OA (O1,    A1, A2, A3); //Las 3 entradas del Or

initial // Inicio el codigo luego de establecer las condiciones
  begin
    $display("A B C| Y");
    $display("-------"); // Esto es lo que imprime CMD sobre tu codigo
    $monitor("%b %b %b | %b", inA, inB, inC, O1); // Esta codigo dice que imprima la tabla de verdad del codigo

// Inputs en 0
inA = 0; inB = 0; inC = 0;
// Declaramos los cambios en los tiempos ( combinaciones de 000,001,010,011,100,101,110,111)
#1 inC = 1; // #1 marca un retardo de una unidad de tiempo
#1 inB = 1; inC = 0;
#1 inC = 1;
#1 inA = 1; inB = 0; inC = 0;
#1 inC = 1;
#1 inB = 1; inC = 0;
#1 inC = 1;
#1 $finish; // termina la simulacion
end

initial // Abrir GTKwave
  begin
    $dumpfile("SOP_02_tb.vcd");
    $dumpvars(0, Lab_03);
  end
endmodule //finalizar el modulo
