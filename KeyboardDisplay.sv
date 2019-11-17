module KeyboardDisplay(input  logic clk,
                       input  logic ps2_clk,
                       input  logic data,
                        output logic [4:0] leds);

logic [7:0] keycode = 0;

KeyboardController KC(.ps2_clk(ps2_clk), .data(data), .code(keycode));

always @(keycode) begin
    case(keycode)
        // Up
        8'h75:   leds <= 5'b00001;
	     // Down
	     8'h72:   leds <= 5'b00010;
	     // Left
	     8'h6B:   leds <= 5'b00100;
	     // Right
	     8'h74:   leds <= 5'b01000;
		  // Space
		  8'h29:   leds <= 5'b01000;
	     // Other key
	     default: leds <= 5'b10000;
    endcase
end

endmodule // KeyboardDisplay
