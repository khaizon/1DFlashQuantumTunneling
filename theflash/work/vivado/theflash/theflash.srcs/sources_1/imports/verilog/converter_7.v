/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module converter_7 (
    input [15:0] pp,
    input [15:0] lives,
    input [15:0] level,
    output reg [15:0] out
  );
  
  
  
  reg [4:0] diff;
  
  reg [4:0] diff2;
  
  always @* begin
    diff = (pp[0+4-:5] - ((pp[0+4-:5] / 5'h0a) * 5'h0a));
    out[0+3-:4] = diff[0+3-:4];
    diff2 = (pp[0+4-:5] / 5'h0a);
    out[4+3-:4] = diff2[0+3-:4];
    out[8+3-:4] = lives[0+3-:4];
    out[12+3-:4] = level[0+3-:4];
  end
endmodule
