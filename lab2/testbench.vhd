library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity alu_tb is
	-- Generic declarations of the tested unit
	generic(
		NBITS : INTEGER := 12 );
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
		generic(
			NBITS : INTEGER := 12 );
		port(
			a : in STD_LOGIC_VECTOR(NBITS-1 downto 0);
			b : in STD_LOGIC_VECTOR(NBITS-1 downto 0);
			op : in STD_LOGIC_VECTOR(3 downto 0);
			c : out STD_LOGIC_VECTOR(NBITS-1 downto 0);
			cmp : out STD_LOGIC );
	end component;
	
	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(NBITS-1 downto 0);
	signal b : STD_LOGIC_VECTOR(NBITS-1 downto 0);
	signal op : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal c : STD_LOGIC_VECTOR(NBITS-1 downto 0);
	signal cmp : STD_LOGIC;
	
	-- Add your code here ...
	
begin
	
	-- Unit Under Test port map
	UUT : alu
	generic map (
		NBITS => NBITS
		)
	
	port map (
		a => a,
		b => b,
		op => op,
		c => c,
		cmp => cmp
		);
	
	process
	begin
		op<= "1011";
		a<= "010111000101";
		b<= "100111110000";
		wait for 20ns;
		assert(c = (b-a));
		
		op<= "1110";
		wait for 20ns;
		assert(c = ('1' & b(NBITS-1 downto 1)));
		
		op<= "1010";
		wait for 20ns;
		assert (c = (a xor b));
		
	end process;
	
end TB_ARCHITECTURE;



