`include "shiftregister.v"

module Encoder

(
  output [6:0] codeword,
  input [3:0] message,
  input clk

);
reg [1:0] mode;
initial mode = 2'b11;

wire [6:0] x3wire, x2wire , x1wire ,x0wire, linx3,linx2,linx1,linx0;

shiftregister8 #(7) x3(.parallelOut(x3wire),
                      .serialOut(),
                      .clk(clk),
                      .mode(mode),
                      .parallelIn(7'b1011000),
                      .serialIn())
                      ;
shiftregister8 #(7) x2(.parallelOut(x2wire),
                      .serialOut(),
                      .clk(clk),
                      .mode(mode),
                      .parallelIn(7'b0101100),
                      .serialIn());

shiftregister8 #(7) x1(.parallelOut(x1wire),
                      .serialOut(),
                      .clk(clk),
                      .mode(mode),
                      .parallelIn(7'b0010110),
                      .serialIn());

shiftregister8 #(7) x0(.parallelOut(x0wire),
                      .serialOut(),
                      .clk(clk),
                      .mode(mode),
                      .parallelIn(7'b0001011),
                      .serialIn());

assign linx3 = x3wire & {7{message[3]}};
assign linx2 = x2wire & {7{message[2]}};
assign linx1 = x1wire & {7{message[1]}};
assign linx0 = x0wire & {7{message[0]}};
xor (codeword[0],linx3[0],linx2[0],linx1[0],linx0[0]);
xor (codeword[1],linx3[1],linx2[1],linx1[1],linx0[1]);
xor (codeword[2],linx3[2],linx2[2],linx1[2],linx0[2]);
xor (codeword[3],linx3[3],linx2[3],linx1[3],linx0[3]);
xor (codeword[4],linx3[4],linx2[4],linx1[4],linx0[4]);
xor (codeword[5],linx3[5],linx2[5],linx1[5],linx0[5]);
xor (codeword[6],linx3[6],linx2[6],linx1[6],linx0[6]);
endmodule //
