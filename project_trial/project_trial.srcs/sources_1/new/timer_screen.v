`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 11:04:16 AM
// Design Name: 
// Module Name: timer_screen
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


 module timer_screen(clk, pixel_x, pixel_y, video_on, r_red, r_green, r_blue);
                     input clk;
                     input [9:0] pixel_x;
                     input [9:0] pixel_y;
                     input video_on;
          
                     output reg[3:0] r_red; 
                     output reg[3:0] r_green; 
                     output reg[3:0] r_blue; 
                     localparam change = 5;
                     reg [10:0] size = 0;
                     reg [26:0] counter=0;
                     
                     
always @(posedge clk)
    begin 
    counter <= counter +1;
//    if (counter == 30);
//    counter <= 0;
    if ((pixel_x >= 320 && pixel_x < 470) && (pixel_y >= 110 && pixel_y < 135)) 
        begin 
            r_red <= 4'hF;
            r_green <= 4'hF; 
            r_blue <= 4'hF; 
        end
    else 
      begin
            r_red <= 4'h0;
            r_green <= 4'h0; 
            r_blue <= 4'h0; 
      end
    if (counter == 49999999) begin
        counter <=0;
         size <= size + change;
         end
if ((pixel_x >= 320 && pixel_x < 320+size) && (pixel_y >= 110 && pixel_y < 135)) 
 begin 
            r_red <= 4'h0;
            r_green <= 4'hF; 
            r_blue <= 4'h0; 
        end
//else 
//      begin
//            r_red <= 4'h0;
//            r_green <= 4'h0; 
//            r_blue <= 4'h0; 
//      end
      

     
      
end




 

     
     
    
            
   
  
endmodule    
