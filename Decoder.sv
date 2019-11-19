module Decoder (input             x, y, z, w,
                output logic[6:0] out);

logic U1;
logic U2;
logic U3;
logic U4;
logic U5;
logic U6;
logic U7;

always_comb begin
	U1 = ~((x & ~w)|(~x & z)|(y & z)|(~x & y & w)|(x & ~y & ~z)|(~y & ~w));
	U2 = ~((~y & ~w)|(~x & z & w)|(~y & ~z)|(x & ~z & w)|(~x & ~z & ~w));
	U3 = ~((~y & w)|(~z & w)|(~x & y)|(x & ~y)|(~y & ~z));
	U4 = ~((~y & ~z & ~w)|(~y & z & w)|(y & ~z & w)|(~x & z & ~w)|(x & y & ~w));
	U5 = ~((z & ~w)|(~y & ~w)|(x & z)|(x & y));
	U6 = ~((y & ~w)|(x & ~y)|(x & z)|(~x & y & ~z)|(~z & ~w));
	U7 = ~((~y & z)|(z & ~w)|(x & ~y)|(x & w)|(~x & y & ~z));
end
			
assign out = {U1, U2, U3, U4, U5, U6, U7};

endmodule // Decoder
