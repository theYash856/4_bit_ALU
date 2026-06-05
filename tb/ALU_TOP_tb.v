`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2026 11:48:20
// Design Name: 
// Module Name: ALU_TOP_tb
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


module ALU_TOP_tb;
    reg [3:0] A_tb, B_tb;
    reg [3:0] opcode_tb;
    wire [3:0] Y_tb;
    wire Cout_tb;
    wire Z_tb, N_tb, V_tb;
    
    ALU_TOP uut(.A(A_tb), .B(B_tb), 
                .opcode_top(opcode_tb), 
                .Y_final(Y_tb), 
                .Cout(Cout_tb),
                .Z(Z_tb),
                .N(N_tb),
                .V(V_tb));
    
    initial begin
        $display("op    | A   | B   | Y     | C Z N V");
        $display("------|-----|-----|-------|--------");
        $monitor("%b | %b | %b | %b | %b %b %b %b",
                  opcode_tb, A_tb, B_tb, Y_tb, Cout_tb, Z_tb, N_tb, V_tb);
        
        // AND 
        A_tb=4'b1010; B_tb=4'b1100; opcode_tb=4'b0000; #10;
        
        // OR 
        A_tb=4'b1010; B_tb=4'b1100; opcode_tb=4'b0001; #10;
        
        // NOT 
        A_tb=4'b1010; B_tb=4'bxxxx; opcode_tb=4'b0010; #10;
        
        // NAND 
        A_tb=4'b1010; B_tb=4'b1100; opcode_tb=4'b0011; #10;
        
        // XOR 
        A_tb=4'b1010; B_tb=4'b1100; opcode_tb=4'b0100; #10;
        
        // NOR 
        A_tb=4'b1010; B_tb=4'b1100; opcode_tb=4'b0101; #10;
        
        // ADD - normal 
        A_tb=4'b0011; B_tb=4'b0101; opcode_tb=4'b0110; #10;
        
        // ADD - overflow 
        A_tb=4'b1111; B_tb=4'b0001; opcode_tb=4'b0110; #10;
        
        // SUB - normal 
        A_tb=4'b0101; B_tb=4'b0011; opcode_tb=4'b0111; #10;
        
        // SUB - borrow 
        A_tb=4'b0011; B_tb=4'b0101; opcode_tb=4'b0111; #10;
        
        // SLL 
        A_tb=4'b0011; B_tb=4'bxxxx; opcode_tb=4'b1000; #10;
        
        // SRL 
        A_tb=4'b1100; B_tb=4'bxxxx; opcode_tb=4'b1001; #10;
        
        // SRA 
        A_tb=4'b1100; B_tb=4'bxxxx; opcode_tb=4'b1010; #10;
        
        // SEQ - true 
        A_tb=4'b0101; B_tb=4'b0101; opcode_tb=4'b1011; #10;
        
        // SEQ - false 
        A_tb=4'b0101; B_tb=4'b0011; opcode_tb=4'b1011; #10;
        
        // SLT 
        A_tb=4'b0011; B_tb=4'b0101; opcode_tb=4'b1100; #10;
        
        // SGT 
        A_tb=4'b0101; B_tb=4'b0011; opcode_tb=4'b1101; #10;
        
        // INC
        A_tb=4'b0101; B_tb=4'bxxxx; opcode_tb=4'b1110; #10;
        
        // DEC 
        A_tb=4'b0101; B_tb=4'bxxxx; opcode_tb=4'b1111; #10;
        
        $finish;
    end
endmodule