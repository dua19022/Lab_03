// Marco Duarte
// Laboratorio 08
// Contador de 12 bits
// ---------------------------------------

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
