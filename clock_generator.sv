module tb;
reg clk25;
reg rst;
reg clk50;
reg clk100;
//alternate
//reg clk25=0; also initialises the clock value
initial
    begin
        clk100=1'b0;
        clk50=1'b0;
        clk25=1'b0;
        rst=1'b0;
    end
always #5 clk= ~clk;//100MHZ
always #10 clk2=~clk2;//50MHZ
always #20 clk3=~clk3;//25MHZ
initial begin
    $dumpfile("sim.vcd");
    $dumpvars;
end
initial begin
    //#200; Simulation time
    $finish();// as it will run forever we need to end it.
end
endmodule

    