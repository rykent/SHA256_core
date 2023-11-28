`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ryken Thompson
// 
// Create Date: 11/22/2023 11:59:16 AM
// Design Name: K Constant ROM
// Module Name: k_constant_rom
// Project Name: SHA256
// Target Devices: Basys3
// Tool Versions: Vivado 2022.1.2
// Description: ROM to hold the k constants for sha256
//              Utilizes block ram, sync read
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module k_constant_rom(
    input clk,
    input [5:0] t,
    output logic [31:0] k_out
    );
    
    (*rom_style = "block" *) logic [31:0] k_rom [0:63];
    
    initial begin
        k_rom[0] = 32'h428a2f98;
        k_rom[1] = 32'h71374491;
        k_rom[2] = 32'hb5c0fbcf;
        k_rom[3] = 32'he9b5dba5;
        k_rom[4] = 32'h3956c25b;
        k_rom[5] = 32'h59f111f1;
        k_rom[6] = 32'h923f82a4;
        k_rom[7] = 32'hab1c5ed5;
        k_rom[8] = 32'hd807aa98;
        k_rom[9] = 32'h12835b01;
        k_rom[10] = 32'h243185be;
        k_rom[11] = 32'h550c7dc3;
        k_rom[12] = 32'h72be5d74;
        k_rom[13] = 32'h80deb1fe;
        k_rom[14] = 32'h9bdc06a7;
        k_rom[15] = 32'hc19bf174;
        k_rom[16] = 32'he49b69c1;
        k_rom[17] = 32'hefbe4786;
        k_rom[18] = 32'h0fc19dc6;
        k_rom[19] = 32'h240ca1cc;
        k_rom[20] = 32'h2de92c6f;
        k_rom[21] = 32'h4a7484aa;
        k_rom[22] = 32'h5cb0a9dc;
        k_rom[23] = 32'h76f988da;
        k_rom[24] = 32'h983e5152;
        k_rom[25] = 32'ha831c66d;
        k_rom[26] = 32'hb00327c8;
        k_rom[27] = 32'hbf597fc7;
        k_rom[28] = 32'hc6e00bf3;
        k_rom[29] = 32'hd5a79147;
        k_rom[30] = 32'h06ca6351;
        k_rom[31] = 32'h14292967;
        k_rom[32] = 32'h27b70a85;
        k_rom[33] = 32'h2e1b2138;
        k_rom[34] = 32'h4d2c6dfc;
        k_rom[35] = 32'h53380d13;
        k_rom[36] = 32'h650a7354;
        k_rom[37] = 32'h766a0abb;
        k_rom[38] = 32'h81c2c92e;
        k_rom[39] = 32'h92722c85;
        k_rom[40] = 32'ha2bfe8a1;
        k_rom[41] = 32'ha81a664b;
        k_rom[42] = 32'hc24b8b70;
        k_rom[43] = 32'hc76c51a3;
        k_rom[44] = 32'hd192e819;
        k_rom[45] = 32'hd6990624;
        k_rom[46] = 32'hf40e3585;
        k_rom[47] = 32'h106aa070;
        k_rom[48] = 32'h19a4c116;
        k_rom[49] = 32'h1e376c08;
        k_rom[50] = 32'h2748774c;
        k_rom[51] = 32'h34b0bcb5;
        k_rom[52] = 32'h391c0cb3;
        k_rom[53] = 32'h4ed8aa4a;
        k_rom[54] = 32'h5b9cca4f;
        k_rom[55] = 32'h682e6ff3;
        k_rom[56] = 32'h748f82ee;
        k_rom[57] = 32'h78a5636f;
        k_rom[58] = 32'h84c87814;
        k_rom[59] = 32'h8cc70208;
        k_rom[60] = 32'h90befffa;
        k_rom[61] = 32'ha4506ceb;
        k_rom[62] = 32'hbef9a3f7;
        k_rom[63] = 32'hc67178f2;
    end
    
    always_ff @(posedge clk) begin
        k_out <= k_rom[t];
    end
    
endmodule
