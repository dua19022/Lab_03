// Marco Duarte
// TestBench
// Ejercicio 05

module testbench();

reg En;
reg [6:0]in;
wire [12:0]out;

ROML U01(En, in, out);

initial begin
    #1
    $display("-----------------");
    $display("| Enable | Input | Output |");
    $monitor("|   %b    |   %b  |   %b   |", En, in, out);
    En = 0; in = 7'b0101010;
    #2 En = 1; in = 7'b0101010;
    #2 in = 7'b0000101;
    #2 in = 7'bxxxxxx0;
    #2 in = 7'b00001x1;
    #2 in = 7'b00000x1;
    #2 in = 7'b00011x1;
    #2 in = 7'b00010x1;
    #2 in = 7'b0010xx1;
    #2 in = 7'b0011xx1;
    #2 in = 7'b0100xx1;
    #2 in = 7'b0101xx1;
    #2 in = 7'b0110xx1;
    #2 in = 7'b0111xx1;
    #2 in = 7'b1000x11;
    #2 in = 7'b1000x01;
    #2 in = 7'b1001x11;
    #2 in = 7'b1001x01;
    #2 in = 7'b1010xx1;
    #2 in = 7'b1011xx1;
    #2 in = 7'b1100xx1;
    #2 in = 7'b1101xx1;
    #2 in = 7'b1110xx1;
    #2 En = 0; in = 7'b1110xx1;
    #2 En = 1; in = 7'b1101011;
    #2 in = 7'b11x1x01;
    #2 in = 7'b1xx1xx1;
    #2 in = 7'b1x10xx1;
    #2 in = 7'b10x10x1;
    #2 in = 7'bxx10xx1;
    #2 in = 7'b0000xx1;
    #2 in = 7'bxxxx1xx;
    #2 in = 7'b0110xx1;
    #2 in = 7'b0010xx1;

end

initial
    #100 $finish;

initial begin
    $dumpfile("ROM_tb.vcd");
    $dumpvars(0, testbench); 
end

endmodule