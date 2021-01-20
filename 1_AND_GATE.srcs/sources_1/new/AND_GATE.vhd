
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity AND_GATE is
  Port (
  	clk	: in std_logic;
	rst	: in std_logic;
	a	: in std_logic;
 	b	: in std_logic;
 	c	: out std_logic;
 	d     : out std_logic;
 	q	: out std_logic
 );
end AND_GATE;

architecture Behavioral of AND_GATE is
signal tmp      : integer range 0 to 27;
signal tmpclk   : std_logic;
signal Q1       : std_logic;
begin

    c <= not a;
    d <= b;
    q <= Q1;
    
    process(tmpclk, rst)
    begin
		if rst = '1' then
			Q1 <= '1';
		elsif rising_edge(tmpclk) then
			Q1 <= not Q1;
		end if;
    end process;
    
	FSM:	process(clk, rst)
    begin
    	if rst = '1' then
    		tmp <= 0;
    		tmpclk <= '1';
    	elsif rising_edge(clk) then
    		tmp <= tmp+1;
    		if tmp > 15000000 then
    			tmpclk <= not tmpclk;
    			tmp <= 0;
    		end if;	
    	end if;
    end process;

end Behavioral;
