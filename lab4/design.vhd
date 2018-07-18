library IEEE;
use IEEE.std_logic_1164.all;
entity FSM is 
	port ( Clk: in STD_LOGIC;
		Reset: in STD_LOGIC;
		st, a, c, b: in STD_LOGIC;
		done, v1, v2, z, v3: out STD_LOGIC);
end;

architecture FSM of FSM is
	type State_type is (S0, S1, S2, S3);
	signal State, NextState: State_type;
begin
	-- NextState logic (combinatorial)
	Sreg0_NextState: process (st, a, c, b)
	begin	
		case State is
			when s0 => if st = '1' then NextState <= s0;
				elsif a = '1' then NextState <= s2;
				else 
					NextState <= s1;  
			end if;
			when s1 => if c = '1' then NextState <= s3;
				else	
					NextState <= s2;
			end if;	 
			when s2 => NextState <= s3;
			when s3 => if b = '1' then NextState <= s0;
				else
					NextState <= s2;
			end if;
			when others => NextState <= s0; 
		end case;
	end process;
	
	Sreg0_CurrentState: process (Clk, reset)
	begin
		if Reset='1' then
			State <= s0; 
		elsif Clk'event and Clk = '1' then 
			State <= NextState;
		end if;
	end process;  
	done <= '1' when State = s0 else
	'0'; 
	v1 <= '1' when State = s1 or State = s2 else
	'0';
	v2 <= '1' when State = s1 else
	'0'; 
	v3 <= '1' when State = s3 else
	'0';						   
	z <= '1' when State = s3 or state = s2 else
	'0';
	end;
