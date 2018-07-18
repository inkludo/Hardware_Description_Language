library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity fsm_tb is
end fsm_tb;

architecture TB_ARCHITECTURE of fsm_tb is
	-- Component declaration of the tested unit
	component fsm
	port(
		Clk : in STD_LOGIC;
		Reset : in STD_LOGIC;
		st : in STD_LOGIC;
		a : in STD_LOGIC;
		c : in STD_LOGIC;
		b : in STD_LOGIC;
		done : out STD_LOGIC;
		v1 : out STD_LOGIC;
		v2 : out STD_LOGIC;
		z : out STD_LOGIC;
		v3 : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Clk : STD_LOGIC;
	signal Reset : STD_LOGIC;
	signal st : STD_LOGIC;
	signal a : STD_LOGIC;
	signal c : STD_LOGIC;
	signal b : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal done : STD_LOGIC;
	signal v1 : STD_LOGIC;
	signal v2 : STD_LOGIC;
	signal z : STD_LOGIC;
	signal v3 : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : fsm
		port map (
			Clk => Clk,
			Reset => Reset,
			st => st,
			a => a,
			c => c,
			b => b,
			done => done,
			v1 => v1,
			v2 => v2,
			z => z,
			v3 => v3
		);

		process 
	begin
		clk <= '1'; wait for 10ns; 
		clk <= '0'; wait for 10ns;
	end process;
	process 
	begin
		reset <= '1'; wait for 20ns; 
		reset <= '0'; wait for 200ns;
	end process;
	
	process 
	begin
		st <= '1'; wait for 20ns; 
		st <= '0'; wait for 20ns;
	end process;
	
	process 
	begin
		a <= '1'; wait for 40ns; 
		a <= '0'; wait for 45ns;
	end process; 
	
		process 
	begin
		c <= '1'; wait for 65ns; 
		c <= '0'; wait for 65ns;
	end process;
	
			process 
	begin
		b <= '1'; wait for 85ns; 
		b <= '0'; wait for 85ns;
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_fsm of fsm_tb is
	for TB_ARCHITECTURE
		for UUT : fsm
			use entity work.fsm(fsm);
		end for;
	end for;
end TESTBENCH_FOR_fsm;

