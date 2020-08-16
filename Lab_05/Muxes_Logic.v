// Marco Duarte - 19022
// Declaraciones de modulos

// Se arman los Mux
// Armando el mux 2:1
module mux2(output wire Y, input wire D0, D1, S);
    // Declaro los cables
    assign Y = S ? D1 : D0;
endmodule

// Armando el mux 4:1
module mux4(output wire Y, input wire D0, D1, D2, D3, S0, S1);
    // Cables entre muxes
    wire int1, int2;
    // Insteancio el mux2, implementar modulos
    mux2 connect0(int1, D0, D1, S0);
    mux2 connect1(int2, D2, D3, S0);
    mux2 connect2(Y, int1, int2, S1);

endmodule

// Armando el mux 8:1
module mux8(output wire Y, input wire D0, D1, D2, D3, D4, D5, D6, D7, S0, S1, S2);
    // Cables entre muxes
    wire int1, int2, int3, int4;
    // Insancio el mux2 y el mux4 he implemento modulos
    mux2 connect0(int1, D0, D1, S0);
    mux2 connect1(int2, D2, D3, S0);
    mux2 connect2(int3, D4, D5, S0);
    mux2 connect3(int4, D6, D7, S0);
    mux4 connect4(Y, int1, int2, int3, int4, S1, S2);
endmodule

// Conectar cables a los muxes

// Tabla_01
// Tabla 1, mux 8:1
module t01_8(output wire Y, input wire A, B, C);
    // Declara mis cables
    wire volt, gnd;
    // Asignarle el valor al voltaje de 1 y a tierra de 0
    assign volt = 1;
    assign gnd = 0;
    // Conexiones de mux8
    mux8 connect(Y, gnd, volt, volt, gnd, volt, gnd, gnd, volt, A, B, C);
endmodule

// Tabla 1, mux 4:1
module t01_4(output wire Y, input wire A, B, C);
    //Declaro mis cables
    wire N1;
    // Asignar compuertas
    assign N1 = ~C;
    // Conexion al mux
    mux4 connect(Y, C, N1, N1, C, A, B);
endmodule

// Tabla 1, mux 2:1
module t01_2(output wire Y, input wire A, B, C);
    // Declaraciones de cables
    wire X, N;
    // Assignar compuertas
    assign X = B ^ C;
    assign N = B ~^ C;
    // Conexiones al mux
    mux2 connect(Y, X, N, A);
endmodule


// Tabla_02
/*
 Ojo que para que funcione la tabla_02 es necesario
 que los input se conecten alreves , sino no funciona bien
 entiendase que norma es (A, B, C) y alreves es (C, B, A)
*/

// Tabla 2, mux 8:1
module t02_8(output wire Y, input wire A, B, C);
    // Declara mis cables
    wire volt, gnd;
    // Asignarle el valor al voltaje de 1 y a tierra de 0
    assign volt = 1;
    assign gnd = 0;
    // Conexiones de mux8
    mux8 connect(Y, volt, gnd, gnd, gnd, gnd, volt, volt, gnd, C, B, A);
endmodule

// Tabla 2, mux 4:1
module t02_4(output wire Y, input wire A, B, C);
    //Declaro mis cables
    wire N1, V;
    // Asignar compuertas
    assign G = 0;
    assign V = 1;
    assign N1 = ~C;
    // Conexion al mux
    mux4 connect(Y, N1, G, C, N1, B, A);
endmodule

// Tabla 2, mux 2:1
module t02_2(output wire Y, input wire A, B, C);
    // Declaraciones de cables
    wire X, N;
    // Assignar compuertas
    assign X = (B) ~| (C);
    assign N = (B) ^ (C);
    // Conexiones al mux
    mux2 connect(Y, X, N, A);
endmodule