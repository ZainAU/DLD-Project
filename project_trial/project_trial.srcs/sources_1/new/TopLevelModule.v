// Code your design here
`timescale 1ns / 1ps


//module toptopLevelModule(clk,ps2_clk,ps2_data, out_L);
    

//endmodule
 
module TopLevelModule(clk, state,red, green, blue, h_sync, v_sync, some_pin);
input clk;
input state;
output [3:0]red;
output [3:0]green;
output [3:0]blue;
output h_sync;
output v_sync;
output some_pin;
 
wire M1,M3,M7;
wire [9:0] M2, M4,M8,M9;
 
assign some_pin = 1'b1;
clk_div a1(clk,M1);
h_counter a2(M1,M2,M3);
v_counter a3(M1,M3, M4);
vga_sync a4(M2, M4, h_sync, v_sync, M7,M8,M9);
pixel_gen a5(M1, M8, M9, M7, state, red, green, blue);
endmodule
 
module vga_sync(h_count, v_count, h_sync, v_sync, video_on, x_loc, y_loc);
input [9:0] h_count;
input [9:0] v_count;
output h_sync;
output v_sync;
output video_on;
output [9:0] x_loc;
output [9:0] y_loc;
 
//horizontal
localparam HD = 640;
localparam HF = 48;
localparam HB = 16;
localparam HR = 96;
 
//vertical
localparam VD = 480;
localparam VF = 10;
localparam VB = 33;
localparam VR = 2;
 

  assign h_sync = ((h_count < (HD+HF)) || (h_count >= (HD+HF+HR)));

  
  assign v_sync = ((v_count < (VD+VF)) || (v_count >= (VD+VF+VR)));

  
  assign video_on = ((h_count < HD) && (v_count < VD));

  
  
  assign x_loc = h_count; 
  assign y_loc = v_count; 
  
endmodule

module startup(pixel_x, pixel_y, squad);
  input [9:0] pixel_x;
  input [9:0] pixel_y;
  output squad;
  
  reg [0:29] startup [29:0];
  
  wire [5:0] x = pixel_x[9:4] - 5;
  wire [5:0] y = pixel_y[9:4];
  assign squad = startup[y][x];
  
  initial begin
    startup[0]  = 30'b111111111111111111111111111111; 
    startup[1]  = 30'b100000000000000000000000000001; 
    startup[2]  = 30'b100000000000000000000000000001; 
    startup[3]  = 30'b100000000000000000000001111001; 
    startup[4]  = 30'b100000000000001010010000000001; 
    startup[5]  = 30'b100000000000000000000001111001; 
    startup[6]  = 30'b100000000000010001001001000001; 
    startup[7]  = 30'b100000000011111111111111000001; 
    startup[8]  = 30'b100100000010000000000000000001; 
    startup[9]  = 30'b100100111110000000000000000001; 
    startup[10] = 30'b100100100000000000000000000001; 
    startup[11] = 30'b100100111110000000000000000001; 
    startup[12] = 30'b100100000010000000000000000001; 
    startup[13] = 30'b100111111110000000000000000001; 
    startup[14] = 30'b100000000000000000000000000001;
    startup[15] = 30'b100000000000000000000000000001;
    startup[16] = 30'b100100011101110111010010100001; 
    startup[17] = 30'b100100010001010101011010100001; 
    startup[18] = 30'b100100011101110111010110100001; 
    startup[19] = 30'b100100010001010110010010100001; 
    startup[20] = 30'b100111011101010101010010111001; 
    startup[21] = 30'b100000000000000000000000000001; 
    startup[22] = 30'b100001110111011101110011100001; 
    startup[23] = 30'b100000100100010000100001000001;
    startup[24] = 30'b100000100111011100100001000001; 
    startup[25] = 30'b100000100100000100100001000001; 
    startup[26] = 30'b100000100111011100100001000001; 
    startup[27] = 30'b100000000000000000000000000001; 
    startup[28] = 30'b100000000000000000000000000001; 
    startup[29] = 30'b111111111111111111111111111111; 
  end
endmodule
 
 module learn(pixel_x, pixel_y, nums);
  input [9:0] pixel_x;
  input [9:0] pixel_y;
  output nums;
  
  reg [0:27] m [27:0];
  
  wire [5:0] x = pixel_x[9:4] - 5;
  wire [5:0] y = pixel_y[9:4];
  assign nums = m[y][x];
  
  initial begin
    m[0]  = 28'b0000000000000000000000000000;
    m[1]  = 28'b0001000000000000000000000000;
    m[2]  = 28'b0001000000000010000000000000;
    m[3]  = 28'b0001000000000010000000000000;
    m[4]  = 28'b0001000000000010000000000000;
    m[5]  = 28'b0000000000000010000000000000;
    m[6]  = 28'b0000000000000010000000000000;
    m[7]  = 28'b0000000000000010000000000000;
    m[8]  = 28'b0000000000000010000000000000;
    m[9]  = 28'b0000000000000000000000000000;
    m[10] = 28'b0000000000000000000000000000;
    m[11] = 28'b0000000000000010000010000000;
    m[12] = 28'b0000000000000010000010000000;
    m[13] = 28'b0000000000000010000010000000;
    m[14] = 28'b0000000000000011111110000000;
    m[15] = 28'b0000000000000010000000000000;
    m[16] = 28'b0000000000000010000000000000;
    m[17] = 28'b0000000000000010000000000000;
    m[18] = 28'b0000000000000010000000000000;
    m[19] = 28'b0000000000000000000000000000;
    m[20] = 28'b0000000000000000000000000000;
    m[21] = 28'b0000000000000010010010000000;
    m[22] = 28'b0000000000000010010010000000;
    m[23] = 28'b0000000000000010010010000000;
    m[24] = 28'b0000000000000011111110000000;
    m[25] = 28'b0000000000000010000000000000;
    m[26] = 28'b0000000000000000000000000000;
    m[27] = 28'b0000000000000000000000000000;
  
  end 

endmodule
 
//module LEARN(
//    input clk_25,
//    input en,
//    input play,
//    input [3:0] num,
//    output reg audio_en,
//    output reg [3:0] num_audio,
//    output state);
   
//   always @(posedge clk_25) begin
//        if (num == 4'b0000) begin
//            audio_en = 1'b1;
//            num_audio = 4'b0000;
//        end
//        if (num == 4'b0001) begin
//            audio_en = 1'b1;
//            num_audio = 4'b0001;
//        end 
//    end 
// endmodule 
 
 module pixel_gen( 
  input clk_d, 
  input [9:0] pixel_x, 
  input [9:0] pixel_y, 
  input video_on,
  //  input start,
  //  input game,
  input man_state,
  output reg [3:0] red=0, 
  output reg [3:0] green=0, 
  output reg [3:0] blue=0);
  parameter start = 0;
  parameter game = 1;
    
  
  reg [1:0] state = start;
  wire start_pix;
  startup s1(pixel_x, pixel_y, start_pix);

  wire learn_pix;
  learn m1(pixel_x, pixel_y, learn_pix);
 
  
  always @(posedge clk_d)
    begin
      if ((pixel_x <80) || (pixel_x >=560)) begin 
        red <= 4'h0; 
        green <= 4'h0; 
        blue <= 4'h0; 
      end
      else begin
          if (/*state == start*/ man_state == 1'b0) begin
            if (start_pix) begin
                red <= 4'hf;
                green <= 4'h0; 
                blue <= 4'h0; 
            end
            else begin
                red <= 4'hd;
                green <=4'hd;
                blue <= 4'he;
            end
          end  
          else if (/*state == game*/ man_state == 1'b1) begin     
              if (learn_pix == 1) begin 
                red <= 4'hd;
                green <= 4'hd; 
                blue <= 4'he; 
              end     
              else  begin 
                red <= 4'hf;
                green <= 4'h0; 
                blue <= 4'h0; 
              end 
          end
      end
     end 
endmodule

 
module h_counter(clk,h_count,trig_v);
    input clk;
    output [9:0] h_count;
    reg [9:0] h_count;
    output trig_v;
    reg trig_v;
    
    initial h_count = 0;
    initial trig_v = 0;
     
    always @ (posedge clk) begin
        if (h_count <= 798) begin
            h_count <= h_count +1;
            trig_v <= 0;
        end
        else begin
            h_count <= 0;
            trig_v <= 1;
        end
    end
endmodule
 
module v_counter(clk,enable_v, v_count);
    input clk;
    input enable_v;
    output [9:0] v_count;
    reg [9:0] v_count;
    initial v_count = 0;
     
    always @ (posedge clk) begin
        if (enable_v ==1) begin
            if (v_count <= 523) begin
                v_count <= v_count + 1;
            end
            else begin
                v_count <= 0;
            end
        end
    end
endmodule
 
module clk_div (clk, clk_d);
    parameter div_value = 1;
    input clk;
    output clk_d;
     
    reg clk_d;
    reg count;
     
    initial begin
        clk_d = 0;
        count = 0;
    end
    always @(posedge clk) begin
        if (count == div_value)
            count <= 0; // reset count
        else
            count <= count + 1; //count up
    end
    always @(posedge clk) begin
        if (count == div_value)
            clk_d <= ~clk_d; //toggle
    end
endmodule
