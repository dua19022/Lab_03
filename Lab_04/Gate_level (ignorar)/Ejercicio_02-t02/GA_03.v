// Marco Duarte - 19022
// Operadores Logicos
// Ejercicio 01 - Tabla 02

module Gates_Modeling_03();

// Declaracion de variables por modulo del circuito

wire N2;                  // Not del circuito
wire A1, A2;
wire O1;
reg inA, inB, inC;               // Declarando que el circuito tiene 3 entradas

//Declaracion de compuertas

not NB (N2,     inB); // B not
and AA (A1,     N2);
and AB (A2,     inB, inC);
or O0 (O1,      A1, A2);

initial // Inicio el codigo luego de establecer las condiciones
  begin
    $display("A B C| Y");
    $display("----------");
    $monitor("%b %b %b | %b", inA, inB, inC, O1);

// Inputs en 0
inA = 0; inB = 0; inC = 0;

// Declaramos los cambios en los tiempos
// #1 marca un retardo de una unidad de tiempo
#1 inC = 1;
#1 inB = 1; inC = 0;
#1 inC = 1; 
#1 inA = 1; inB = 0; inC = 0; 
#1 inC = 1; 
#1 inB = 1; inC = 0; 
#1 inC = 1;
#1 $finish; // termina la simulacion
end

initial
  begin
    $dumpfile("GA_03_tb.vcd"); // nombre del archivo de test bench + .vcd
    $dumpvars(0, Gates_Modeling_03); // nombre del modulo
  end
endmodule //finalizar el modulo
