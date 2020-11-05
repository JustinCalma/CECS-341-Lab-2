`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2020 10:11:51 AM
// Design Name: 
// Module Name: RegFile
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

// Module definition
module RegFile(
               clk, reset, rg_wrt_en,   // 1 - bit each
               rg_wrt_addr,             // 5 - bits
               rg_rd_addr1,             // 5 - bits
               rg_rd_addr2,             // 5 - bits
               rg_wrt_data,             // 32 - bits
               rg_rd_data1,             // 32 - bits
               rg_rd_data2              // 32 - bits
               );

    // Define the I/O Signals
    input                   clk;
    input                   reset;
    input                   rg_wrt_en;
    input       [4:0]       rg_rd_addr1;
    input       [4:0]       rg_rd_addr2;
    output      [31:0]      rg_rd_data1;
    output      [31:0]      rg_rd_data2;
    input       [4:0]       rg_wrt_addr;
    input       [31:0]      rg_wrt_data;
    
    // Define the Register File module's behavior    
    reg [31:0] register_file [0:31];
    assign rg_rd_data1 = register_file[rg_rd_addr1];
    assign rg_rd_data2 = register_file[rg_rd_addr2];
    integer i;
    
    always @(posedge clk or reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1)
                register_file[i] <= 0;
        end else begin
            if (rg_wrt_en)
                register_file[rg_wrt_addr] <= rg_wrt_data;
        end
    end

endmodule
