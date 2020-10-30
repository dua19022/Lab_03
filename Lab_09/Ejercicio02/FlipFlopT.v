//Electronica Digital 1
// Marco Duarte
// Ejercicio 02
// FlipFlop tipo T


module FFD(
    input wire clk, reset, En, D,
    output reg Q);

        always @(posedge clk or posedge reset) begin
            if(reset)
                Q <= 0;
            else if (En)
                Q <= D; 
        end
endmodule

module FFT(
    input wire clk, reset, En,
    output wire Q);

        // Aca declaro que la entrada sea Q negada
        FFD U1(clk, reset, En, ~Q, Q); 
endmodule