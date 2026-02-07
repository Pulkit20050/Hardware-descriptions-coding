module tb;//configuring a clock
reg clk=0;
reg clk50=0;
always #5 clk=~clk;

task calc(input real freq_Hz, input real phase,input real duty_cycle, output real pout, output real ton, output real toff); begin
pout=phase;
ton=(1000_000_000/freq_Hz)*duty_cycle;
toff=(1000_000_000/freq_Hz)-ton;
end
endtask

task clkgen(input real pout, input real ton, input real toff); begin
@(posedge clk)// to make the clk50 sense the clk, and go high when clk toggles
#pout;
while(1)begin
clk50=1;
#ton;
clk50=0;
#toff;
end
end
endtask

real pout,ton,toff;

initial begin
calc(20_000_000, 0, 0.6, pout,ton,toff);
clkgen(pout, ton, toff);
end

initial begin
#200;
$finish;
end
endmodule