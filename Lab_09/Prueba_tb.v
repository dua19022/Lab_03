module testbench();

  // inputs
  reg clk, EN, reset;
  reg J, K;

  // Outputs
  wire Q;

  // Clock
  always
    #1 clk = ~clk;

  // Instanciar el módulo
  FFJK A1(clk, EN, reset, J, K, Q);

  initial begin
    #1
    $display("\n");
    $display("Flip Flop JK");
    $display("\n");
    $display("----------------------|-----|");
    $display(" clk  EN  reset  J  K  |  Q  |");
    $display("-----------------------|-----|");
    $monitor("%b    %b    %b    %b   %b   |  %b  |", clk, EN, reset, J, K, Q);

    #1 clk = 0; reset = 1; EN = 1; J = 0; K = 0;
    #5 reset = 0; EN = 1;
    #5 J = 1;
    #5 K = 1;
    #5 J = 0;
    #5 J = 1; K = 0;

  end

    initial
      #70 $finish;

  // GTKwave para el diagrama de timing
    initial begin
      $dumpfile("Prueba_tb.vcd");
      $dumpvars(0, testbench);
    end
endmodule