library IEEE;
use IEEE.std_logic_1164.all;
entity JKFF is
	port (SD, RD, J, K, CLK: in std_logic;
		Q, QN : out std_logic);
end JKFF;
architecture JKFF1 of JKFF is
	signal Qin: std_logic;
begin
	process (SD, RD, CLK)     
	begin
		if RD = '0' then
			Qin <=  '0';
		elsif SD = '0' then
			Qin<= '1';  
            elsif CLK = '0' and CLK'event then
			Qin<=(J and not Qin) or (not K and Qin);
		end if;
	end process ;
	
	Q<=Qin; QN <= not Qin;
end JKFF1 ;



library ieee;
use ieee.std_logic_1164.all;

entity Full_JKFF is
	generic (n: positive:=8);
	port (Set, SD, CLK: in std_logic;
	Q, QN: out std_logic_vector(n downto 0));      
end Full_JKFF;

architecture Structure of Full_JKFF is
	component JKFF
		port (SD, RD, J, K, CLK: in std_logic;
		Q, QN : out std_logic);                                  
	end component ;
	signal Qarr, QNarr: STD_LOGIC_VECTOR(n downto 0);
begin
	Full_JKFF: for i in 0 to n-1 generate
		begin
		FAx: JKFF port map (CLK => CLK, SD => SD, RD => Set,
							J => Qarr(i), Q => Qarr(i + 1), 
							K => QNarr(i), QN => QNarr(i + 1));
	end generate Full_JKFF;
	Qarr(0) <= QNarr(n - 1);
	QNarr(0) <= Qarr(n - 1); 
	
	Q <= Qarr;
	QN <= QNarr;
end Structure;