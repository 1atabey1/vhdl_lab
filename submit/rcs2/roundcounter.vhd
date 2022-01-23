----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    roundcounter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity roundcounter is
    Port ( CLK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end roundcounter;

architecture Behavioral of roundcounter is
	type T_STATE is (SLEEP, SETUP, CALC);
begin
	process(CLK) is
	variable roundcount : std_logic_vector (3 downto 0) := "1000";
	variable STATE, NEXT_STATE : T_STATE := SLEEP;
	begin
		if rising_edge(CLK) then
			-- roundcounter FSM
			case STATE is
				when SLEEP =>
					INIT <= '0';
					READY <= '1';
					if START = '1' then
						NEXT_STATE := SETUP;
						roundcount := "0000";
					end if;
				when SETUP =>
					INIT <= '1';
					READY <= '0';
					NEXT_STATE := CALC;
				when CALC =>
					INIT <= '0';
					if RESULT = '1' then
						if roundcount = "1000" then
							NEXT_STATE := SLEEP;
						else
							roundcount := roundcount + '1';
							NEXT_STATE := SETUP;
						end if;
					end if;
			end case;
			
			-- assign outputs based on roundcounter
			TRAFO <= roundcount(3);
			
			if roundcount = "0000" then
				S_i <= '1';
			else
				S_i <= '0';
			end if;
			
			STATE := NEXT_STATE;
			ROUND <= roundcount;
		end if;
	end process;
end Behavioral;

