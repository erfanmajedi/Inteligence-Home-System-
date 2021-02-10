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
---  Module Name: Fan Speed (PWM)
---  Description: Module3: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module FanSpeed (
	input        arst     , // reset [asynch]  
	input        clk      , // clock [posedge] 
	input  [7:0] speed    , // speed [duty-cycle]  
	output       pwm_data   // data  [output]
);

	/* write your code here */
	reg pulse = 0;
	reg [7:0] timer_counter = 0; //toole dore tanavobe clock 

	assign pwm_data = pulse;

	always @(posedge clk or posedge arst) begin
		if(arst) begin
			pulse = 0;
			timer_counter = 0;
		end
		else begin
			if(timer_counter > speed) begin
				pulse = 0;
			end
			else begin
				if(speed == 0) begin
					pulse = 0;
				end
				else begin
					pulse = 1;
				end
			end
			timer_counter = timer_counter + 1;
		end
	end
	/* write your code here */

endmodule
