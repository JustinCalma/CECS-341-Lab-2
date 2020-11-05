`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2020 07:01:30 PM
// Design Name: 
// Module Name: tb_FlipFlop
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


module tb_FlipFlop();
    
    reg [7:0] tb_d;
    reg tb_clk;
    reg tb_reset;
    wire [7:0] tb_q;
    
    FlipFlop dff(
                 .d             (tb_d), 
                 .clk         (tb_clk), 
                 .reset     (tb_reset), 
                 .q             (tb_q)
                 );
    
    initial begin
    
        // Define the clock signal with the duration of 20ns   
        tb_clk = 1;
        forever #20 tb_clk = ~tb_clk;  
    
    end 

    initial begin 
        
        tb_reset = 1;
        tb_d <= 0;
        
        #100;
            tb_reset = 0;
            tb_d <= 8'b0011_1000;
        
        #100;
            tb_d <= 8'b1111_0000;
     
        end 
        
    endmodule
