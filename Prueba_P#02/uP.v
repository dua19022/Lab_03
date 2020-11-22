// Electronica Digital 1  |
// Proyecto 2             |
// Marco Duarte           |
//                        |
// ----------------------- 

module FFDE_1(
    input wire clk, reset, En, D, 
    output reg Q);

    always @ (posedge clk or posedge reset) begin
        if (reset) 
            Q <= 1'b0;
        else if (En)
            Q <= D;
    end
endmodule

module FFD_1(
    input wire clk, reset, D, 
    output reg Q);

    always @ (posedge clk or posedge reset) begin
        if (reset) 
            Q <= 1'b0;
        else 
            Q <= D;
    end
endmodule

module phase(
    input wire clk, reset, 
    output wire Q);
    
        FFD_1 U1(clk, reset, ~Q, Q);
endmodule

module FFD_2(
    input wire clk, reset, En, 
    input wire [1:0]D2, 
    output wire [1:0]Q2);

    FFDE_1 U1(clk, reset, En, D2[1], Q2[1]);
    FFDE_1 U2(clk, reset, En, D2[0], Q2[0]);

endmodule


module FFD_4(
    input wire Clk, reset, En,
    input wire [3:0]D, 
    output wire [3:0]Q);

    FFD_2 U1(Clk, reset, En, D[3:2], Q[3:2]);
    FFD_2 U2(Clk, reset, En, D[1:0], Q[1:0]);

endmodule

module Flags(
    input wire clock, reset, En,
    input wire D1, D2,
    output wire Ze, C);

        FFDE_1 U1(clock, reset, En, D1, Ze);
        FFDE_1 U2(clock, reset, En, D2, C);

endmodule

module FFT( 
    input wire clk, reset, EN,
    output wire Q);

        // Aca declaro que la entrada sea Q negada
        FFDE_1 U1(clk, reset, EN, ~Q, Q); 
endmodule

module PC(
    input wire Clk, reset, En, non,
    input wire [11:0]load,
    output reg [11:0]exit);

        always @ (posedge Clk or posedge reset)begin 
            if (reset == 1) // Empieza en 0
                exit <= 12'b000000000000;
            
            else if(non == 1) // Mientras non sea 1, el valor va a ser el de load
                exit <= load;

            else if(En == 1 && ~non) // Cada vez que pase el clock se le suma uno
            exit <= exit + 1;
        end

            
endmodule

module ROM(
    input [11:0]addr, // La direccion
    output [7:0]info); // La cantidad de bits que se desea ver

        reg [7:0] Memory [0:4095]; // Ajustamos el tamaño de nuestra memoria
        // En este caso es de 8 bits por 4k de localidades
        
        initial begin
        // Esto se inicializa para llamar al archivo que guarda nuestro datos
            $readmemh("memory.list", Memory);
        end

        // Aqui se le asisgna el valor a la memoria 
        assign info = Memory[addr];
endmodule

module Fetch(
    input wire Clk, reset, En2,
    input wire [7:0]D4,
    output wire [3:0]Q1,
    output wire [3:0]Q2);
    // Se crean dos salidas de 4 bits debido que el fetch requiere dos salidas

        FFD_4 U1(Clk, reset, En2, D4[7:4], Q1);
        FFD_4 U2(Clk, reset, En2, D4[3:0], Q2);
endmodule

module BTri(
    input wire En,
    input wire [3:0]entradas,
    output wire [3:0]salidas);

        assign salidas = (En) ? entradas:4'bz;
endmodule

module ALU(
    input wire [3:0] A, B,
    input [2:0] command,
    output carry, zero,
    output [3:0] result);
    
    reg [4:0] q;
    
    always @ (A, B, command)
        case (command)
            3'b000: q = A; // Dejar pasar A
            3'b001: q = A - B; // resta
            3'b010: q = B; // Dejar pasar B
            3'b011: q = A + B; // Sumar
            3'b100: q = {1'b0, ~(A & B)}; // Comparador
            default: q = 5'b10101;
        endcase
    
    assign result = q[3:0];
    assign carry = q[4];
    assign zero = ~(q[3] | q[2] | q[1] | q[0]);
    
endmodule


module RAM(
    input wire En, write,
    input wire [11:0]addres,
    output wire [3:0]Data);

    reg [3:0]RAM[0:4095]; // Aca se define el tamaño de la RAM
    reg [3:0]dataout; // Se declaran las salidas de la RAM
    assign Data = (En && ~write) ? dataout: 4'bzzzz; // Se indica cuando esta en alta impedancia

    always @(En, write, addres, Data) begin // Se inicializa un always
        
        if (En && ~write)
            dataout = RAM[addres];
        if (En && write)
            RAM[addres] = Data; 
            
        end
endmodule

module ACCU(
    input wire clk, reset, En,
    input wire [3:0]D, 
    output wire [3:0]Q);

      FFD_2 U1(clk, reset, En, D[3:2], Q[3:2]);
      FFD_2 U2(clk, reset, En, D[1:0], Q[1:0]);
endmodule

module Decode(
    input wire [6:0] in,
    output wire [12:0] outD);
    
    reg [12:0] out;
    
    always @ (in)
        casez(in)
            // any
            7'b????_??0: out <= 13'b1000_000_001000;
            // JC
            7'b0000_1?1: out <= 13'b0100_000_001000;
            7'b0000_0?1: out <= 13'b1000_000_001000;
            // JNC
            7'b0001_1?1: out <= 13'b1000_000_001000;
            7'b0001_0?1: out <= 13'b0100_000_001000;
            // CMPI
            7'b0010_??1: out <= 13'b0001_001_000010;
            // CMPM
            7'b0011_??1: out <= 13'b1001_001_100000;
            // LIT
            7'b0100_??1: out <= 13'b0011_010_000010;
            // IN
            7'b0101_??1: out <= 13'b0011_010_000100;
            // LD
            7'b0110_??1: out <= 13'b1011_010_100000;
            // ST
            7'b0111_??1: out <= 13'b1000_000_111000;
            // JZ
            7'b1000_?11: out <= 13'b0100_000_001000;
            7'b1000_?01: out <= 13'b1000_000_001000;
            // JNZ
            7'b1001_?11: out <= 13'b1000_000_001000;
            7'b1001_?01: out <= 13'b0100_000_001000;
            // ADDI
            7'b1010_??1: out <= 13'b0011_011_000010;
            // ADDM
            7'b1011_??1: out <= 13'b1011_011_100000;
            // JMP
            7'b1100_??1: out <= 13'b0100_000_001000;
            // OUT
            7'b1101_??1: out <= 13'b0000_000_001001;
            // NANDI
            7'b1110_??1: out <= 13'b0011_100_000010;
            // NANDM
            7'b1111_??1: out <= 13'b1011_100_100000;
            default: out <= 13'b1111111111111;
        endcase
        
    assign outD = out;
endmodule

module uP(
    input wire clock, reset,
    input wire [3:0]pushbuttons,
    output wire phase, c_flag, z_flag,
    output wire [3:0] instr, oprnd, accu, data_bus, FF_out,
    output wire [7:0] program_byte,
    output wire [11:0] PC, address_RAM);

        wire [3:0] ALU_out;
        wire [12:0]out_decoder;
        wire [6:0]in_decoder;
        wire Ze, C;

        assign address_RAM = {oprnd, program_byte};
        assign in_decoder = {instr, c_flag, z_flag, phase};

        FFT Phase(clock, reset, 1'b1, phase);
        Decode Decoder(in_decoder, out_decoder);
        Flags flags_carry(clock, reset, out_decoder[9], Ze, C, z_flag, c_flag);
        ALU ALU(accu, data_bus, out_decoder[8:6], C, Ze, ALU_out);
        BTri BusFetch(out_decoder[1], oprnd, data_bus);
        BTri BusIn(out_decoder[2], pushbuttons, data_bus);
        BTri BusALU(out_decoder[3], ALU_out , data_bus);
        FFD_4 OutputsFFD4(clock, reset, out_decoder[0], data_bus, FF_out);
        Fetch Fetch(clock, reset, ~phase, program_byte, instr, oprnd);
        PC ProgramCounter(clock, reset, out_decoder[12], out_decoder[11], address_RAM, PC);
        ROM ROMm(PC, program_byte);
        RAM RAMm(out_decoder[5], out_decoder[4], address_RAM, data_bus);
        ACCU Accumulator(clock, reset, out_decoder[10], ALU_out, accu);
endmodule   