// Marco Duarte
// Ejercicio 05
// FlipFlop de 4 bits

module FFD_1(input wire clk, reset, input wire [3:0]D, output reg [3:0]Q);

    always @ (posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
            [3:0]Q <= 4'b 0000;
        
            Q <= D;
    end
endmodule

module FFD_2(input clk, reset, input [1:0] D, output reg [1:0] Q);

    FFD_1 U1(clk, reset, D[1], Q[1]);
    FFD_1 U2(clk, reset, D[0], Q[0]);

endmodule

module FFD_4(input clk, reset, input [3:0] D, output reg [3:0] Q);

    FFD_1 U1(clk, reset, D[3], Q[3]);
    FFD_1 U2(clk, reset, D[2], Q[2]);
    FFD_1 U3(clk, reset, D[1], Q[1]);
    FFD_1 U4(clk, reset, D[0], Q[0]);

endmodule