module fpga_top(
    input  logic clk_50mhz,

    output logic [7:0] leds,
    output logic [6:0] HEX0,
    output logic [6:0] HEX1,
    output logic [6:0] HEX2,
    output logic [6:0] HEX3,
    output logic [6:0] HEX4,
    output logic [6:0] HEX5
);

    logic clk_cpu;
    logic [31:0] pc_out;
    logic [31:0] instr_out;


    // CPU -> necesitamos que exponga la instrucción actual
    cpu_top CPU (
        .clk(clk_50mhz),
//        .reset(reset_btn),
        .pc_out(pc_out),
        .instr_out(instr_out)   
    );

    assign leds = pc_out[7:0];

    // Mostrar instrucción actual en HEX displays
    hex7seg H0(instr_out[3:0],   HEX0);
    hex7seg H1(instr_out[7:4],   HEX1);
    hex7seg H2(instr_out[11:8],  HEX2);
    hex7seg H3(instr_out[15:12], HEX3);
    hex7seg H4(instr_out[19:16], HEX4);
    hex7seg H5(instr_out[23:20], HEX5);

endmodule
