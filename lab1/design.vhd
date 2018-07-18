
library IEEE;
use IEEE.std_logic_1164.all;
entity var13 is
	port( clk, clr : in  bit;
		q0,q1,q2, q3 : out bit
		); 
end entity var13;

architecture arch_var13 of var13 is
	signal w0, w1, w2, w3, w4, q1in, q2in, q0in, q3in: bit;
begin
	
	w0 <= q0in xor w1;
	w1 <= not(q3in or q2in or q1in);
	w2 <= q1in xor w3;
	w3 <= q2in nor q3in;
	w4 <= q2in xor not q3in;
	
	process (clr, clk)
	begin 
		if clr = '0' then
			q0in <= '0';
		elsif Clk'event and clk = '1' then
			q0in <= w0;
		end if;
	end process;
	
	process (clr, clk)
	begin 
		if clr = '0' then
			q1in <= '0';
		elsif Clk'event and clk = '1' then
			q1in <= w3;
		end if;
	end process;
	
	process (clr, clk)
	begin 
		if clr = '0' then
			q2in <= '0';
		elsif Clk'event and clk = '1' then
			q2in <= w4;
		end if;
	end process; 
	
	process (clr, clk)
	begin 
		if clr = '0' then
			q3in <= '0';
		elsif Clk'event and clk = '1' then
			q3in <= not q3in;
		end if;
	end process;
	
	
	q0 <= q0in;
	q1 <= q1in;
	q2 <= q2in;
	q3 <= q3in;
	
end architecture arch_var13;
