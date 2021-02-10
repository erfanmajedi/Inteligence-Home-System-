`timescale 1 ns/1 ns
module testModule;

    reg [31:0]Base;
    reg [7:0]ref;
    reg [15:0]adc_data;
    wire [31:0]tempc;

    TemperatureCalculator dut(.tc_base(Base), .tc_ref(ref), .adc_data(adc_data), .tempc(tempc));

    initial
    begin
        $monitor("Base=%d, ref=%d, adc_data=%d, tempc=%d", Base, ref, adc_data, tempc);

        Base = 200; ref = 10; adc_data = 32;
#10     Base = 120; ref = 8; adc_data = 32;
#10     Base = 0; ref = 16; adc_data = 8;
#10     Base = 0; ref = 16; adc_data = 21;
    end
    
endmodule

module testMultiplier8x8;
    
    reg [7:0]A;
    reg [7:0]B;
    wire [15:0]P;

    Multiplier8x8 dut(A, B, P);

    reg [15:0]ExpectedP = 0;

    initial
    begin
        $monitor("A: %d, B: %d, P: %d, ExpectedP: %d, Ok?: %b", A, B, P, ExpectedP, P == ExpectedP);

        A = 8'b00000101; B = 8'b00000011; ExpectedP = 16'b0000000000001111; // 5 * 3 = 15
#10     A = 8'b00000101; B = 8'b10000011; ExpectedP = 16'b1111110110001111; // 5 * -125 = -625
#10     A = 8'b10010000; B = 8'b10111101; ExpectedP = 16'b0001110101010000; // -112 * -67 = 7504
#20     $stop;
    end
endmodule

module testAdderSubtractor32x32;
    
    reg [31:0]A;
    reg [31:0]B;
    reg sel;
    wire [31:0]S;

    AdderSubtractor32x32 dut(A, B, sel, S);

    reg [31:0]ExpectedS = 0;

    initial
    begin
        $monitor("A: %d, B: %d, sel: %b, S: %d, ExpectedS: %d, Ok?: %b", A, B, sel, S, ExpectedS, S == ExpectedS);

        A = 32'b00000000000000000000000000000101; B = 32'b00000000000000000000000000000011; sel = 0; ExpectedS = 32'b00000000000000000000000000001000; //   5 (+) +3    = 8
#10     A = 32'b00000000000000000000000000000101; B = 32'b11111111111111111111111111111101; sel = 1; ExpectedS = 32'b00000000000000000000000000001000; //   5 (-) -3    = 8
#10     A = 32'b11111111111111111111111111110001; B = 32'b11111111111111111110110001111000; sel = 0; ExpectedS = 32'b11111111111111111110110001101001; // -15 (+) -5000 = -5015
#20     $stop;
    end
endmodule