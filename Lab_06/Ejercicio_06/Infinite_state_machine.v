// Electronica Digital 1
// Marco Duarte
// Ejercicio 01 en verilog

module FFD_1(input clk, reset, D, output reg Q);

    always @ (posedge clk or posedge reset) begin
        if(reset)
            Q <= 1'b0;
        else
            Q <= D;
    end
endmodule

module mach_1(input wire A, B, clk, reset, output Y, output [1:0]SP, output [1:0]SF);

    wire S1, S0, D1, D0;

    assign S0 = (D1 & B) | (D0 & A & B);
    assign S1 = (~D0 & D1 & A);
    assign Y = D1 & A & B;

    FFD_1 U1(clk, reset, S1, D1);
    FFD_1 U2(clk, reset, S0, D0);

endmodule

module mach_2(input wire clk, reset, push_boton, output wire Y3, Y2, Y1);

    wire