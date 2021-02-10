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
---  Module Name: Gas Engine Utils
---  Description: Module2:
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

/***********************************************************/
/************** Design Your Own Modules Below **************/

module ShiftRegister12Bit (
    input Din,                      // Data_in
    input clk,                      // posedge clock
    input rst,                      // reset
    output reg [11:0]register = 0   // 12bit register ( FIFO )
);
    always @(posedge clk or posedge rst) begin
        if(rst)begin
            register = 0;
        end
        else begin
            register = { register[10:0], Din };
        end
    end
endmodule
	
/************** Design Your Own Modules Above **************/
/***********************************************************/
