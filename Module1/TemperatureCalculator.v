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
---  Module Name: Temperature Calculator
---  Description: Module1: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns 

module TemperatureCalculator (
	input  [31:0] tc_base  , // base [environment degree ]
	input  [ 7:0] tc_ref   , // ref  [system work voltage]
	input  [15:0] adc_data , // adc  [sensor digital data]
	output [31:0] tempc      // temp [temperature celsius]
);

	/* write your code here */
	wire [15:0] ref2;
	wire [31:0] multResult;
	wire [31:0] result;

	assign tempc = result;

	Multiplier8x8 refMult(
		.A( tc_ref ),
		.B( tc_ref ),
		.P( ref2 )
	);

	Multiplier16x16 dataMult(
		.A( ref2 ),
		.B( {1'b0, adc_data[14:0]} ),
		.P( multResult )
	);

	AdderSubtractor32x32 resultAdder(
		.A( tc_base ),
		.B( { 0, 0, 0, 0, 0, 0, multResult[31:6] } ), // engar 6 vahed shift dadim be samte rast, yani bar 64 tagsim kardim
		.sel( adc_data[15] ),
		.S( result )
	);
	
	/* write your code here */

endmodule
