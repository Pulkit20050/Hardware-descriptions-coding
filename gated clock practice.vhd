library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity dff is 
    port(
        qout: out std_logic;
        din: in std_logic;
        clk: in std_logic;
    );
    end dff;

architecture behav of dff is 
begin
    process(clk)
    begin
        if(rising_state(clk)) then
            qout<=din;
        end if;
    end process;
end behav;


entity top is 
    port(
        qout: out std_logic;
        din: in std_logic;
        clk: in std_logic;
        clk_en: in std_logic; 
    );
    attribute gated_clock: string; attribute gated_clock of clk is
        signal is true,
    end top;
architecture b of top is 
    signal temp_clk: std_logic:=0;
    component dff is 
        port(
            qout: out std_logic;
            din: in std_logic;
            clk: in std_logic;
            );
        end component;
begin
    temp_clk<=clk and clk_en;
    d1: dff port map(
        qout=> qout,
        din=> din,
        clk=> clk
    );
    end b;
