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
                            q[4:0] = 5'b00000; // Comparador
                            q = A - B;
                            carry = q[4];
                            exit = (q == 5'b00000);
                            result = q[3:0];
                        end
                
                3'b010: begin
                            q[4:0] = 5'b00000; // Deja pasar B
                            q = B;
                            carry = 1'b0;
                            exit = 1'b0;
                            result = q[3:0];
                        end

                3'b011: begin
                            q[4:0] = 5'b00000; // Funciona de suma
                            q = A + B;
                            carry = q[4];
                            exit = (q == 5'b00000);
                            result = q[3:0];
                        end

                3'b100: begin
                            q = 5'b00000; // Nand
                            q = ~(A & B);
                            carry = 1'b0;
                            exit = 1'b0;
                            result = q[3:0];
                        end

            endcase
        end
endmodule