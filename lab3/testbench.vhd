library IEEE;
use IEEE.std_logic_1164.all;

entity tb is			  
	generic (n: positive:=8);
end tb;

architecture TB_ARCHITECTURE of tb is
	component Full_JKFF	  
	port(Set, SD, CLK: in std_logic;
	Q, QN: out std_logic_vector(n downto 0));
	end component;

	signal Set, SD, CLK : std_logic;	
	signal QNarr, Qarr : std_logic_vector(n downto 0);														
begin

	UUT : Full_JKFF
		port map (Set => Set, SD => SD, CLK => CLK, Q => Qarr, QN => QNarr);

  process
  begin	 	
	CLK <= '0', '1' after 10 ns;	  
	wait for 20 ns;
  end process;					
  SD <= '1';
  Set <= '0', '1' after 40 ns;  

end TB_ARCHITECTURE;



