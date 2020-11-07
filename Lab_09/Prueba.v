module FFD(input wire clk, EN, reset, input wire C, output reg D);
  always @ (posedge clk, posedge reset) begin

// Non-blockinf assigment
    if(reset) // Colocar todos los valores en 0
      D <= 1'b0;

    else if(EN == 1) // Enabled encendido cuenta cuenta cada flanco del reloj
      D <= C;
  end
endmodule


// Flip FLop JK

module FFJK(input wire clk, EN, reset, input wire J, K, output Q);
  wire D, QN, KN, Y1, Y2;

  not(QN, Q);
  not(KN, K);
  and(Y1, KN, Q);
  and(Y2, J, QN);
  or(D, Y1, Y2);

  FFD A1(clk, EN, reset, D, Q);

endmodule
