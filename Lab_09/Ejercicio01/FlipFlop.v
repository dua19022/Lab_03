// Electronica Digital 1
// Marco Duarte
// Ejercicio 01
// FlipFlop

module FFD_1(
    input wire clk, reset, En, D, 
    output reg Q);

    always @ (posedge clk or posedge reset) begin
        if (reset) 
            Q <= 1'b0;
        else if (En)
            Q <= D;
    end
endmodule

module FFD_2(
    input wire clk, reset, En, 
    input wire [1:0]D2, 
    output wire [1:0]Q2);

    FFD_1 U1(clk, reset, En, D2[1], Q2[1]);
    FFD_1 U2(clk, reset, En, D2[0], Q2[0]);

endmodule

module FFD_4(
    input wire clk, reset, En,
    input wire [3:0]D4, 
    output wire [3:0]Q4);

    FFD_2 U1(clk, reset, En, D4[1:0], Q4[1:0]);
    FFD_2 U2(clk, reset, En, D4[3:2], Q4[3:2]);

endmodule