// Electronica Digital 
// Marco Duarte - 19022
// Laboratorio 8
// ROM de 4k x 8
// --------------------------

module ROM(
    input wire[11:0]lecture, // La direccion
    output wire [7:0]data); // La cantidad de bits que se desea ver

        reg [7:0] Memory[0:4095]; // Ajustamos el tamaño de nuestra memoria
        // En este caso es de 8 bits por 4k de localidades
        
        // Esto se inicializa para llamar al archivo que guarda nuestro datos
        initial begin 
            $readmemb("memory.marco", Memory);
        end

        // Aqui se le asisgna el valor a la memoria 
        assign data = Memory[lecture];
endmodule