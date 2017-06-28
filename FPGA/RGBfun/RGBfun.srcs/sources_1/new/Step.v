`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2017 12:17:36 PM
// Design Name: 
// Module Name: Step
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Step(
    input stepClk,
    input KEY,
    input Reset,
    output reg	[2:0] RGB0,
    output reg	[2:0] RGB1,
    output reg	[2:0] RGB2,
    output reg	[2:0] RGB3
    );
	
	reg [31:0] counter;

	always@(posedge stepClk or negedge Reset)
		if(!Reset)
			counter <= 32'h00000000;
		else if (KEY)
			counter <= counter;
		else
			counter <= counter + 1'b1;

	parameter OFF =	3'b000;
	parameter START0 = 3'b001; // Blue
	parameter START1 = 3'b010; // Green
	parameter START2 = 3'b011; // Aqua
	parameter START3 = 3'b101; // Purple

	always@(*)
		case(counter[11:10])
			2'b00:	begin
					RGB0 = START0;
					RGB1 = OFF;
					RGB2 = OFF;
					RGB3 = OFF;
				end
			2'b01:	begin
					RGB0 = OFF;
					RGB1 = START1;
					RGB2 = OFF;
					RGB3 = OFF;
				end
			2'b10:	begin
					RGB0 = OFF;
					RGB1 = OFF;
					RGB2 = START2;
					RGB3 = OFF;
				end
			2'b11:	begin
					RGB0 = OFF;
					RGB1 = OFF;
					RGB2 = OFF;
					RGB3 = START3;
				end				
			default:	begin
					RGB0 = OFF;
					RGB1 = OFF;
					RGB2 = OFF;
					RGB3 = OFF;
				end
		endcase // counter[10:9]

endmodule
