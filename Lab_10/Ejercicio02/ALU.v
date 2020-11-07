// Electronica Digital
// Marco Duarte
// Lab_10
// Ejercicio 01
// Union de modulos

module FFD_4(
    input wire Clk, reset, En,
    input wire [3:0]D, 
    output reg [3:0]Q);

    always @ (posedge Clk or posedge reset) begin
        if (reset) 
            Q <= 4'b0000;
        else if (En)
            Q <= D;
    end
endmodule

module BTri(
    input wire En1,
    input wire [3:0]entradas,
    output wire [3:0]salidas);

        assign salidas = (En1) ? entradas:4'bz;
endmodule

module ALU(
    input wire [3:0]A, // Los bits para seleccionar en A
    input wire [3:0]B, // Los bits para seleccionar en B
    input wire [2:0]command, // Aca es donde le damos la instruccion a la ALU
    output reg [3:0]result,
    output reg carry,
    output reg exit); // El resultado de la operacion que se haga

        reg [4:0]q; //Registro que se tiene internamente

        always @ (A or B or command) begin

            // El case sirve para asignarle un valor a cada opcion
            case(command)

                3'b000: begin
                            q = 5'b00000; // Deja pasar A
                            q = A;
                            carry = 1'b0;
                            exit = 1'b0;
                            result = q[3:0];
                        end

                3'b001: begin
                            q[4:0] = 5'b00000; // Deja pasar A
                            q = A - B; // Esta es la accion de comparar
                            carry = q[4];
                            exit = (q == 5'b00000);
                            result = q[3:0];
                        end
                
                3'b010: begin
                            q[4:0] = 5'b00000; // Funciona de reset
                            q = B;
                            carry = 1'b0;
                            exit = 1'b0;
                            result = q[3:0];
                        end

                3'b011: begin
                            q[4:0] = 5'b00000; // Funciona de reset
                            q = A + B;
                            carry = q[4];
                            exit = (q == 5'b00000);
                            result = q[3:0];
                        end

                3'b100: begin
                            q = 5'b00000; // Funciona de reset
                            q = ~(A & B);
                            carry = 1'b0;
                            exit = 1'b0;
                            result = q[3:0];
                        end

            endcase
        end
endmodule

module main(
    input wire [3:0]entradas,
    input wire En1, Clk, reset, En, En2,
    input wire [2:0]command,
    output wire carry, exit,
    output wire [3:0]out);

        wire [3:0]a;
        wire [3:0]b;
        wire [3:0]exit_alu;

        BTri U1(entradas, En1, b);
        FFD_4 U2(Clk, reset, En, exit_alu, a);
        BTri U3(exit_alu, En2, out);
        ALU U4(a, b, command, exit_alu, carry, exit);

endmodule
