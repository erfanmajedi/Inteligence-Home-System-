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
---  Module Name: Gas Detector Sensor
---  Description: Module2:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module GasDetectorSensor (
	input        arst     , // async reset
	input        clk      , // clock posedge
	input        din      , // input data 
	output [2:0] dout       // output data
);

	/* write your code here */
	reg Methane = 0;
	reg CarbonMonoxide = 0;
	reg CarbonDioxide = 0;
	assign dout = { CarbonDioxide, CarbonMonoxide, Methane };

	wire [11:0]shiftReg;

	ShiftRegister12Bit shifter(.Din(din), .clk(clk), .rst(arst), .register(shiftReg));

	always @(posedge clk or posedge arst) begin
		if(arst) begin
			Methane = 0; CarbonMonoxide = 0; CarbonDioxide = 0;
		end
		else begin
			if(shiftReg[9:0] == 10'b1011101010) begin
				Methane = 1;
			end
			if(shiftReg[11:0] == 12'b101010010011) begin
				CarbonMonoxide = 1;
			end
			if(shiftReg[8:0] == 9'b100100100) begin
				CarbonDioxide = 1;
			end
		end
	end
	
	/* write your code here */

endmodule
