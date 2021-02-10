`timescale 1 ns/1 ns
module testModule;
    
    reg [3:0] tcode;
    reg [3:0] ulight;
    reg [3:0] length;
    wire [3:0] wshade;
    wire [3:0] lightnum;
    wire [15:0] lightstate;

    LightingSystem dut(
        .tcode(tcode),
        .ulight(ulight),
        .lenght(length),
        .wshade(wshade),
        .lightnum(lightnum),
        .lightstate(lightstate)
    );

    initial
    begin
        $monitor("tcode: %b, uLight: %d, length: %d, wshade: %d/15, lightNum: %d, lightState: %b", tcode, ulight, length, wshade, lightnum, lightstate);

        tcode = 4'b0000; ulight = 12; length = 9;
#10     tcode = 4'b0001; ulight = 12; length = 9;
#10     tcode = 4'b0010; ulight = 12; length = 9;
#10     tcode = 4'b0100; ulight = 12; length = 9;
#10     tcode = 4'b0100; ulight = 3; length = 9;
#10     tcode = 4'b0100; ulight = 3; length = 14;
#10     tcode = 4'b1000; ulight = 6; length = 9;
#10     tcode = 4'b1000; ulight = 14; length = 9;
#10     $stop;

    end
endmodule