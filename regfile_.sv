module regfile(data_in,writenum,write,readnum,clk,data_out);
input [15:0] data_in;
input [2:0] writenum, readnum;
input write, clk;
output [15:0] data_out;
reg [15:0] R[7:0]; // an array of 8 16-bit integers R0, R1, ..... R
reg [15:0] data_out;


always_ff @ (posedge clk)
begin 
if (write) //load-enable
    R[writenum] <= data_in;  //writenum decides which register to write into
end  

assign data_out = R[readnum]; //readnum decides which registor to read from and assign data out



endmodule
