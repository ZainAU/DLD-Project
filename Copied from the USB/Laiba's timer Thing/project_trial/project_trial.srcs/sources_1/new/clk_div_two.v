`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 12:34:31 PM
// Design Name: 
// Module Name: clk_div_two
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


module clk_div_two (clk, clk_d2);
    parameter div_value = 49999999;
    input clk;
    output clk_d2;
     
    reg clk_d;
    reg count;
     
    initial
    begin
    clk_d = 0;
    count = 0;
    end
    always @(posedge clk)
    begin
    if (count == div_value)
    count <= 0; // reset count
    else
    count <= count + 1; //count up
    end
    always @(posedge clk)
    begin
    if (count == div_value)
    clk_d <= ~clk_d; //toggle
    end
endmodule