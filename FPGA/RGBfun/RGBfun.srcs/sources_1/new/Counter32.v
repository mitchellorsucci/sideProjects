`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2017 01:47:25 PM
// Design Name: 
// Module Name: Counter32
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


module Counter32(
    input Reset,
    input CLK100MHZ,
    output reg [31:0] outClock
    );

	always @(posedge CLK100MHZ or negedge Reset)
		if(!Reset)
			outClock <= 32'h00000000;
		else
			outClock <= outClock + 1'b1;

endmodule
