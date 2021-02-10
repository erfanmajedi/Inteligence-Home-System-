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
---  Module Name: 8 Bit Multiplier
---  Description: Module1: 
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module Multiplier8x8 (
	input  [ 7:0] A , // input  [unsigned 08 bits]
	input  [ 7:0] B , // input  [unsigned 08 bits]
	output [15:0] P   // output [unsigned 16 bits]
);

	/* write your code here */
	reg [15:0] tempProduct;
	wire ProductSign;
	wire [7:0]MagA;
	wire [7:0]MagB;

	assign ProductSign = A[7]^B[7]; //alamte bade zarb kardne do add A v B
	assign P = { ProductSign, ProductSign == 0 ? tempProduct[14:0] : ~(tempProduct[14:0] - 1) }; // hasel zarb do adad
	
	assign MagA = A[7] == 0 ? { 0, A[6:0] } : (~A) + 1;	// gesmate bozorgi adad ro be dast miarim
	assign MagB = B[7] == 0 ? { 0, B[6:0] } : (~B) + 1;


	integer i; // shomarande baraye halge
	always @( A or B ) begin
		tempProduct = 0; // javab ro sefr mikonim
		for (i = 0; i<7; i=i+1) begin // baraye har martabe az ragam ha, yebar javab ro ba shift shodeye zarib jam mikonim
			if (MagA[i] == 1'b1) begin // albate agar ragam mortabet ba un martabe dar avalin adad 1 bashe.
				tempProduct = tempProduct + ( MagB << i ); // adade dovom ro shift midim be chap va jam mikonim
			end
		end
	end
	/* write your code here */

endmodule
