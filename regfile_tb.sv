module regfile_tb;
reg [15:0] data_in;
reg [2:0] writenum, readnum;
reg write, clk;
wire [15:0] data_out;
reg err;

regfile dut(.data_in(data_in), .writenum(writenum), .readnum(readnum), .clk(clk), .data_out(data_out));

initial begin
    clk = 0; #5;
    
    forever begin
        clk = 1; #5;
        clk = 0; #5;
    end
end


initial begin
write = 0;
data_in = 16'b0;
writenum = 3'b0;
readnum = 3'b0;
err = 1'b0;

//Test 1 write to register R0
write = 1;
data_in = 16'b0000000000101010;
writenum = 3'b000; #10;
write = 0;

// read from register R0
readnum = 3'b000; #10;
if(data_out != 16'b0000000000101010) begin
    $display("Error while reading register R0: expected %b and got %b", 16'b0000000000101010, data_out);
    err = 1'b1;
end
else begin
    $display("Reading from R0: %b", data_out);
    err = 1'b0;
end

//Test 2 write to register R1
write = 1;
data_in = 16'b0000000000001010; //10
writenum = 3'b001; #10;
write = 0;

//read from register R1
readnum = 3'b001; #10;
if(data_out != 16'b0000000000001010)begin
    $display("Error while reading register R1: expected %b and got %b", 16'b0000000000001010, data_out);
    err = 1'b1;
end
else begin
    $display("Reading from R1: %b", data_out);
    err = 1'b0;
end

// Test 3 write to register R2
write = 1;
data_in = 16'b0000000000010100; //20
writenum = 3'b010; #10;
write = 0;

//read from register R2;
readnum = 3'b010; #10;
if(data_out != 16'b0000000000010100)begin
    $display("Error while reading register R2: expected %b and got %b", 16'b0000000000010100, data_out);
    err = 1'b1;
end
else begin
    $display("Reading from R2: %b", data_out);
    err = 1'b0;
end

// Test 4 to write to register R3
write = 1;
data_in = 16'b0000000000011110; //30
writenum = 3'b011; #10;
write = 0;

//read from register R3
readnum = 3'b011; #10;
if(data_out != 16'b0000000000011110)begin
    $display("Error while reading register R3: expected %b and got %b", 16'b0000000000011110, data_out);
    err = 1'b1;
end
else begin
    $display("Reading from R3: %b", data_out);
    err = 1'b0;
end

// Test 5 to write to register R4
write = 1;
data_in = 16'b0000000000100011; //35
writenum = 3'b100; #10;
write = 0;

//read from register R4
readnum = 3'b100; #10;
if(data_out != 16'b0000000000100011)begin
    $display("Error while reading register R4: expected %b and got %b", 16'b0000000000100011, data_out);
    err  = 1'b1;
end
else begin
    $display("Reading from R4: %b", data_out);
    err = 1'b0;
end

// Test 6 to write to register R5
write = 1;
data_in = 16'b0000000000001111; //15
writenum = 3'b101; #10;
write = 0;

//read from register R5
readnum = 3'b101; #10;
if(data_out != 16'b0000000000001111)begin
    $display("Error while reading register R5: expected %b and got %b", 16'b0000000000001111, data_out);
    err = 1'b1;
end
else begin
    $display("Reading from R5: %b", data_out);
    err = 1'b0;
end

// Test 7 to write to register R7
write = 1;
data_in = 16'b0000000000001000; //8
writenum = 3'b110; #10;
write = 0;

//read from register R6
readnum = 3'b110; #10;
if(data_out != 16'b0000000000001000)begin
    $display("Error while reading from register R6: expected %b and got %b", 16'b0000000000001000, data_out);
    err = 1'b1;
end
else begin
    $display("Reading from R6: %b", data_out);
    err = 1'b0;
end

// Test 8 to write to register R8
write = 1;
data_in = 16'b0000000000000101; //5
writenum = 3'b111; #10;
write = 0;

//read from register R7
readnum = 3'b111; #10;
if(data_out != 16'b0000000000000101)begin
    $display("Error while reading from register R7: expected %b and got %b", 16'b0000000000000101, data_out);
    err = 1'b1;
end
else begin
    $display("Reading from R7: %b", data_out);
    err = 1'b0;
end

if(~err) $display("PASSED");
else $display("FAILED");
$stop;
end

endmodule

