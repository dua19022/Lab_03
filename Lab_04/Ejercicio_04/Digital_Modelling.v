// Todos los modulos
// Marco Duarte
// 19022
module Gates_Level_01(input wire inA, inB, inC, inD, output wire Y);

    // Declaracion de variables por modulo del circuito

    wire N1, N2, N3, N4;                  // Not del circuito
    wire A1, A2, A3, A4, A5, A6, A7, A8;  // And del circuito
   
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
    or O0 (Y,    A1, A2, A3, A4, A5, A6, A7, A8); //Las 8 entradas del Or_1

endmodule //Modulo 01 code by Gateslevel

module Gates_Level_02(input wire inA, inB, inC, output wire Y);

    // Declaracion de variables por modulo del circuito

    wire N1;                  // Not del circuito

    //Declaracion de compuertas

    not NB (N1,   inB); // B not
    and AA (Y,    N1);

endmodule //Modulo 02 code by Gateslevel

module Gates_Level_03(input wire inA, inB, inC, output wire Y);

    // Declaracion de variables por modulo del circuito

    wire N2;                  // Not del circuito
    wire A1, A2;

    //Declaracion de compuertas

    not NB (N2,     inB); // B not
    and AA (A1,     N2);
    and AB (A2,     inB, inC);
    or O0 (Y,      A1, A2);

endmodule //Modulo 03 code by Gateslevel

module Gates_Level_04(input wire inA, inB, inC, output wire Y);

    // Declaracion de variables por modulo del circuito

    wire N1, N3;                  // Not del circuito
    wire A1, A2;

    //Declaracion de compuertas

    not NA (N1,     inA); // B not
    not NC (N3,     inC);
    and AA (A1,     N1, N3);
    and AB (A2,     inB);
    or O0 (Y,      A1, A2);

endmodule //Modulo 04 code by Gateslevel

module Logic_Operator_01(input wire inA, inB, inC, output wire Y);

    //Declaracion de variables de modo Logico

    assign Y = (~inA & ~inC) | (~inB & ~inC) | (inA & inC);

endmodule //Modulo 05 code by Logic Operators

module Logic_Operator_02(input wire inA, inB, inC, inD, output wire Y);

    //Declaracion de variables de modo logico
    assign Y = (inA & inB) | (inA & inC) | (~inB & ~inD);

endmodule //Modulo 06 code by Logic Operators

module Logic_Operator_03(input wire inA, inB, inC, inD, output wire Y);

    //Declaracion de variables de modo logico
    assign Y = (~inB & ~inC & ~inD) | (inA & ~inD) | (inA & ~inB) | (inA & ~inC);

endmodule //Modulo 07 code by Logic Operators

module Logic_Operator_04(input wire inA, inB, inC, inD, output wire Y);

    //Declaracion de variables de modo logico
    assign Y = (inB) | (~inC & inD) | (inA & inD);
    
endmodule //Modulo 08 code by Logic Operators
