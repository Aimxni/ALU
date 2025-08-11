module ALU_tb;

reg [15:0] Ain, Bin;
reg [1:0] ALUop;
wire [15:0] out;
reg Z;
reg err;

ALU dut(.Ain(Ain), .Bin(Bin), .ALUop(ALUop), .out(out), .Z(Z));

initial begin

    // Initial Inputs
    Ain = 16'b0000000000000000;
    Bin = 16'b0000000000000000;
    ALUop = 2'b00;
    err = 0;

    // Test for basic addition 
    Ain = 16'b0000000000000101; //5
    Bin = 16'b0000000000000101; //5
    ALUop = 2'b00; #10;
    if(out != 16'b0000000000001010 || Z != 0 )begin
        $display("Error");
        err = 1;
    end else begin
        $display("Successful");
    end


    // Test for basic subtraction
    Ain = 16'b0000000000001010; //10
    Bin = 16'b0000000000000101; //5
    ALUop = 2'b01; #10;
    if(out != 16'b0000000000000101 || Z != 0)begin
        $display("Error");
        err = 1;
    end else begin
        $display("Successful");
    end

    // Test for AND
    Ain = 16'b0000000000000101; //5
    Bin = 16'b0000000000000010; //2
    ALUop = 2'b10; #10;
    if(out != 16'b0000000000000000 || Z != 1)begin
        $display("Error");
        err = 1;
    end else begin
        $display("Successful");
    end

    // Test for NOT
    Ain = 16'b0000000000000101;
    Bin = 16'b0000000000000000;
    ALUop = 2'b11; #10;
    if(out != 16'b1111111111111111 || Z != 0)begin
        $display("Error");
        err = 1;
    end else begin
        $display("Successful");
    end

    if(~err) $display("PASSED");
else $display("FAILED");
$stop;
end
endmodule


