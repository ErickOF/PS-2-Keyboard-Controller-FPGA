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
module KeyboardController(input  logic       ps2_clk,
                          input  logic       data,
                          output logic [7:0] code);

logic [7:0] keycode, previous_keycode;
logic [3:0] counter;
logic       last;

// Init variables
initial begin
    counter <= 4'h1;
    last <= 1'b0;
    keycode <= 8'hf0;
    previous_keycode <= 8'hf0;
    code <= 8'hf0;
end

always @(negedge ps2_clk) begin
    case(counter)
        // Bit 1 - Start
        1:;
        // Bit 2-9 - Info
        2: keycode[0] <= data;
		  3: keycode[1] <= data;
		  4: keycode[2] <= data;
		  5: keycode[3] <= data;
		  6: keycode[4] <= data;
		  7: keycode[5] <= data;
		  8: keycode[6] <= data;
		  9: keycode[7] <= data;
        // Bit 10 - Parity
        10:    last <= 1'b1;
        // Bit 11 - End
        11:    last <= 1'b0;
    endcase

    if (counter <= 10)
        counter <= counter + 4'b1;
    else if (counter == 11)
        counter <= 4'b1;
end

// Save bits
always @(posedge last) 
    begin
        if (keycode == 8'hf0)
            code <= previous_keycode;
        else
            previous_keycode <= keycode;
    end
endmodule // KeyboardController
