// Marco Duarte
// 19022
// Ejercicio 05 - Alarma casa

module alarm_SOP01(input wire inW, inM, inS, output wire Y);
    
    wire N1, N2;        //Not del circuito
    wire A1, A2, A3;    //And del circuito
    
    //Declaracion de compuertas
    not NA (N1,     inW);
    not NB (N2,     inM);
    and AA (A1,     N1, N2, inS);
    and AB (A2,     N1, inM, inS);
    and AC (A3,     inW, inM, inS);
    or O0 (Y,        A1, A2, A3);

endmodule

module alarm_POS01(input wire inW, inM, inS, output wire Y);

    wire N1, N2, N3; //Not del circutos
    wire O1, O2, O3, O4, O5; //Or del circuito

    //Declaracion de compuertas
    not NA (N1,     inW);
    not NB (N2,     inM);
    not NC (N3,     inS);
    or OA (O1,      inW, inM, inS);
    or OB (O2,      inW, N2, inS);
    or OC (O3,      N1, inM, inS);
    or OD (O4,      N1, inM, N3);
    or OE (O5,      N1, N2, inS);
    and A0(Y,      O1, O2, O3, O4, O5);

endmodule

module alarm_Kmap01(input wire inW, inM, inS, output wire Y);

    wire N1;
    wire A1, A2;

    not N0(N1,  inW);
    and AA(A1,  N1, inS);
    and AB(A2,  inM, inS);
    or O0(Y,    A1, A2);

endmodule

module alarm_SOP02(input wire inW, inM, inS, output wire Y);

    assign  Y = (~inW & ~inM & inS) |
                (~inW &  inM & inS) |
                (inW  &  inM & inS);

endmodule

module alarm_POS02(input wire inW, inM, inS, output wire Y);

    assign   Y = ( inW |  inM |  inS) &
                 ( inW | ~inM |  inS) &
                 (~inW |  inM |  inS) &
                 (~inW |  inM | ~inS) &
                 (~inW | ~inM |  inS);

endmodule

module alarm_Kmap02(input wire inW, inM, inS, output wire Y);

    assign   Y = (~inW & inS) |
                 ( inM & inS);

endmodule