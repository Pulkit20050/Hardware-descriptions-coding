`timescale 1ns / 1ps
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
always #5 clk100= ~clk100;//100MHZ
always begin
  #5;
  clk50=~clk50;//50MHZ
  #10;
  clk50=~clk50;
  #5;
end
always begin
  #5;
  clk25=~clk25;//25MHZ
  #20;
  clk25=~clk25;
  #15;
end
initial begin
    $dumpfile("sim.vcd");
  $dumpvars(0,tb);
end
initial begin
    #200;
    $finish();// as it will run forever we need to end it.
end
endmodule

    
