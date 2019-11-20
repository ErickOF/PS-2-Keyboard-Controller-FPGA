module KeyboardDisplay(input  logic ps2_clk,
                       input  logic data,
                       output logic [6:0] deco1, deco2,
							  output logic [4:0] leds);

logic      [7:0] keycode = 0;
localparam [7:0] W = 8'h1D;
localparam [7:0] A = 8'h1C;
localparam [7:0] S = 8'h1B;
localparam [7:0] D = 8'h23;

KeyboardController KC(.ps2_clk(ps2_clk), .data(data), .code(keycode));

Decoder D1(keycode[3], keycode[2], keycode[1], keycode[0], deco1);
Decoder D2(0, keycode[6], keycode[5], keycode[4], deco2);

assign leds[0] = (keycode == W) ? 1'b1 : 1'b0;
assign leds[1] = (keycode == A) ? 1'b1 : 1'b0;
assign leds[2] = (keycode == S) ? 1'b1 : 1'b0;
assign leds[3] = (keycode == D) ? 1'b1 : 1'b0;
assign leds[4] = ~(leds[0] | leds[1] | leds[2] | leds[3]);

endmodule // KeyboardDisplay
