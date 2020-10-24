// Electronica Digital 1
// Marco DUarte 
// Testbench
//---------------------------

module testbench();

reg [3:0]A;
reg [3:0]B;
reg [2:0]command;
wire [3:0]result;

ALU test(A, B, command, result);

initial begin
    #1
    $display("--------------------------------------------");
    $display("|   A    |   B     |   C    |   Result     |");
    $monitor("|  %b  |  %b   |  %b   |     %b     |", A, B, command, result);
        A = 4'b0000; B = 4'b0000; command = 3'b000;
    #1 A = 4'b0001; B = 4'b0001; command = 3'b000;
    #1 A = 4'b0001; B = 4'b0000; command = 3'b000;
    #1 A = 4'b0100; B = 4'b0110; command = 3'b000;
    #1 A = 4'b0001; B = 4'b0001; command = 3'b001;
    #1 A = 4'b0001; B = 4'b0000; command = 3'b001;
    #1 A = 4'b0000; B = 4'b0000; command = 3'b001;
    #1 A = 4'b0001; B = 4'b0001; command = 3'b010;
    #1 A = 4'b0010; B = 4'b0010; command = 3'b010;
    #1 A = 4'b0001; B = 4'b0001; command = 3'b010;
    #1 A = 4'b0001; B = 4'b0001; command = 3'b100;
    #1 A = 4'b0001; B = 4'b0000; command = 3'b100;
    #1 A = 4'b0001; B = 4'b0001; command = 3'b101;
    #1 A = 4'b0001; B = 4'b0000; command = 3'b101;
    #1 A = 4'b0001; B = 4'b0001; command = 3'b110;
    #1 A = 4'b1000; B = 4'b0001; command = 3'b110;
    #1 A = 4'b1000; B = 4'b1000; command = 3'b111;
    #1 A = 4'b0000; B = 4'b0001; command = 3'b111;
    #1 A = 4'b0001; B = 4'b0001; command = 3'b011;
end

initial 
    #21 $finish;

initial begin
   $dumpfile("ALU_tb.vcd");
   $dumpvars(0, testbench); 
end

endmodule