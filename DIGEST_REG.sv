`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ryken Thompson
// 
// Create Date: 11/21/2023 07:27:09 PM
// Design Name: SHA256 Digest Register
// Module Name: DIGEST_REG
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Holds the current digest, when message is finished hashing will contain final hash
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DIGEST_REG(
    input clk,
    input WE,
    input RST,
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [31:0] d,
    input [31:0] e,
    input [31:0] f,
    input [31:0] g,
    input [31:0] h,
    output [255:0] digest
    );
    
    localparam SHA256_H0_0 = 32'h6a09e667;
    localparam SHA256_H0_1 = 32'hbb67ae85;
    localparam SHA256_H0_2 = 32'h3c6ef372;
    localparam SHA256_H0_3 = 32'ha54ff53a;
    localparam SHA256_H0_4 = 32'h510e527f;
    localparam SHA256_H0_5 = 32'h9b05688c;
    localparam SHA256_H0_6 = 32'h1f83d9ab;
    localparam SHA256_H0_7 = 32'h5be0cd19;
    
    //Initialize digest with the initial hash values
    logic [255:0] digest_reg = {SHA256_H0_0, SHA256_H0_1, SHA256_H0_2, SHA256_H0_3, SHA256_H0_4, SHA256_H0_5, SHA256_H0_6, SHA256_H0_7};
    
    always_ff @(posedge clk) begin
        if (RST) begin
            digest_reg <= {SHA256_H0_0, SHA256_H0_1, SHA256_H0_2, SHA256_H0_3, SHA256_H0_4, SHA256_H0_5, SHA256_H0_6, SHA256_H0_7};
        end
        else if (WE) begin
            digest_reg <= {(digest[255:224] + a), (digest[223:192] + b), (digest[191:160] + c), (digest[159:128] + d), (digest[127:96] + e), (digest[95:64] + f), (digest[63:32] + g), (digest[31:0] + h)};
        end
    end
    
    assign digest = digest_reg;
    
endmodule
