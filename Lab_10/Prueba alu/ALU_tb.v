module testbench ();
  reg [3:0] A,B;
  reg [2:0]command;
  wire [3:0]result;
  wire carry, exit;

ALU test(A, B, command, result, carry, exit);
initial begin
#1
$display("---------------------------------------");
$display("|   A  |   B  |   Command  |  Result  | Carry | Zero");
$monitor("|  %b  |  %b  |   %b       |  %b      | %b    | %b  ", A, B, command, result, carry, exit);

   A = 4'b0001; B = 4'b0111; command = 3'b000;
#2 A = 4'b0001; B = 4'b0111; command = 3'b010;
#2 A = 4'b1000; B = 4'b1000; command = 3'b011;
#2 A = 4'b0111; B = 4'b0111; command = 3'b001;
#2 A = 4'b0111; B = 4'b0111; command = 3'b100;

end

initial
#21 $finish;

initial begin
  $dumpfile("ALU_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule //testbench