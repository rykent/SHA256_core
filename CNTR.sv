`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ryken Thompson
// 
// Create Date: 11/21/2023 07:27:09 PM
// Design Name: 6 Bit Up Counter
// Module Name: CNTR
// Project Name: SHA256
// Target Devices: Basys3
// Description: 6 bit counter for counting sha256 rounds
//              Synchronous reset
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CNTR(
    input clk,
    input reset,
    input cnt_en,
    output logic [5:0] cnt = 0
    );
    
    always_ff @(posedge clk) begin
        if (reset) begin
            cnt <= 0;
        end
        else if (cnt_en) begin
            cnt <= cnt + 1;
        end
    end
    
endmodule
