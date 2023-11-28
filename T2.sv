`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ryken Thompson
// 
// Create Date: 11/21/2023 07:27:09 PM
// Design Name: 
// Module Name: T2
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: T2 logic for SHA256
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module T2(
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    output [31:0] T2
    );
    
    logic [31:0] sum0;
    logic [31:0] maj;
    
    assign sum0 = ({a[1:0], a[31:2]} ^ {a[12:0], a[31:13]} ^ {a[21:0], a[31:22]});
    assign maj = (a & b) ^ (a & c) ^ (b & c);
    
    assign T2 = sum0 + maj;
endmodule
