// Electronica Digital 
// Marco Duarte - 19022
// Laboratorio 8
// Testbench
// -----------------------

module testbench();

reg [11:0]lecture; // Las entradas de la ROM
wire [7:0]data; // Las salidas de la ROM

// Llamamos al modulo
ROM mem(lecture, data);

initial begin
    #1
    $display("----------------------");
    $display("----------ROM---------");
    $display(" Localidad  |  Lectura");
    $monitor("     %b     |     %b", lecture, data);
        lecture = 12'b000000000000;
    #1  lecture = 12'b000000000001;
    #1  lecture = 12'b000000000010;
    #1  lecture = 12'b000000000011;
    #1  lecture = 12'b000000000100;
    #1  lecture = 12'b000000000101;
    #1  lecture = 12'b000000000110;
    #1  lecture = 12'b000000000111;
    #1  lecture = 12'b000000001000;
    #1  lecture = 12'b000000001001;
    
end

    initial 
    #200 $finish;

initial begin
   $dumpfile("ROM_tb.vcd");
   $dumpvars(0, testbench); 
end

endmodule