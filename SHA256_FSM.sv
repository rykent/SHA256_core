`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 07:27:09 PM
// Design Name: 
// Module Name: SHA256_FSM
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


module SHA256_FSM(
    input clk,
    input rst,
    input next,
    input [5:0] t,
    output logic digest_we,
    output logic ah_update,
    output logic cnt_en,
    output logic cntr_reset,
    output logic w_reset,
    output logic core_ready
    );
    
    typedef enum {IDLE, ROUNDS, LAST_ROUND, BDONE} state;
    
    state PS, NS;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            PS <= IDLE;
        end
        else begin
            PS <= NS;
        end
    end
    
    always_comb begin
        digest_we = 0;
        cntr_reset = 0;
        w_reset = 0;
        ah_update = 0;
        cnt_en = 0;
        core_ready = 0;
        
        case (PS)
            IDLE: begin
                core_ready = 1;
                
                if (next) begin
                    cnt_en = 1;
                    w_reset = 1;
                    NS = ROUNDS; //Idle until next block
                end
                else begin
                    cntr_reset = 1; //Reset a-h registers and rounds counter
                    w_reset = 1;
                    NS = IDLE;
                end
            end
            ROUNDS: begin
                cnt_en = 1;
                ah_update = 1;
                if (t == 63) NS = LAST_ROUND;
                else NS = ROUNDS;
            end
            LAST_ROUND: begin
                cnt_en = 1;
                ah_update = 1;
                NS = BDONE;
            end
            BDONE: begin
                digest_we = 1;
                NS = IDLE;
            end
            default: begin
                NS = IDLE;
            end
            
        endcase
    end
    
endmodule
