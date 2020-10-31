    //Electronica Digital 1
    // Marco Duarte
    // Ejercicio 03
    // FlipFlop tipo JK

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

module FFJK(
    input wire clk, reset, En, J, K,
    output wire Q);

        wire nQ, nK, aJ, aK, q;

        not(nQ, Q);
        not(nK, K);
        and(aJ, J, nQ);
        and(aK, nK, Q);
        or(q, aJ, aK);

        FFD U1(clk, reset, En, q, Q);
endmodule