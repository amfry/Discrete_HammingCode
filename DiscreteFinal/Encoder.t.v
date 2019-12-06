`include "Encoder.v"
`define ASSERT_EQ(val, exp, msg) \
  if (val !== exp) $display("[FAIL] %s (got:b%b expected:b%b)", msg, val, exp);
module testEncoder();

  reg clk;
  reg [3:0] message;
  wire [6:0] codeword;

  Encoder bluh(.clk(clk),
               .message(message),
               .codeword(codeword)
    );
  initial clk=0;
  always #10 clk=!clk;

  initial begin
    $dumpfile("shiftreg-dump.vcd");
    $dumpvars();

    assign message = 4'b1100;#20
    `ASSERT_EQ(codeword,7'b1110100, "PLOAD failed")

    $finish();
  end
endmodule
