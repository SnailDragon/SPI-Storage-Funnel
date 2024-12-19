`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2024 10:08:01 AM
// Design Name: 
// Module Name: SPI
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



module SPI(
    input clk, start,
    input MISO,
    output reg MOSI,
    output reg CS, 
    output reg data,
    output reg DONE
    );
    
    // path to get command sequence from 
    parameter string INPUT_NUM = "C:/Users/tyler/Documents/SPI-Storage-Funnel/default.txt"; 
    parameter SPI_FREQUENCY = 4 * 1_000_000;
    // eventually have parameters for clock polarity and clock phase 
    
    enum { pc_read_st, cs_st, filter_st, send_st } state, next_state; 
    
    // stored in the format [CS][FLUSH][COMMAND]
    //                      [1 ][1    ][8      ] 
    reg [9:0] RAM [0:127]; 
    
    // read commands for this SPI device
    initial 
    begin
        $readmemh(INPUT_NUM, RAM);  
    end 
    
    reg [31:0] pc; 
    reg [9:0] command; 
    reg filter; 
    reg [2:0] command_index; 
    
    always@(*)
    begin
        case (state) 
            pc_read_st: 
            begin
                command = RAM[pc]; 
                if(start) next_state = cs_st; 
                else next_state = pc_read_st; 
            end 
            cs_st: 
            begin
                CS = command[9]; 
                next_state = filter_st; 
            end
            filter_st: 
            begin 
                filter = command[8]; 
                command_index = 0; 
                next_state = send_st; 
            end 
            send_st: 
            begin
                MOSI = command[command_index]; 
                if(filter == 0) begin 
                    data = (data << 1) | MISO; 
                end 
                if(command_index == 7) next_state = pc_read_st;
                else next_state = send_st;  
            end 
            
        
        endcase 
    end 
    
    always@(posedge clk)
    begin
    
    end
    
endmodule
