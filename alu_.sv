module ALU(Ain,Bin,ALUop,out,Z);
input [15:0] Ain, Bin;
input [1:0] ALUop;
output [15:0] out;
output Z;


assign out = (ALUop == 2'b00) ? (Ain + Bin) : (ALUop == 2'b01) ? (Ain - Bin) : (ALUop == 2'b10) ? (Ain & Bin) : (~Bin) ;

assign Z =  (out == 16'b0000000000000000) ?  1'b1 : 1'b0;

endmodule