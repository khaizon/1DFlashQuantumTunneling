/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg outled,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [5-1:0] M_led_strip_pixel;
  wire [1-1:0] M_led_strip_led;
  reg [1-1:0] M_led_strip_update;
  reg [64-1:0] M_led_strip_entities;
  led_driver_1 led_strip (
    .clk(clk),
    .rst(rst),
    .update(M_led_strip_update),
    .entities(M_led_strip_entities),
    .pixel(M_led_strip_pixel),
    .led(M_led_strip_led)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [64-1:0] M_entities_entities;
  reg [16-1:0] M_entities_player_location;
  reg [256-1:0] M_entities_enemy_location;
  handle_entities_3 entities (
    .clk(clk),
    .rst(rst),
    .player_location(M_entities_player_location),
    .enemy_location(M_entities_enemy_location),
    .entities(M_entities_entities)
  );
  wire [7-1:0] M_multiseg_seg;
  wire [4-1:0] M_multiseg_sel;
  reg [16-1:0] M_multiseg_values;
  multi_seven_seg_4 multiseg (
    .clk(clk),
    .rst(rst),
    .values(M_multiseg_values),
    .seg(M_multiseg_seg),
    .sel(M_multiseg_sel)
  );
  
  localparam PLAYERLOCATON = 3'h5;
  
  localparam ENEMYLOCATION = 256'h8006800680068006800680068006800680068006800680068006800680068006;
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_led_strip_entities = M_entities_entities;
    M_entities_player_location = 3'h5;
    M_entities_enemy_location = 256'h8006800680068006800680068006800680068006800680068006800680068006;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h010101;
    M_led_strip_update = 1'h1;
    outled = M_led_strip_led;
    M_multiseg_values = {4'h0, 4'h0, {3'h0, M_led_strip_pixel[4+0-:1]}, M_led_strip_pixel[0+3-:4]};
    io_seg = ~M_multiseg_seg;
    io_sel = ~M_multiseg_sel;
  end
endmodule
