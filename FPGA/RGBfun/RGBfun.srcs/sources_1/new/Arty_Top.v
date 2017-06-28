`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:		Mitchell Orsucci
// Engineer: 	National Instruments --> Digilent Inc.
// 
// Create Date: 06/12/2017 01:29:05 PM
// Design Name: RGBfun
// Module Name: Arty_Top
// Project Name: RGBfun
// Target Devices: Digilent Arty
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


module Arty_Top(
    input CLK100MHZ,
    input [3:0] SW,
    output wire [3:0] LED,
    output reg [2:0] RGBLED0,
    output reg [2:0] RGBLED1,
    output reg [2:0] RGBLED2,
    output reg [2:0] RGBLED3,
    input [3:0] KEY
    );

	wire [31:0] tbase;
	reg splitClock;
	wire [2:0] pause 		[3:0];
	wire [2:0] strobeOut	[3:0];
	wire [2:0] step			[3:0];

	always@(*)
		case(SW[3:2])
			2'b00:	splitClock = tbase[13];
			2'b01:	splitClock = tbase[12];
			2'b10:	splitClock = tbase[11];
			2'b11:	splitClock = tbase[10];
			default:	splitClock = tbase[12];
		endcase // SW[3:2]

	always@(*)
		case(SW[1:0])
			2'b00:		begin
				RGBLED0 = pause[0];
				RGBLED1 = pause[1];
				RGBLED2 = pause[2];
				RGBLED3 = pause[3];
				end
			2'b01:		begin
				RGBLED0 = strobeOut[0];
				RGBLED1 = strobeOut[1];
				RGBLED2 = strobeOut[2];
				RGBLED3 = strobeOut[3];
				end
			2'b10:		begin
				RGBLED0 = step[0];
				RGBLED1 = step[1];
				RGBLED2 = step[2];
				RGBLED3 = step[3];
				end
			default:	begin
				RGBLED0 = pause[0];
				RGBLED1 = pause[1];
				RGBLED2 = pause[2];
				RGBLED3 = pause[3];
				end	
		endcase

	Counter32 clock_divider(.Reset(~KEY[3]), .CLK100MHZ(CLK100MHZ), .outClock(tbase[31:0]));

	PauseRGB control(.Reset(~KEY[3]), .KEY(KEY[0]), .RGB3(pause[3]), .RGB2(pause[2]), .RGB1(pause[1]), .RGB0(pause[0]),
		.slowClk(splitClock), .fastClk(CLK100MHZ));

	Strobe strober	(.strbClk(splitClock), .Reset(~KEY[3]), .RGB3(strobeOut[3]), .RGB2(strobeOut[2]), 
		.RGB1(strobeOut[1]), .RGB0(strobeOut[0]), .KEY(KEY[0]), .fastClk(CLK100MHZ));

	Step stepper (.stepClk(splitClock), .Reset(!KEY[3]), .KEY(KEY[0]), .RGB3(step[3]), .RGB2(step[2]), 
		.RGB1(step[1]), .RGB0(step[0]));

endmodule
