`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 10:40:58
// Design Name: 
// Module Name: ALU_TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_TOP(input [3:0]A, B, 
               input [3:0]opcode_top,
               output reg[3:0]Y_final,
               output reg Cout, // Carry Flag
               output reg Z,  // Zero Flag
               output reg N,  // Negative Flag 
               output reg V);  // Overflow Flag
               
    wire [3:0]Y_temp;
    wire Cout_temp;
    
    // To instantiate we use part select to match the width of the opcode of 4_bit and outputs are stored in temporaray variables.
    ALU_4_bit top(.A_4bit(A), .B_4bit(B), .opcode_4bit(opcode_top[2:0]), .Y_4bit(Y_temp), .Cout(Cout_temp));
    
    always@(*) begin
        Y_final = Y_temp; // Default to cover 0-7 cases 
        Cout = Cout_temp; // Default to cover ADD and SUB 
        
        case(opcode_top)
            // Shift operators 
            4'b1000: begin Y_final = A<<1; Cout = 0; end //Shift Left Logical (SLL)
            4'b1001: begin Y_final = A>>1; Cout = 0; end //Shift Right Logical (SRL)
            4'b1010: begin Y_final = $signed(A) >>>1; Cout = 0; end // Shift Right Arithmetic (SRA); explicity made signed.
            
            // Comparison operators 
            4'b1011: begin Y_final = (A==B); Cout = 0; end // Set Equal (SEQ)
            4'b1100: begin Y_final = (A<B); Cout = 0; end // Set Less Than (SLT)
            4'b1101: begin Y_final = (A>B); Cout = 0; end // Set Greater Than (SGT)
            
            //Increment/Decrement
            4'b1110: begin Y_final = A+1; Cout = 0; end // Increment
            4'b1111: begin Y_final = A-1; Cout = 0; end // Decrement
            // NO DEFAULT NEEDED as it can cause override for all 0-7 operations.
        endcase
        // Flags are used by the CPU control unit to make decisions after an ALU operation.
            Z = (Y_final == 4'b0000);
            N = Y_final[3];
            V = ((opcode_top == 4'b0110) && (A[3] == B[3]) && (Y_final[3] != A[3])) ||  // ADD
                ((opcode_top == 4'b0111) && (A[3] != B[3]) && (Y_final[3] != A[3]));     // SUB
      end
endmodule
