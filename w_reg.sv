`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 01:50:19 PM
// Design Name: 
// Module Name: w_mem
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


module w_reg(
    input clk,
    input reset,
    input [511:0] block,
    output [31:0] w_t
    );
    
    logic [31:0] w_reg [0:15];
    
    //logic [31:0] sig0 = ({w_reg[1][6:0], w_reg[1][31:7]} ^ {w_reg[1][17:0], w_reg[1][31:18]} ^ {3'b0, w_reg[1][31:3]});
    //logic [31:0] sig1 = ({w_reg[14][16:0], w_reg[14][31:17]} ^ {w_reg[14][18:0], w_reg[14][31:19]} ^ {10'b0, w_reg[14][31:10]});
    //logic [31:0] w_15_new;
    
    always_ff @(posedge clk) begin
        
        //w_15_new = ({w_reg[14][16:0], w_reg[14][31:17]} ^ {w_reg[14][18:0], w_reg[14][31:19]} ^ {10'b0, w_reg[14][31:10]}) + w_reg[9] + ({w_reg[1][6:0], w_reg[1][31:7]} ^ {w_reg[1][17:0], w_reg[1][31:18]} ^ {3'b0, w_reg[1][31:3]}) + w_reg[0];
    
        if (reset) begin
            w_reg[0] <= block[511 : 480];
            w_reg[1] <= block[479 : 448];
            w_reg[2] <= block[447 : 416];
            w_reg[3] <= block[415 : 384];
            w_reg[4] <= block[383 : 352];
            w_reg[5] <= block[351 : 320];
            w_reg[6] <= block[319 : 288];
            w_reg[7] <= block[287 : 256];
            w_reg[8] <= block[255 : 224];
            w_reg[9] <= block[223 : 192];
            w_reg[10] <= block[191 : 160];
            w_reg[11] <= block[159 : 128];
            w_reg[12] <= block[127 : 96];
            w_reg[13] <= block[95 : 64];
            w_reg[14] <= block[63 : 32];
            w_reg[15] <= block[31 : 0];     
        end
        else begin
            w_reg[0] <= w_reg[1];
            w_reg[1] <= w_reg[2];
            w_reg[2] <= w_reg[3];
            w_reg[3] <= w_reg[4];
            w_reg[4] <= w_reg[5];
            w_reg[5] <= w_reg[6];
            w_reg[6] <= w_reg[7];
            w_reg[7] <= w_reg[8];
            w_reg[8] <= w_reg[9];
            w_reg[9] <= w_reg[10];
            w_reg[10] <= w_reg[11];
            w_reg[11] <= w_reg[12];
            w_reg[12] <= w_reg[13];
            w_reg[13] <= w_reg[14];
            w_reg[14] <= w_reg[15];
            w_reg[15] <= ({w_reg[14][16:0], w_reg[14][31:17]} ^ {w_reg[14][18:0], w_reg[14][31:19]} ^ {10'b0, w_reg[14][31:10]}) + w_reg[9] + ({w_reg[1][6:0], w_reg[1][31:7]} ^ {w_reg[1][17:0], w_reg[1][31:18]} ^ {3'b0, w_reg[1][31:3]}) + w_reg[0];
        end
    end
    
    assign w_t = w_reg[0];
    
endmodule
