// Electronica Digital
// Marco Duarte
// Lab_10
// Ejercicio 01
// Union de modulos

// Se crea un flipflop de 4 bits para poder crear el FETCH
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

module counter12(
    input wire Clk, reset, En, non,
    input wire [11:0]load,
    output reg [11:0]exit);

        always @ (posedge Clk or posedge reset or posedge non)begin 
            if (reset == 1) // Empieza en 0
                exit <= 12'b000000000000;
            
            else if(En == 1) // Cada vez que pase el clock se le suma uno
                exit <= exit + 1;
            
            else if(non == 1) // Mientras non sea 1, el valor va a ser el de load
                exit <= load;
            end

endmodule

module ROM(
    input wire[11:0]lecture, // La direccion
    output wire [7:0]data); // La cantidad de bits que se desea ver

        reg [7:0] Memory[0:4095]; // Ajustamos el tamaño de nuestra memoria
        // En este caso es de 8 bits por 4k de localidades
        
        initial begin
        // Esto se inicializa para llamar al archivo que guarda nuestro datos
            $readmemb("memory.marco", Memory);
        end

        // Aqui se le asisgna el valor a la memoria 
        assign data = Memory[lecture];
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

module fusion(
    input wire Clk, reset, En, non, En2,
    input wire [11:0]load,
    output wire [3:0]Q1,
    output wire [3:0]Q2);

        wire [11:0]A;
        wire [7:0]B;

        counter12 U1(Clk, reset, En, non, load, A);
        ROM U2(A, B);
        Fetch U3(Clk, reset, En2, B, Q1, Q2);
endmodule


