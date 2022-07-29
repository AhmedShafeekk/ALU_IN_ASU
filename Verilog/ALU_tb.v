`timescale 1ns / 1ps

module ALU_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg [3:0] sel;

	// Outputs
	wire [4:0] y;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.y(y), 
		.a(a), 
		.b(b), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		a = 5;
		b = 12;
		sel = 0;
		
		for (sel=0;sel<=15;sel = sel+1)
					#10;

	end
      
endmodule

