/*
Module to drive PS/2 keyboard
1. When the keyboard is not sending input, it's sending a constant 1 (high) for
its data, as well as the clock.

2. A single key press will consist of at least 33 bits of input from the
keyboard.

3. When a key is first pressed, it sends 11 bits of data in the form of a 'make'
code. When it's released, it will send an 11 bit 'break' code, proceeding with
the same make code again.

4. The keyboard will send the same 11 bits containing the make code over and
over again while you hold a specific key down.

5. The keyboard sends data on the negative edge of its clock.

6. The keyboard has its own clock that you can read. Don't need to define your
own clock to work with the keyboard.


Inputs
   ps2_clk - Clock for keyboard. It's different to Processor's Clock
   data    - Bit recived by keyboard

Outpus
   code    - Bits to save key code
*/
module KeyboardController (input logic        ps2_clk, data,
                           output logic [7:0] code);

// These bits are sent for keyboard
logic [11:0] keycode, previous_keycode;
// Count input bits
logic [3:0]  counter;

// 5. The keyboard sends data on the negative edge of its clock.
always @(negedge ps2_clk) begin
    // Save each recived bit
    keycode[counter] = data;
	 counter <= counter + 3'b1;
	 // Last bit
    if (counter == 11) begin
        if (previous_keycode == 8'hF0) begin
		      code <= keycode[8:1];
		  end
		  previous_keycode = keycode;
		  counter <= 0;
    end
end

endmodule // KeyboardDriver
