//====================================================
// Instruction Memory - RISC-V RV32I
//====================================================
module instr_mem (
    input  logic [31:0] addr,
    output logic [31:0] instr
);

    // Arreglo memoria de 256 palabras de 32 bits
    // Inicializado con program.mif
    (* ram_init_file = "program.mif" *)
    reg [31:0] mem [0:255];

    // Lee instrucciones por palabra
    assign instr = mem[addr[9:2]];

endmodule
