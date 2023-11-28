`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ryken Thompson
// 
// Create Date: 11/21/2023 11:08:25 PM
// Design Name: 
// Module Name: ah_reg
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: Working variable registers for SHA256 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ah_reg(
    input reset,
    input clk,
    input ah_update,
    input [255:0] digest,
    input [31:0] t1,
    input [31:0] t2,
    output logic [31:0] a,
    output logic [31:0] b,
    output logic [31:0] c,
    output logic [31:0] d,
    output logic [31:0] e,
    output logic [31:0] f,
    output logic [31:0] g,
    output logic [31:0] h
);

    //Starting hashes for SHA256
    localparam SHA256_H0_0 = 32'h6a09e667;
    localparam SHA256_H0_1 = 32'hbb67ae85;
    localparam SHA256_H0_2 = 32'h3c6ef372;
    localparam SHA256_H0_3 = 32'ha54ff53a;
    localparam SHA256_H0_4 = 32'h510e527f;
    localparam SHA256_H0_5 = 32'h9b05688c;
    localparam SHA256_H0_6 = 32'h1f83d9ab;
    localparam SHA256_H0_7 = 32'h5be0cd19;

    always_ff @(posedge clk) begin
        if (reset) begin
            a <= digest[255:224];
            b <= digest[223:192];
            c <= digest[191:160];
            d <= digest[159:128];
            e <= digest[127:96];
            f <= digest[95:64];
            g <= digest[63:32];
            h <= digest[31:0];
        end
        else if (ah_update) begin
            a <= t1 + t2;
            b <= a;
            c <= b;
            d <= c;
            e <= d + t1;
            f <= e;
            g <= f;
            h <= g;
        end
    end

endmodule