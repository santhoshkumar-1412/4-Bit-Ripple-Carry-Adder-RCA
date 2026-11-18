`timescale 1ns/1ps	
module bitrca4_tb();
wire [3:0]s;
wire cout,c1,c2,c3;
reg [3:0]a,b;
reg cin;
bit4_rca dut(.s(s),.cout(cout),.a(a),.b(b),.cin(cin));
initial 
begin
a=4'b0100;b=4'b0011;cin=0;
#10;a=4'b0101;b=4'b1111;cin=1;
#10;a=4'b0011; b=4'b0010; cin=0;
#10;a=4'b1111; b=4'b0001; cin=0;
#10;a=4'b1010; b=4'b0101; cin=1;
#10;
$dumpfile("4bitrca.vcd");
$dumpvars(0,bitrca4_tb);
end
endmodule
