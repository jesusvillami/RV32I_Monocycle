# RV32I Monociclo

Este repositorio contiene la implementación completa de un procesador **RISC-V RV32I monociclo**, desarrollado como parte del curso de Arquitectura de Computadores.

El proyecto incluye:

- Diseño e implementación en **SystemVerilog**
- Todos los módulos fundamentales del datapath y control
- Testbenches completos para simulación
- Soporte para instrucciones RV32I básicas
- Integración opcional con FPGA **DE1-SoC**
- Visualización en LEDs y displays de 7 segmentos

## Características principales

### Arquitectura monociclo
- Un solo ciclo por instrucción
- Datapath completamente combinacional (excepto PC y memories)

### Soporte de instrucciones
Incluye las familias:
- **R-type** (ADD, SUB, SLL, SRL, AND, OR, XOR, SLT…)
- **I-type** (ADDI, LW, JALR…)
- **S-type** (SW)
- **B-type** (BEQ, BNE, BLT, BGE…)
- **U-type** (AUIPC)
- **J-type** (JAL)

### Componentes implementados
- ALU y ALU Control
- Unidad de control
- Unidad de branch
- Immediate generator
- Register file
- PC y PC Adder
- Instruction Memory (inicializable con MIF)
- Data Memory
- MUXes requeridos (ALU, PC, WB)


## Cómo simular

### Requisitos
- Icarus Verilog  
- Wavetrace 

### Simulación de la CPU completa

```bash
cd tb
iverilog -g2012 -o cpu_tb.vvp ../src/*.sv cpu_tb.sv
vvp cpu_tb.vvp 


