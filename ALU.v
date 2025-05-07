`timescale 1ns / 1ps

module ALU_32(
    input [31:0] A_in,
    input [31:0] B_in,
    input [3:0] ALU_ctrl,
    output reg [31:0] ALU_out,
    output reg zero,
    output reg overflow,
    output reg carry_out
);
    
always @(*) begin
    // Reset flags
    overflow = 0;
    carry_out = 0;
    
    case (ALU_ctrl)
        // AND
        4'b0000: ALU_out = A_in & B_in;
        
        // OR     
        4'b0001: ALU_out = A_in | B_in;     
        
        // Add
        4'b0010: begin                      
            {carry_out, ALU_out} = A_in + B_in;
            overflow = (~A_in[31] & ~B_in[31] & ALU_out[31]) | (A_in[31] & B_in[31] & ~ALU_out[31]);
        end  
        
        // Subtract
        4'b0110: begin                      
            ALU_out = A_in - B_in;
            overflow = (~A_in[31] & B_in[31] & ALU_out[31]) | (A_in[31] & ~B_in[31] & ~ALU_out[31]);
            carry_out = 1'b0;
        end
        
        // Set Less Than (slt)
        4'b0111: ALU_out = ($signed(A_in) < $signed(B_in)) ? 32'b1 : 32'b0;
        
        // NOR
        4'b1100: ALU_out = ~(A_in | B_in);
        
        // Equal Comparison
        4'b1111: ALU_out = (A_in == B_in) ? 32'b1 : 32'b0;
        
        // Default is Add, per lab specification
        default: begin
            {carry_out, ALU_out} = A_in + B_in;
            overflow = (~A_in[31] & ~B_in[31] & ALU_out[31]) | (A_in[31] & B_in[31] & ~ALU_out[31]);
        end
    endcase
    
    // Zero flag: Set to 1 if ALU_out is all 0s
    zero = (ALU_out == 32'b0);
end
   
endmodule
