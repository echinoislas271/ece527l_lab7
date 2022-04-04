
`ifndef state_machine
`include "../src/state_machine.v"
`endif

`default_nettype none
`timescale 1ns/100ps

module tb_state_machine;
reg clk;
reg rst_n;
reg [3:1] b;
wire outp;

// used to iterate through all cases
integer  i;

state_machine uut
(
    .clk (clk),
    .rst_n (rst_n),
    .b(b),
    .outp(outp)
);

// T = 100 ns => 10 MHz
localparam CLK_PERIOD = 100;
always #(CLK_PERIOD/2) clk=~clk;

// used to simulate on local device
`ifdef iverilog
initial begin
    $dumpfile("tb_state_machine.vcd");
    $dumpvars(0, tb_state_machine);
end
`endif

// used to simulate on remote device (i.e dcd136.ecs.csun.edu)
`ifndef iverilog
initial $vcdpluson();
`endif



initial begin

    // initiate signals
    rst_n<=1'b0;clk<=1'b0;

    // de-assert reset
    #(CLK_PERIOD/4) rst_n <= 1; b <= 0;

    // iterate through all cases
	for (i = 1; i <= 7; i = i + 1) begin
        #(CLK_PERIOD*24) b <= i;
	end

    #(CLK_PERIOD*24)$finish;
end

always @( uut.pr_state ) begin
    $display("\nFSM State: %h", uut.pr_state);
    $display("clk: %b, B1: %b, B2: %b, B3: %b, | OUTPUT: %b", clk, b[1], b[2], b[3], outp);
end

endmodule
`default_nettype wire
