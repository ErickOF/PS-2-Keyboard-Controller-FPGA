module KeyboardController_testbench();
// Inputs
logic ps2_clk;
logic data;

// Outputs
logic [7:0] keycode;

KeyboardController UUT(.ps2_clk(ps2_clk), .data(data), .code(keycode));

initial begin
    // Initialize Inputs
    #50 ps2_clk = 1;
    #50 data = 1;
        
    // 0 - Start
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 1
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 2
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 3
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 4
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 5
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 // 6
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 7
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 8
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 9 - Parity Bit
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 10 - End
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
	 
	 // 0 - Start
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    
	 // 1
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 2
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 3
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 4
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 5
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 6
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 7
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 8
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 9 - Parity
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 10 - End
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;

    // Break code
	 // 0 - Start
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 1
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 2
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 3
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 4
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 5
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 6
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 7
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 8
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 9 - Parity
    #45 data = 0;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
    // 10 - Stop
    #45 data = 1;
    #5 ps2_clk = 0;
    #50 ps2_clk = 1;
end

endmodule // KeyboardController_testbench
