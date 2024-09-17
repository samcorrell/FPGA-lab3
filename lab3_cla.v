`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 02:46:20 PM
// Design Name: 
// Module Name: lab3_cla
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


module lab3_cla(
    input [1:0] a,b,
    input ci,
    output [6:0] bcd
    );
    wire [1:0] sum;
    wire [3:0]x;
    wire co;
    assign x = {1'b0,co,sum};
    
    cla a0(a,b,ci,sum,co);
    BCD_7 b0(x,bcd);
endmodule



//complete cla
module cla(
    input [1:0]a,b,
    input ci,
    output [1:0] s,
    output co
    );
    wire c;
    cla_gen g0(a,b,ci,c,co);
    FA a0(a[0],b[0],ci,s[0]);
    FA a1(a[1],b[1],c,s[1]);
endmodule



//2 bit cla generator
module cla_gen(
    input[1:0] a, b, 
    input ci0,
    output ci1,co
    );
    wire [1:0] p,g;
    //assigning pass through conditions
    assign p[0] = a[0]^b[0];
    assign p[1] = a[1]^b[1];
    //assigning generating conditions
    assign g[0] = a[0]&b[0];
    assign g[1] = a[1]&b[1];
    
    //creating 2nd adder cin
    assign ci1 = g[0]|(p[0]&ci0);
    
    //assigning cout
    assign co = g[1]|(p[1]&ci1);
    
endmodule



//1 bit adder without carry out
module FA(
    input a,b,ci,
    output sum
    );
    assign sum=a^b^ci;
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



