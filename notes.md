
---

# 📄 **notes.md **

```markdown
# Notas del Proyecto – Procesador RV32I Monociclo (SystemVerilog)

Este documento detalla las decisiones de diseño, problemas encontrados y justificación de ciertos módulos dentro del procesador.

---

# 🧱 Decisiones de diseño

## 1. Arquitectura monociclo
Se eligió por simplicidad conceptual y facilidad para validar cada módulo de manera independiente.

## 2. Separación ALU / ALU Control
La ALU implementa solo operaciones aritméticas.  
El módulo `alu_control` decodifica (ALUOp, funct3, funct7) para reducir complejidad en el datapath.

## 3. Immediate Generator
Implementado con concatenaciones y extensiones de signo siguiendo el estándar RV32I.

## 4. Unidad de branch independiente
Evita mezclar lógica de comparación dentro de la ALU.  
Simplifica el cálculo de `branch_target = pc + imm`.

## 5. Instruction Memory inicializada con MIF
Quartus no permite `$readmemh` en hardware, así que se utilizó:

```verilog
(* ram_init_file = "program.mif" *)
