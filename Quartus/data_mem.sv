//====================================================
// Data Memory - RISC-V RV32I
//====================================================
module data_mem (
    input  logic        clk,
    input  logic        mem_write,
    input  logic        mem_read,
    input  logic [31:0] addr,
    input  logic [31:0] write_data,
    output logic [31:0] read_data
);

    // Memoria con inicialización desde MIF
    (* ram_init_file = "data.mif" *)
    reg [31:0] mem [0:255];

    // Lectura
    assign read_data = mem[addr[9:2]];

    // Escritura
    always_ff @(posedge clk) begin
        if (mem_write)
            mem[addr[9:2]] <= write_data;
    end

endmodule

