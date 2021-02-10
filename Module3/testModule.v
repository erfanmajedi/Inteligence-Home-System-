`timescale 1 ns/1 ns

module testModule;
    
    reg arst;
    reg clk;
    reg [7:0] speed = 0;
    reg [7:0] chs_conf = 0;

    wire [3:0] chs_power;
    wire chs_mode;
    wire pwm;

    always #5   clk = ~clk;

    CoolHeatSystem dut(.arst(arst), .clk(clk), .speed(speed), .chs_conf(chs_conf), .chs_power(chs_power), .chs_mode(chs_mode), .pwm_data(pwm));

    initial
    begin
        $monitor("arst: %b, speed: %d, chs_conf: %b, chs_power: %d, chs_mode: %b", arst, speed, chs_conf, chs_power, chs_mode);
        clk = 0; arst = 0; chs_conf = 8'b00000000; speed = 0;

        // Testing CHS Power
        arst = 0; chs_conf = 8'b00110011; speed = 0;
#10240  arst = 0; chs_conf = 8'b01001011; speed = 0;
#10240  arst = 0; chs_conf = 8'b10000111; speed = 0;
#10240  arst = 0; chs_conf = 8'b10000011; speed = 0;
#10240  arst = 0; chs_conf = 8'b10101011; speed = 0;
        // Testing Fan Controller
#10240  arst = 0; chs_conf = 8'b10101011; speed = 80;
#10240  arst = 0; chs_conf = 8'b10101011; speed = 128;
#10240  arst = 0; chs_conf = 8'b10101011; speed = 255;
#10240  arst = 0; chs_conf = 8'b10101011; speed = 0;
#10240  arst = 0; chs_conf = 8'b10101011; speed = 1;
#10240  arst = 0; chs_conf = 8'b10101011; speed = 253;
#10240  $stop;

    end
    
endmodule