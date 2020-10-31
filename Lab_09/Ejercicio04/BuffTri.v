//Electronica Digital 1
// Marco Duarte
// Ejercicio 04
// Buffer Tri-Estado

module BTri(
    input wire En,
    input wire [3:0]entradas,
    output wire [3:0]salidas);

        assign salidas = (En) ? entradas:4'bz;
endmodule

