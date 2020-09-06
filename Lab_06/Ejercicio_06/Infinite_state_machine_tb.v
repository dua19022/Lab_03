// Testbench Infinite state machine
// Marco Duarte

module testbench();

    reg clk, reset, A, B;
    wire [1:0]SF, SP;
    wire Y;

    mach_1 C1(A, B, clk, reset, Y, SF, SP);

    initial begin
        $display("clock reset A B | Y");
        $display("----------------|--");
        $monitor("%b %b %b %b | %b", clk, reset, A, B, SF, SP, Y);
        clk = 0; reset = 0; A = 0; B = 0;
        #1 reset = 1;
        #1 reset = 0; 
        #10 A = 0; B = 0;
        #10 A = 1; B = 0;
        #10 A = 0; B = 1;
        #10 A = 0; B = 1;
        #10 A = 0; B = 0;
    end

    always
        #5 clk = ~clk;

    initial begin
        #55 $finish;
    end
endmodule