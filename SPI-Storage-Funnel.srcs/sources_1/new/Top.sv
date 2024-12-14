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
    input [7:0] SPI_in,
    output SPI_cs,
    output [7:0] SPI_out,
    
    input [7:0] Storage_in, 
    output Storage_cs, 
    output [7:0] Storage_out 
    
    );
    
    parameter NUM_LINES = 1;
    
    wire [7:0] SPI_data; 
    wire SPI_done, Storage_done; 
    
    SPI spi(.in(SPI_in), .out(SPI_out), .data(SPI_data), .enable(1), .done(SPI_done), .cs(SPI_cs)); 
    
    Storage storage(.in(Storage_in), .out(Storage_out), .data_in(SPI_data), .enable(1), .done(Storage_done), .cs(Storage_cs)); 
    
    
endmodule
