`timescale 1ns / 1ps

module ALU_tb();

// Inputs
reg [31:0] A_in, B_in;
reg [3:0] ALU_ctrl;

// Outputs
wire [31:0] ALU_out;
wire zero, carry_out, overflow;

// Instantiate the ALU
ALU_32 uut(
    .A_in(A_in),
    .B_in(B_in),
    .ALU_ctrl(ALU_ctrl),
    .ALU_out(ALU_out),
    .zero(zero),
    .carry_out(carry_out),
    .overflow(overflow)
);

initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, ALU_tb);
end

// Monitor outputs
initial begin
    $monitor("Time=%t, A_in=%h, B_in=%h, ALU_ctrl=%b, ALU_out=%h, zero=%b, carry_out=%b, overflow=%b",
             $time, A_in, B_in, ALU_ctrl, ALU_out, zero, carry_out, overflow);
end

// Apply the test cases
initial begin
    // Test 1: AND
    A_in = 32'h086a_0c31;
    B_in = 32'hd785_f148;
    ALU_ctrl = 4'b0000;
    #20;
    
    // Test 2: OR
    A_in = 32'h086a_0c31;
    B_in = 32'h1007_3fd4;
    ALU_ctrl = 4'b0001;
    #20;
    
    // Test 3: Add
    A_in = 32'ha86a_0c31;
    B_in = 32'h9007_3fd4;
    ALU_ctrl = 4'b0010;
    #20;
    
    // Test 4: Subtract
    A_in = 32'ha86a_0c31;
    B_in = 32'h9007_3fd4;
    ALU_ctrl = 4'b0110;
    #20;
    
    // Test 5: Set Less Than (slt)
    A_in = 32'ha86a_0c31;
    B_in = 32'h9007_3fd4;
    ALU_ctrl = 4'b0111;
    #20;
    
    // Test 6: NOR
    A_in = 32'ha86a_0c31;
    B_in = 32'h9007_3fd4;
    ALU_ctrl = 4'b1100;
    #20;
    
    // Test 7: Equal comparison
    A_in = 32'ha86a_0c31;
    B_in = 32'ha86a_0c31;
    ALU_ctrl = 4'b1111;
    #20;
    
    // Test 8: Equal comparison
    A_in = 32'ha86a_0c31;
    B_in = 32'h1007_3fd4;
    ALU_ctrl = 4'b1111;
    #20;

    $finish;
    
end

endmodule   // ALU_tb
