`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2017 12:16:08 PM
// Design Name: 
// Module Name: Strobe
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


module Strobe(
    input strbClk,
    input Reset,
    input KEY,
    input fastClk,
    output reg	[2:0] RGB0,
    output reg	[2:0] RGB1,
    output reg	[2:0] RGB2,
    output reg	[2:0] RGB3
    );

	wire	[2:0] fromPause [3:0];
	reg		[31:0]	counter;


	always@(posedge strbClk or negedge Reset)
		if(!Reset)
			counter <= 32'h00000000;
		else if (KEY)
			counter <= counter;
		else
			counter <= counter + 1'b1;


	PauseRGB pause(.Reset(Reset), .KEY(1'b0), .RGB3(fromPause[3]), .RGB2(fromPause[2]), .RGB1(fromPause[1]),
		.RGB0(fromPause[0]), .slowClk(strbClk), .fastClk(fastClk));


	always@(*)
		if (counter[10]) begin
			RGB3[2:0] = fromPause[3][2:0];
			RGB2[2:0] = fromPause[2][2:0];
			RGB1[2:0] = fromPause[1][2:0];
			RGB0[2:0] = fromPause[0][2:0];
		end else begin
			RGB3 = 3'b000;
			RGB2 = 3'b000;
			RGB1 = 3'b000;
			RGB0 = 3'b000;
		end

endmodule

