`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 12:37:43 PM
// Design Name: 
// Module Name: counter
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


module counter(clk, count);
    parameter n =30;
    input clk;
    output reg[4:0] count;

initial begin 
    count = 0;
end 

always @(posedge clk)
begin 
if (count == n)
    count <= 0;
else 
    count <= count + 1;
end 
endmodule
