// Universidad del Valle de Guatemala
// Electronica Digital 1
// Marco Duarte
// Proyecto # 01 - FSM
// Automatizacion de Impresora 3D - Pre-Impresion

// -------------------------------------------------------------

// FlipFlop de 1 bit
module DFlipFlop(
    input wire clk, reset, D,
    output reg Q);

        always @(posedge clk or posedge reset) begin
            if(reset)begin
            Q <= 1'b0; 
            end

            else
            Q <= D; 
        end
endmodule

// FlipFlop de 2 bit
module D2FlipFlop(
    input wire clk, reset,
    input wire [1:0]D,
    output reg [1:0]Q);

        always @(posedge clk , posedge reset) begin
            if(reset)begin
            Q <= 2'b0; 
            end

            else
            Q <= D; 
        end
endmodule

// FlipFlop de 3 bit
module D3FlipFlop(
    input wire reset, clk,
    input wire [2:0]D,
    output reg [2:0]Q);

        always @ (posedge clk, posedge reset) begin
            if ( reset) begin
                Q <= 3'b0;
            end
            
            else
                Q <= D; 
        end
endmodule

// FlipFlop de 4 bit
module D4FlipFlop(
    input wire reset, clk,
    input wire [3:0]D,
    output reg [3:0]Q);

        always @ (posedge clk, posedge reset) begin
            if ( reset) begin
                Q <= 4'b0;
            end
            
            else
                Q <= D; 
        end
endmodule

// Timer para PLA
module timer01(
    input wire EN,
    output reg T1);

        always @ (EN) begin
            if (EN == 1) begin
                T1 = 0;
                #8
                T1 = 1;
            end

            else
                T1 = 0;
        end
endmodule

// Timer para ABS
module timer02(
    input wire EN0,
    output reg T2);

        always @ (EN0) begin
            if (EN0 == 1) begin
                T2 = 0;
                #10
                T2 = 1;
            end

            else
                T2 = 0;
        end
endmodule

// Timer para TPU
module timer03(
    input wire EN1,
    output reg T3);

        always @ (EN1) begin
            if (EN1 == 1) begin
                T3 = 0;
                #8
                T3 = 1;
            end

            else
                T3 = 0;
        end
endmodule

// --------------- Cajas Negras ---------------

// Maquina de anti-rebote
module Antirebotes(
    input wire clk, reset, signal,
    output wire out);

        wire inc;
        wire ot;

        assign inc = signal;
        assign out = ~ot & signal;

        DFlipFlop AR(clk, reset, signal, out);
endmodule

// Maquina de Control
module Control(
    input wire clk, reset,
    input wire O, I,
    output wire [1:0] C,
    output wire P, P2);

        wire [1:0] S_00;
        wire [1:0] SF_00;
        wire S1, S0;
        wire S1F, S0F;

        assign SF_00 [0] = S0F;
        assign SF_00 [1] = S1F;
    
        // Estados futuros
        assign S1F = (S1 & ~S0 & ~P2) | (~S1 & S0 & I & P);
        assign S0F = (~S1 & ~S0 & O) | (~S1 & S0 & ~I & ~P);


        // Salidas
        assign C [1] = (S1 & ~S0);
        assign C [0] = (~S1 & S0);
        assign P = S0;

        // Conexion al FLIPFLOP
        D2FlipFlop FF00(clk, reset, SF_00, S_00);
endmodule

// Maquina de Motores
module Motores(
    input wire clk, reset, P, sz, sx, sy, sy2, sh, 
    output wire [2:0]M,
    output wire HOME);

        wire [2:0]S_000;
        wire [2:0]SF_000;
        wire S0, S1, S2;
        wire SF0, SF1, SF2;

        assign SF_000[0] = SF0;
        assign SF_000[1] = SF1;
        assign SF_000[2] = SF2;


        // Estados Futuros
        assign SF2 = (S2 & ~S1 & ~S0) | (S2 & ~S1 & ~sh) | (~S2 & S1 & S0 & sy);
        assign SF1 = (~S2 & S1 & ~S0) | (~S2 & S1 & ~sy) | (~S2 & ~S1 & S0 & sz);
        assign SF0 = (~S2 & ~S1 & ~S0 & P) | (S2 & ~S1 & S0 & ~sh) | (~S2 & ~S1 & S0 & ~sz) | (~S2 & S1 & ~S0 & sx) | (~S2 & S1 & S0 & ~sy) | (S2 & ~S1 & ~S0 & sy2);

        // Salidas
        assign M[2] = S2 & ~S1;
        assign M[1] = ~S2 & S1;
        assign M[0] = (~S2 & S0) | (~S1 & S0);
        assign HOME = ~S1;

        // FlipFlop
        D3FlipFlop FF01(clk, reset, SF_000, S_000);
endmodule

module Cama_Hotend(
    input wire clk, reset, PB, sh, T1, T2, T3, AB,
    input wire [1:0]F,
    output wire EN, EN0, EN1, HT,
    output wire [2:0]LCD,
    output wire [1:0]CH,
    output wire [1:0]PH);

        wire [3:0]S_0000;
        wire [3:0]SF_0000;
        wire S0, S1, S2, S3;
        wire SF0, SF1, SF2, SF3;

        assign SF_0000[0] = SF0;
        assign SF_0000[1] = SF1;
        assign SF_0000[2] = SF2;
        assign SF_0000[3] = SF3;
        
        // Estados futuros
        assign SF3 = (S3 & ~S2 & ~S1) | (S3 & ~S2 & ~S0 & ~AB) | (~S2 & ~S1 & S0 & F[1] & F[0]);
        assign SF2 = (~S3 & S2 & ~AB) | (~S3 & S2 & ~S1 & S0) | (~S3 & S2 & S1 & ~S0) | (~S3 & ~S1 & S0 & F[1] & ~F[0]) | (~S3 & ~S2 & S1 & S0 & T1);
        assign SF1 = (~S3 & S1 & ~S0) | (~S3 & ~S2 & S1 & ~T1) | (~S3 & S2 & S1 & ~AB) | (~S2 & S1 & ~S0 & ~AB) | (~S3 & S2 & ~S1 & S0 & T2) | (S3 & ~S2 & ~S1 & S0 & T3) | (~S3 & ~S2 & ~S1 & S0 & ~F[1] & F[0]);
        assign SF0 = (~S3 & ~S2 &  ~S1 & S0 & ~F[0]) | (~S3 & ~S2 & S1 & ~S0 & T1) | (~S3 & ~S2 & S1 & S0 & ~T1) | (~S3 & S2 & S1 & ~S0 & T2) | (~S3 & S2 & ~S1 & S0 & ~T2) | (S3 & ~S2 & ~S1 & ~S0 & T3) | (S3 & ~S2 & ~S1 & S0 & ~T3) | (~S3 & ~S2 & ~S1 & ~S0 & sh & PB) | (~S3 & S2 & S1 & S0 & ~AB);

        // Salidas
        assign LCD[2] = (~S3 & S2 & ~S1) | (~S3 & S2 & S0) | (S3 & ~S2 & ~S0);
        assign LCD[1] = (~S3 & ~S2 & S1) | (S3 & ~S2 & ~S1) | (~S3 & S1 & ~S0);
        assign LCD[0] = (~S3 & ~S2 & S0) | (~S3 & ~S1 & S0) | (~S2 & ~S1 & S0) | (~S3 & S2 & S1 & ~S0);
        assign CH[1] = (~S3 & S2) | (~S2 & ~S1 & ~S0);
        assign CH[0] = (~S2 & ~S0);
        assign PH[0] = (S3 & ~S2 & ~S1) | (~S3 & ~S0);
        assign PH[1] = (S3 & ~S2 & ~S1) | (~S3 & S1 & S0);
        assign EN = ~S3;
        assign EN0 = S3;
        assign EN1 = ~S2 & ~S1;
        assign HT = (~S3 & ~S1) | (~S2 & ~S0) | (~S3 & S2 & S0);

        //FLipFlop
        D4FlipFlop FF10(clk, reset, SF_0000, S_0000);
endmodule

module Indicadores(
    input wire clk, reset, O, P, HT, P2,
    input wire [1:0]PH,
    input wire [1:0]CH,
    output wire [2:0]W);

        wire [2:0]S_000;
        wire [2:0]SF_000;
        wire S0, S1, S2;
        wire SF0, SF1, SF2;

        assign SF_000[0] = SF0;
        assign SF_000[1] = SF1;
        assign SF_000[2] = SF2;

        // Estados Futuros
        assign SF2 = (~S2 & S1 & ~S0 & P) | (S2 & ~S1 & ~S0 & ~HT) | (S2 & ~S1 & S0 & ~P2) | (S2 & S1 & ~S0 & ~P2) | (S2 & ~S1 & ~S0 & PH[1] & PH[0] & CH[1] & CH[0]) | (S2 & ~S1 & ~S0 & PH[1] & ~PH[0] & CH[1] & ~CH[0]);
        assign SF1 = (~S2 & ~S1 & ~S0 & O) | (~S2 & S1 & ~S0 & ~P) | (~S2 & S1 & S0 & ~P2) | (S2 & S1 & ~S0 & ~P2) | (S2 & ~S1 & ~S0 & HT & PH[1] & PH[0] & CH[1] & CH[0]) | (S2 & ~S1 & ~S0 & HT & ~PH[1] & PH[0] & ~CH[1] & CH[0]);
        assign SF0 = (~S2 & S1 & S0 & ~P2) | (S2 & ~S1 & S0 & ~P2) | (S2 & ~S1 & ~S0 & HT & ~PH[1] & PH[0] & ~CH[1] & CH[0]) | (S2 & ~S1 & ~S0 & HT & PH[1] & ~PH[0] & CH[1] & ~CH[0]);

        // Salidas
        assign W[2] = (S2 & ~S1) | (S2 & ~S0);
        assign W[1] = (~S2 & S1) | (S1 & ~S0);
        assign W[0] = (~S2 & S1 & S0) | (S2 & ~S1 & S0);

        //FlipFlop
        D3FlipFlop FF11(clk, reset, SF_000, S_000);
endmodule

module FSM(
    input wire clk, reset, signal, lector, encen, conti, sz, sx, sy, sy2, sh,
    input wire [1:0]F,
    output wire [1:0]C,
    output wire [2:0]LCD,
    output wire [2:0]M,
    output wire [2:0]W);

        wire op, P2, P, HT, EN, EN0, EN1, HOME, T1, T2, T3;
        wire [1:0]CH;
        wire [1:0]PH;

        Antirebotes M001(clk, reset, signal, op);
        Control M010(clk, reset, encen, lector, C, P, P2);
        Motores M011(clk, reset, P, sz, sx, sy, sy2, sh, M, HOME);
        Cama_Hotend M100(clk, reset, PB, HOME, T1, T2, T3, AB, F, EN, EN0, EN1, HT, LCD, CH, PH);
        Indicadores M101(clk, reset, encen, HT, P2, LCD, PH, CH, W);
        timer01 M110(EN, T1);
        timer02 M111(EN0, T2);
        timer03 M000(EN1, T3);
endmodule