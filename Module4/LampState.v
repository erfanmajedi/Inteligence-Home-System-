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
---  Module Name: Active Lights
---  Description: Module4: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module LampState (
	input  [ 3:0] active_lights , // number of active light
	output [15:0] lights_state    // state of lights is on
);

	/* write your code here */
	// simpleDecoder = 16'b0000000000000001 << active_lights;
	assign lights_state = ( 16'b0000000000000001 << active_lights ) - 1; // yek vahed ke kam mikonim be tedade martabe decoder, 1 darim samte rast
	// active_lights = 5
	// => simpleDecoder	= 16'b0000000000100000
	// =>  lights_state = 16'b0000000000011111 : inja 5 ta bit 1 darim
	/* write your code here */

endmodule
