/***************************
    Elvis Chino-Islas
    ECE 527L - LAB5
    Spring 2022
***************************/
`ifndef state_machine
`define state_machine

`timescale 1ns/100ps

module state_machine ( 
    clk,
    rst_n,
    b,
    outp
);

input clk;
input rst_n;
input [3:1] b;
output reg outp;

// state encoding - one-hot
localparam S0 = 8'h01;
localparam S1 = 8'h02;
localparam S2 = 8'h04;
localparam S3 = 8'h08;
localparam S4 = 8'h10;
localparam S5 = 8'h20;
localparam S6 = 8'h40;
localparam S7 = 8'h80;

// input combinations
localparam B1	 = 3'b001; // 0001
localparam B3B1	 = 3'b101; // 0011
localparam B2	 = 3'b010; // 0000 0001
localparam B3B2	 = 3'b110; // 0000 0011


reg [7:0] pr_state, nx_state;

// the combinational calculated nx_state is assigned sequentially to pr_state
always @(posedge clk, negedge rst_n) begin : STATE_ASSIGNMENT
    if (~rst_n) begin
        pr_state <= S0;
    end else begin
        pr_state <= nx_state;
    end
end

// the nx_state is calculated combinatorially
always @(*) begin: NEXT_STATE_LOGIC
    case (pr_state)
        S0: 
            if ( b == B1 || b == B3B1 || b == B2 || b == B3B2 ) begin
                nx_state = S1;
            end

            else begin
                nx_state = S0;
            end
        S1:
            nx_state = S2;
        S2:
            nx_state = S3;
        S3:
            if (b == B2 || b == B3B2) begin
                nx_state = S4;
            end

            else begin
                nx_state = S0;
            end
        S4:
            nx_state = S5;
        S5:
            nx_state = S6;
        S6:
            nx_state = S7;
        S7:
            nx_state = S0;
        default:
            nx_state = S0;
    endcase
end

// output is determined combinatorially
always @(*) begin: OUTPUT_LOGIC
    case (pr_state)
        S2:
            if (b == B3B1 || b == B3B2) begin
                outp = 1;
            end
            else begin
                outp = 0;
            end
        S3:
            outp = 1; 
        default:
            outp = 0;
    endcase
end
endmodule
`endif
