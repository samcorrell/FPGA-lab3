`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 02:03:12 PM
// Design Name: 
// Module Name: lab3_ripple
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab3_ripple(
    input [1:0] a,b,
    input ci,
    output [6:0] bcd
    );
    wire [1:0] sum;
    wire [3:0]x;
    wire co;
    assign x = {1'b0,co,sum};
    
    bit2_FA a0(a,b,ci,sum,co);
    BCD_7 b0(x,bcd);
endmodule
//2 bit adder
module bit2_FA(
    input [1:0]a,b,
    input ci,
    output[1:0]sum,
    output co
    );
    wire c;
    FA a0(a[0],b[0],ci,sum[0],c);
    FA a1(a[1],b[1],c,sum[1],co);
endmodule
//1 bit adder
module FA(
    input a,b,ci,
    output sum,co
    );
    assign sum=a^b^ci;
    assign co=(a&b)|(a&ci)|(b&ci);
endmodule
//binary decimal converter
module BCD_7(
    input [3:0]i,
    output reg [6:0]seg
    );
    
    always@(*)
    begin
        case(i)
            0: seg = 7'b1000000;
            1: seg = 7'b1111001;
            2: seg = 7'b0100100;
            3: seg = 7'b0110000;
            4: seg = 7'b0011001;
            5: seg = 7'b0010010;
            6: seg = 7'b0000010;
            7: seg = 7'b1111000;
            8: seg = 7'b0000000;
            9: seg = 7'b0000100;
            10: seg = 7'b0000000;
            11: seg = 7'b0000000;
        endcase
    end
            
endmodule