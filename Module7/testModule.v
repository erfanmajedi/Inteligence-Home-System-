`timescale 1 ns/1 ns

module testModule;

    reg arst;
	reg clk;
	reg request;
	reg confirm;
	reg [1:0]password;
	reg [1:0]syskey;
	reg [34:0]configin;
	wire [34:0]configout;
	wire write_en;
	wire [2:0]dbg_state;

    always #5 clk = ~clk;

    ControlUnit dut(arst, clk, request, confirm, password, syskey, configin, configout, write_en, dbg_state);

    initial
    begin
        $monitor("dbg_state: %b, request: %b, confirm: %b, password: %d, syskey: %d, configin: %d, configout: %d, write_en: %b", dbg_state, request, confirm, password, syskey, configin, configout, write_en);

        clk = 0; arst = 0; request = 0; confirm = 0; password = 3; syskey = 1; configin = 0;
#20     request = 1; // mirim be ACTIVE
#20     confirm = 1; // ba pass e eshtebah mirim be TRAP
#20     request = 0; confirm = 0; // bar migardim be IDLE va confirm ro vel mikonim
#20     request = 1; // dobare mirim be ACTIVE
#20     password = 1; // password sahih ro vared mikonim
#20     confirm = 1; // confirm ro feshar midim
#20     confirm = 0; // dokma ro vel mikonim ta nasuze
#20     configin = 1465; // config e delkhah ro vared mikonim
#20     confirm = 1; // va dobare confirm mikonim
#20     confirm = 0;
#20     request = 0; // mirim be halate IDLE
#20     $stop;

    end
    
endmodule