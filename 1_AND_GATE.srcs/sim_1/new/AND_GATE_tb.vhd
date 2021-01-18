library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity AND_GATE_tb is
end;

architecture bench of AND_GATE_tb is

  component AND_GATE
    Port (
      	clk	: in std_logic;
	rst	: in std_logic;
          a: in std_logic;
          b: in std_logic;
          c: out std_logic;
          	q	: out std_logic
   );
  end component;
  signal clk: std_logic;
  signal rst: std_logic;
  signal a: std_logic;
  signal b: std_logic;
  signal c: std_logic ;
  signal	q	: std_logic;
  	
  constant clock_period: time := 10 ns;

begin

  uut: AND_GATE port map ( clk => clk,
                           rst => rst,
  							a => a,
                           b => b,
                           c => c ,
                           q => q );

  stimulus: process
  begin
    -- Put initialisation code here
    a <= '0';
    b <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    wait for 10 ns;
    
    rst <= '1';
    wait for 5 ns;
    rst <= '0';
    wait for 5 ns;
    -- Put test bench stimulus code here
    wait;
  end process;

  clocking: process
  begin

      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;

  end process;

end;