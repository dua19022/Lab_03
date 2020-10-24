// Electronica Digital 1
// Marco Duarte - 19022
// Laboratorio 8
// ALU
//----------------------------

module ALU(
    input wire [3:0]A, // Los bits para seleccionar en A
    input wire [3:0]B, // Los bits para seleccionar en B
    input wire [2:0]command, // Aca es donde le damos la instruccion a la ALU
    output reg [3:0]result); // El resultado de la operacion que se haga


        always @ (A or B or command) begin

            // El case sirve para asignarle un valor a cada opcion
            case(command)
                3'b000: result = A & B; // Opcion de AND
                3'b001: result = A | B; // Opcion de OR
                3'b010: result = A + B; // Opcion de sumar
                3'b100: result = A & ~B; // Opcion de AND y B negado
                3'b101: result = A | ~B; // Opcion de OR y B negado
                3'b110: result = A - B; // Opcion de resta
                3'b111: result = (A < B) ? 1:0; // Opcion de comparacion si es A mayor que B 0000
                default: result = 3'b000; // Si no esta la opcion se asigna 0000
            endcase
        end
endmodule
