`timescale 1ns / 1ps

module ALU(y,a,b,sel);
		output reg [4:0] y; 
		input [3:0] a,b,sel;
		wire  [4:0] asigned = {a[3],a};
		wire  [4:0] bsigned = {b[3],b};
		
		always @(a,b,sel) 
			case (sel[3])
				0:  		//Arithmetic operations
					begin
					case (sel[2:0])
						3'b000:  y = {0,a+1};
						3'b001:  y = {0,a-1};
						3'b010:  y = {0,b};
						3'b011:  y = {0,b+1};
						3'b100:  y = {0,b-1};
						3'b101:  y = {0,a};
						3'b110:  y = {0,a+b};
						3'b111:  y = {0,a<<1};
						default: y = "ZZZZZ";
					endcase
					end
				1:		//Logical operations
					begin
					case (sel[2:0])
						3'b000:  y = ~asigned;
						3'b001:  y = ~bsigned;
						3'b010:  y = asigned & bsigned;
						3'b011:  y = asigned | bsigned;
						3'b100:  y = asigned ^ bsigned;
						3'b101:  y = ~(asigned ^ bsigned);
						3'b110:  y = ~(asigned & bsigned);
						3'b111:  y = ~(asigned | bsigned);
						default:  y = "ZZZZZ";
					endcase
					end
			endcase
endmodule
