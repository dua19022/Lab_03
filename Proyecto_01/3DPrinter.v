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
    output wire T1);

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
    output wire T2);

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
    output wire T3);

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
    input wire reset, clk, signal,
    output wire out);

        wire inc;
        wire ot;

        assign inc = signal;
        assign out = ~ot & signal;

        DFlipFlop AR(clk, reset, signal, out);
endmodule

// Maquina de Control
module Control(
    input wire
)


