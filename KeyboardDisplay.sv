module KeyboardDisplay(input  logic clk,
                       input  logic ps2_clk,
                       input  logic data,
                       output logic [6:0] deco1, deco2);

logic [7:0] keycode = 0;

KeyboardController KC(.ps2_clk(ps2_clk), .data(data), .code(keycode));

Decoder D1(keycode[3], keycode[2], keycode[1], keycode[0], deco1);
Decoder D2(0, keycode[6], keycode[5], keycode[4], deco2);

endmodule // KeyboardDisplay
