library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
	generic (NBITS: integer :=12);
	port ( a : in STD_LOGIC_VECTOR (NBITS-1 downto 0); 
b : in STD_LOGIC_VECTOR (NBITS-1 downto 0); 
op : in STD_LOGIC_VECTOR (3 downto 0); 
c : out STD_LOGIC_VECTOR (NBITS-1 downto 0); 
cmp : out std_logic); 
end alu;

architecture Behavioral of alu is
begin
	process(a, b, op)
	begin	   
		
		case op is
			when "1011" => c <= b-a;
			when "1110" => c <= '1' & b(NBITS-1 downto 1);
			when "1010" => c <= a xor b;
			when others => c <= (OTHERS=>'0'); cmp <= '-';
		end case;
	end process;
end Behavioral;