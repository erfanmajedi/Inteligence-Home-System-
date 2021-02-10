`timescale 1 ns/1 ns

module testModule;
    
    reg arst;
    reg clk;
    reg din;
    wire [2:0]dout;

    always #5 clk = ~clk;
    
    GasDetectorSensor dut(.arst(arst), .clk(clk), .din(din), .dout(dout));

    initial begin
        $monitor("arst: %b, dout: %b", arst, dout);
        clk = 0;    arst = 0;   din = 0;
#1      din = 1;
#10     din = 0;
#10     din = 1;
#10     din = 1;
#10     din = 1;
#10     din = 0;
#10     din = 1;
#10     din = 0;
#10     din = 1;
#10     din = 0;
#60     din = 1;
#40     din = 0;
#10     din = 1;
#10     din = 0;
#10     din = 1;
#10     din = 0;
#10     din = 0;
#10     din = 1;
#10     din = 0;
#10     din = 0;
#10     din = 1;
#10     din = 1;
#57     arst = 1;
#23     arst = 0;
#10     din = 1;
#10     din = 0;
#10     din = 0;
#10     din = 1;
#10     din = 0;
#10     din = 0;
#10     din = 1;
#10     din = 0;
#10     din = 0;
#50     arst = 1;
#1      arst = 0;
#500    $stop;
    end

endmodule
