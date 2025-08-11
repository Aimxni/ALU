module shifter_tb;

reg [15:0] in;
reg [1:0] shift;
wire [15:0] sout;
reg err;

shifter dut(.in(in), .shift(shift), .sout(sout));

initial begin

    in = 16'b1111000011001111; #10;
    shift = 2'b00; 
    if(sout !=  16'b1111000011001111)begin
        $display("Error");
        err = 1;
    end else begin
        $display("Successful");
    end

    in = 16'b1111000011001111; #10;
    shift = 2'b01; 
    if(sout != 16'b1110000110011110)begin
        $display("Error");
        err = 1;
    end else begin
        $display("Successful");
    end

    in = 16'b1111000011001111; #10;
    shift = 2'b10; 
    if(sout != 16'b0111100001100111)begin
        $display("Error");
        err = 1;
    end else begin
        $display("Successful");
    end 

    in = 16'b1111000011001111; #10;
    shift = 2'b11; 
    if(sout != 16'b1111100001100111)begin
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


