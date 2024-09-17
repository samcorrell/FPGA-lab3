`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 02:17:42 PM
// Design Name: 
// Module Name: lab3_2bit_tb
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


module lab3_2bit_tb;
reg [1:0]a,b; //inputs
reg ci; //input
wire [6:0] bcd; //output

lab3_ripple uut(a,b,ci,bcd);
integer i,j,k;
initial
begin
    for(i=0;i<4;i=i+1)
    begin
        for(j=0;j<4;j=j+1)
        begin
            for(k=0;k<2;k=k+1)
            begin
                a=i; b=j; ci=k;
                #10;
            end
        end
    end
    $stop;
end
endmodule
