`timescale 1 ns/1 ns

module testModule;

    reg arst;
	reg clk;
	reg wren;
	reg [34:0]din;
	wire [34:0]dout;

    always #5 clk = ~clk;

    MemoryUnit dut(arst, clk, wren, din, dout);

    initial
    begin
        $monitor("arst: %b, wren: %b, din: %d, dout: %d", arst, wren, din, dout);

        clk = 0; arst = 0; wren = 0;
#3      din = 63789;
#10     wren = 1;
#10     wren = 0;
#10     arst = 1;
#5      arst = 0;
#20     $stop;

    end
    
endmodule