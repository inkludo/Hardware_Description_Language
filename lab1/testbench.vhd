
library IEEE;
use IEEE.std_logic_1164.all;

entity var13_tb is
end var13_tb;

architecture TB_ARCH of var13_tb is
	constant half_period: time:= 10ns;
	component var13
	port(
		clk : in BIT;
		clr : in BIT;
		q0 : out BIT;
		q1 : out BIT;
		q2 : out BIT;
		q3 : out BIT );
	end component;

	
	signal clk : BIT;
	signal clr : BIT;
	
	signal q0 : BIT;
	signal q1 : BIT;
	signal q2 : BIT;
	signal q3 : BIT;

	
begin

	UUT : var13
		port map (
			clk => clk,
			clr => clr,
			q0 => q0,
			q1 => q1,
			q2 => q2,
			q3 => q3
		);

	clk<=not clk after half_period;
   
         
  process
  begin
  clr <= '0', '1' after 50 ns;
  wait;
  end process;

end TB_ARCH;



