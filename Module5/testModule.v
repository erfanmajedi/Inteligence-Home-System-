`timescale 1 ns/1 ns

module testModule;

    reg        arst ;
	reg        clk  ;
	reg        din  ;
	reg        load ;
	reg  [7:0] pdata;
	wire [7:0] qdata;

    always #5 clk = ~clk;

    LightDance dut(.arst(arst), .clk(clk), .din(din), .load(load), .pdata(pdata), .qdata(qdata));

    initial
    begin
        $monitor("din: %b, load: %b, pdata: %b, qdata: %b", din, load, pdata, qdata);

        clk = 0; din = 0; arst = 0; load = 0; pdata = 0;
#10     pdata = 67; load = 1;
#10     pdata = 0; load = 0;
#1000   din = 1;
#1000   $stop;

    end
    
endmodule

module testD_FF;

    reg arst;
    reg clk;
    reg din;
    reg load;
    wire dout;

    always #5 clk = ~clk;

    DFlop dut(arst, clk, din, load, dout);

    initial
    begin
        $monitor("arst: %b, din: %b, load: %b, dout: %b", arst, din, load, dout);

        clk = 0; arst = 0; din = 1; load = 0;
#20     arst = 0; din = 1; load = 1;
#10     load = 0;
#20     arst = 0; din = 0; load = 0;
#20     arst = 0; din = 0; load = 1;
#10     load = 0;
#20     $stop;

    end
    
endmodule