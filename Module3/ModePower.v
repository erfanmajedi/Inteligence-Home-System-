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
---  Module Name: Power Mode (Conting Ones)
---  Description: Module3: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module ModePower(
	input  [7:0] chs_conf  , // degree [temprature] 
	output [3:0] chs_power , // power  [cooler/heater] 
	output       chs_mode    // model  [heat=1/cool=0]
);

	/* write your code here */
	reg Mode = 0;
	reg [3:0]Power = 0;
	assign chs_mode = Mode;
	assign chs_power = Power;

	integer i;
	always @(chs_conf) begin
		Mode = 0;
		Power = 0;
		for (i = 0; i<8; i=i+1) begin
			if(chs_conf[i] == 1) begin
				Mode = ~Mode;
				Power = Power + 1;
			end
		end
	end
	/* write your code here */

endmodule
