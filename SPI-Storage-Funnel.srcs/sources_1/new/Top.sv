`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2024 10:08:01 AM
// Design Name: 
// Module Name: Top
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


module Top(
    input MISO,
    output SPI_cs, MOSI,
    
    input S_MISO, 
    output S_CS, S_MOSI 
    );
    
    parameter NUM_LINES = 1;
    
    wire [7:0] data; 
    wire DONE; 
    reg start; 
    
    SPI spi(
        .clk(clk), .start(start),
        .MISO(MISO),
        .MOSI(MOSI),
        .CS(CS), 
        .data(data),
        .DONE(DONE));   
        
     
    
endmodule
