`timescale 1ns/1ps
module fa(s,cout,a,b,cin);
output s,cout;
input a,b,cin;
assign s=a^b^cin;
assign cout=(a&b)|(a&cin)|(b&cin);
endmodule
module bit4_rca(s,cout,a,b,cin);
output [3:0]s;
output cout;
input [3:0]a,b;
input cin;
wire c1,c2,c3;
fa fa0(s[0],c1,a[0],b[0],cin);
fa fa1(s[1],c2,a[1],b[1],c1);
fa fa2(s[2],c3,a[2],b[2],c2);
fa fa3(s[3],cout,a[3],b[3],c3);
endmodule
