`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 10:39:03 AM
// Design Name: 
// Module Name: SPI_TB
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


module SPI_TB();
    
    reg clk; 
    reg start; 
    reg [7:0] MISO;
    reg [7:0] MOSI; 
    reg CS; 
    
    wire [7:0] data;
    wire done; 
    
    // clk
    initial 
    begin
        clk = 0; 
    end
    
    always 
    begin 
        #5 clk = !clk;
    end 
    
    SPI spi(
        .clk(clk), .start(start),
        .MISO(MISO),
        .MOSI(MOSI),
        .CS(CS), 
        .data(data),
        .DONE(DONE));
    
    
endmodule
