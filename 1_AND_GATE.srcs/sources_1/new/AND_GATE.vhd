
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity AND_GATE is
  Port (
  	clk			: in std_logic;
	rst			: in std_logic;
	button_add	: in std_logic; -- th + 
 	button_sub	: in std_logic; -- th -
 	seg_led		: out std_logic_vector(3 downto 0);
 	seg2		: out std_logic;
 	q			: out std_logic
 );
end AND_GATE;

architecture Behavioral of AND_GATE is
signal tmp      : integer range 0 to 50000000;
signal th       : integer range 0 to 50000000;
signal tmpclk   : std_logic;
signal Q1       : std_logic;

signal segcount	: std_logic_vector(3 downto 0);
signal cs2		: std_logic;

begin
	
	seg2	<= cs2;
	seg_led <= segcount;
    q		<= Q1;

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
    		th <= 25000000;
    		segcount <= "0000";
    		cs2 <= '1';
    	elsif rising_edge(clk) then
    		tmp <= tmp + 1;
    		if tmp > th then
    			tmpclk <= not tmpclk;
    			segcount <= segcount+1;
    			if segcount = 9 then 
    				segcount <= "0000";	
    			end if;
    			tmp <= 0;
    		else
    			null;
    		end if;	
    	end if;
    end process;

end Behavioral;
