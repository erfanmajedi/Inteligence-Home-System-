/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2019-2020
--  *******************************************************
--  Student ID  : 
--  Student Name: 
--  Student Mail: 
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: Light Dance
---  Description: Module5
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module LightDance (
	input        arst  , // async  reset
	input        clk   , // clock  posedge
	input        din   , // input  data
	input        load  , // load   enable 
	input  [7:0] pdata , // load   data
	output [7:0] qdata   // output data
);

	/* write your code here */
	wire [7:0] DATA;
	assign qdata = DATA;

	wire [7:0] FlipFlopInputs;
	Mux2x1 DataSelector(.A({ din^DATA[0], DATA[7], DATA[6]^DATA[0], DATA[5]^DATA[0], DATA[4], DATA[3], DATA[2]^DATA[0], DATA[1]^DATA[0] }), .B(pdata), .sel(load), .Out(FlipFlopInputs));

	DFlop D7(.arst(arst), .clk(clk), .din(FlipFlopInputs[7]), .load(1), .dout(DATA[7]));
	DFlop D6(.arst(arst), .clk(clk), .din(FlipFlopInputs[6]), .load(1), .dout(DATA[6]));
	DFlop D5(.arst(arst), .clk(clk), .din(FlipFlopInputs[5]), .load(1), .dout(DATA[5]));
	DFlop D4(.arst(arst), .clk(clk), .din(FlipFlopInputs[4]), .load(1), .dout(DATA[4]));
	DFlop D3(.arst(arst), .clk(clk), .din(FlipFlopInputs[3]), .load(1), .dout(DATA[3]));
	DFlop D2(.arst(arst), .clk(clk), .din(FlipFlopInputs[2]), .load(1), .dout(DATA[2]));
	DFlop D1(.arst(arst), .clk(clk), .din(FlipFlopInputs[1]), .load(1), .dout(DATA[1]));
	DFlop D0(.arst(arst), .clk(clk), .din(FlipFlopInputs[0]), .load(1), .dout(DATA[0]));
	
	/* write your code here */

endmodule
