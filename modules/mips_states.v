`timescale 1ns/1ns
module mips_states (instr, reg_res, ALUSrc, MemToReg, RegWrite, MemWrite, MemRead, branch, eq, goto, Sign, ALUCtrl);

input [31:0] instr;
output reg reg_res, ALUSrc, MemToReg, RegWrite, MemWrite, MemRead, branch, eq, goto, Sign;
output reg [5:0] ALUCtrl;

always @(instr) 
case (instr[31:26])
  6'b000000: // R-type
  begin
    reg_res <= 1;
    ALUSrc <= 0;
    MemToReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= instr[5:0];
    goto <= 0;
    Sign <= 0;
  end
  6'b100011:  // lw
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 1;
    RegWrite <= 1;
    MemRead <= 1;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b100000;
    goto <= 0;
    Sign <= 0;
  end
  6'b101011: // sw
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 0;
    RegWrite <= 0;
    MemRead <= 0;
    MemWrite <= 1;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b100000;
    goto <= 0;
    Sign <= 0;
  end
  6'b000100: //beq
  begin
    reg_res <= 0;
    ALUSrc <= 0;
    MemToReg <= 0;
    RegWrite <= 0;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 1;
    eq <= 1;
    ALUCtrl <= 6'b100010;
    goto <= 0;
    Sign <= 1;
  end
  6'b000101: //bne
  begin
    reg_res <= 0;
    ALUSrc <= 0;
    MemToReg <= 0;
    RegWrite <= 0;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 1;
    eq <= 0;
    ALUCtrl <= 6'b100010;
    goto <= 0;
    Sign <= 1;
  end
  6'b001000: //addi
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b100000;
    goto <= 0;
    Sign <= 1;
  end
  6'b001001: //OP_ADDIU = 6'b001001;
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b100001;
    goto <= 0;
    Sign <= 0;
  end
  6'b100101: //OP_ANDI = 6'b100101;
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b100100;
    goto <= 0;
    Sign <= 1;
  end
  6'b100111: //OP_ORI = 6'b100111;
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b100101;
    goto <= 0;
    Sign <= 1;
  end
  6'b100100: //OP_ANDIU = 6'b100100;
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b100100;
    goto <= 0;
    Sign <= 0;
  end
  6'b100110: //OP_ORI = 6'b100110;
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b100101;
    goto <= 0;
    Sign <= 0;
  end
  6'b100011: //OP_SLTI = 6'b100011;
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b101010;
    goto <= 0;
    Sign <= 1;
  end
  6'b100010: //OP_SLTIU = 6'b100010;
  begin
    reg_res <= 0;
    ALUSrc <= 1;
    MemToReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b101011;
    goto <= 0;
    Sign <= 0;
  end
  6'b000001: //OP_J = 6'b000001;
  begin
    reg_res <= 0;
    ALUSrc <= 0;
    MemToReg <= 0;
    RegWrite <= 0;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b000000;
    goto <= 1;
    Sign <= 0;
  end
  default:
  begin
    reg_res <= 0;
    ALUSrc <= 0;
    MemToReg <= 0;
    RegWrite <= 0;
    MemRead <= 0;
    MemWrite <= 0;
    branch <= 0;
    eq <= 0;
    ALUCtrl <= 6'b000000;
    goto <= 0;
    Sign <= 0;
  end
endcase
endmodule
