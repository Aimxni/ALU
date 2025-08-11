module datapath (clk, writenum, readnum, write, datapath_in, vsel, loada, loadb, loadc, shift, asel, bsel, ALUop, loads, Z_out, datapath_out);
input write, clk, loada, loadb, loadc, asel, bsel, loads, vsel;
input [1:0] ALUop, shift;
input [2:0] writenum, readnum;
input [15:0] datapath_in;
output Z_out;
output [15:0] datapath_out;
wire [15:0] data_in;
reg[15:0] aloaded, in;
wire [15:0] Bin, Ain;
reg Z_out;
reg [15:0] datapath_out;
wire [15:0] data_out, sout, out;
wire Z;
assign data_in = vsel ? datapath_in : datapath_out; //vsel mux

regfile REGFILE(data_in, writenum, write, readnum, clk, data_out); //regfile

always_ff @(posedge clk) //loada flip flop
begin
if (loada == 1) 
begin
 aloaded <= data_out ;
end
end 

always_ff @(posedge clk) //load b flipflop
begin
if (loadb == 1) 
begin
 in <= data_out ;
end
end 

shifter SHIFTER(in,shift,sout);

assign Bin = bsel ? ({11'b0, datapath_in[4:0]}) : sout ; //bsel mux 

assign Ain = asel ? (16'b0000000000000000) : aloaded ;

ALU alu(Ain,Bin,ALUop,out,Z); //alu 

always_ff @(posedge clk) //load-s flipflop
begin
if (loads == 1) 
begin
 Z_out <= Z ;
end
end 

always_ff @(posedge clk) //load c flipflop
begin
if (loadc == 1) 
begin
 datapath_out <= out ;
end
end 

endmodule 