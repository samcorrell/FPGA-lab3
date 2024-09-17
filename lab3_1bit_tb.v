`timescale 1ns / 1ps


module lab3_1bit_tb;
reg a,b,ci;
wire sum,co;

FA uut(a,b,ci,sum,co);
integer i,j,k;
initial
begin
    for(i=0;i<2;i=i+1)
    begin
        for(j=0;j<2;j=j+1)
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