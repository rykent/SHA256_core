`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 07:27:09 PM
// Design Name: 
// Module Name: T1
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: T1 logic for SHA256
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module T1(
    input [31:0] e,
    input [31:0] f,
    input [31:0] g,
    input [31:0] h,
    input [31:0] k_t,
    input [31:0] w_t,
    output [31:0] T1
    );
    
    logic [31:0] sum1;
    logic [31:0] ch;
    
    assign sum1 = ({e[5:0], e[31:6]} ^ {e[10:0], e[31:11]} ^ {e[24:0], e[31:25]});
    assign ch = (e & f) ^ (~e & g);
    
    assign T1 = h + sum1 + ch + k_t + w_t;
endmodule
