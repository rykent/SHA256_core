`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ryken Thompson
// 
// Create Date: 11/21/2023 07:27:09 PM
// Design Name: 
// Module Name: SHA256_core
// Project Name: 
// Target Devices: Basys3
// Tool Versions: 
// Description: SHA256 hash core. Hashes the given block and outputs the current digest
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SHA256_core(
    input RST,
    input CLK,
    input next_b,
    input [511:0] block,
    output [255:0] digest,
    output core_ready
    );
    
    logic [31:0] a_bus;
    logic [31:0] b_bus;
    logic [31:0] c_bus;
    logic [31:0] d_bus;
    logic [31:0] e_bus;
    logic [31:0] f_bus;
    logic [31:0] g_bus;
    logic [31:0] h_bus;
    
    logic [255:0] digest_bus;
    
    logic [31:0] w_t;
    logic [31:0] k_t;
    logic [31:0] t1;
    logic [31:0] t2;
    
    logic digest_we;
    logic ah_update;
    logic cntr_reset;
    logic w_reset;
    logic cnt_en;
    
    logic [5:0] rounds_cntr;
    
    ah_reg AH0 (.clk(CLK), .reset(w_reset), .ah_update(ah_update), .digest(digest_bus), .t1(t1), .t2(t2), .a(a_bus), .b(b_bus), .c(c_bus), .d(d_bus), .e(e_bus), .f(f_bus), .g(g_bus), .h(h_bus));
    w_reg W0 (.clk(CLK), .reset(w_reset), .block(block), .w_t(w_t));
    SHA256_FSM CORE_FSM (.clk(CLK), .rst(RST), .next(next_b), .t(rounds_cntr), .digest_we(digest_we), .ah_update(ah_update), .cntr_reset(cntr_reset), .w_reset(w_reset), .cnt_en(cnt_en), .core_ready(core_ready));
    DIGEST_REG D_REG (.clk(CLK), .WE(digest_we), .RST(RST), .a(a_bus), .b(b_bus), .c(c_bus), .d(d_bus), .e(e_bus), .f(f_bus), .g(g_bus), .h(h_bus), .digest(digest_bus));
    k_constant_rom K_ROM (.clk(CLK), .t(rounds_cntr), .k_out(k_t));
    CNTR R_CNTR (.clk(CLK), .cnt_en(cnt_en), .reset(cntr_reset), .cnt(rounds_cntr));
    T1 T1_L (.e(e_bus), .f(f_bus), .g(g_bus), .h(h_bus), .k_t(k_t), .w_t(w_t), .T1(t1));
    T2 T2_L (.a(a_bus), .b(b_bus), .c(c_bus), .T2(t2)); 
    
    assign digest = digest_bus;
    
endmodule  
