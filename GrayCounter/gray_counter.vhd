----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:12 12/09/2018 
-- Design Name: 
-- Module Name:    gray_counter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gray_counter is
    Port (
			  pb : in STD_LOGIC;
           clk : in  STD_LOGIC;
           en : out  STD_LOGIC_VECTOR (3 downto 0);
			  led : out  STD_LOGIC_VECTOR (7 downto 0));
end gray_counter;

architecture Behavioral of gray_counter is
	signal tmp: STD_LOGIC_VECTOR (3 downto 0):= "0000";
	signal my_clk: STD_LOGIC;
	signal sel: unsigned (3 downto 0) := "1110";
	signal tmpLED: unsigned (7 downto 0) := "00000000";
begin

	en <= std_logic_vector(sel);
	led <= std_logic_vector(tmpLED);
	
	-- set 7seg meqdar
	process(sel, pb, tmp)
	begin
	-- x"c0" 0
	-- x"f9" 1
		if(pb = '1') then
			case sel is
			when "1110" =>
				if tmp(0) = '0' then
					tmpLED <= x"c0";
				else
					tmpLED <= x"f9";
				end if;
				
			when "1101" =>
				if tmp(1) = '0' then
					tmpLED <= x"c0";
				else
					tmpLED <= x"f9";
				end if;
			
			when "1011" =>
				if tmp(2) = '0' then
					tmpLED <= x"c0";
				else
					tmpLED<= x"f9";
				end if;
			
			when "0111" =>
				if tmp(3) = '0' then
					tmpLED <= x"c0";
				else
					tmpLED <= x"f9";
				end if;
				
			when others =>
				tmpLED <= (others => '0');
			end case;
		else
		-- x"92" s
		-- x"88" a
		-- x"8c" p
			case sel is
			when "1110" =>
				if tmp(0) = '0' then
					tmpLED <= x"92";
				end if;
			
			when "1101" =>
				if tmp(1) = '0' then
					tmpLED <= x"92";
				end if;
			
			when "1011" =>
				if tmp(2) = '0' then
					tmpLED <= x"88";
				end if;
			
			when "0111" =>
				if tmp(3) = '0' then
					tmpLED <= x"8c";
				end if;
				
			when others =>
				tmpLED <= (others => '0');
			end case;
		end if;
	end process;

	
	-- select shift
	process(clk)
		variable counter : integer range 0 to 5000 := 0;
	begin
		if(rising_edge(clk)) then
			counter := counter + 1;
			if counter = 2499 then
				counter := 0;
				sel <= sel ror 1;
			end if;
		end if;
	end process;
	
	-- clock
	process(clk)
		variable cc : integer range 0 to 12000000 := 0;
	begin
		if(rising_edge(clk)) then
			cc := cc + 1;
			if(cc = 11999999) then
				cc := 0;
				my_clk <= not my_clk;
			end if;
		end if;
	end process;
	
	-- gray code
	process(my_clk)
	begin
		if(rising_edge(my_clk)) then
			if(pb = '1') then
				case tmp is
					when "0000" =>
						tmp <= "0001";
					when "0001" =>
						tmp <= "0011";
					when "0011" =>
						tmp <= "0010";
					when "0010" =>
						tmp <= "0110";
					when "0110" =>
						tmp <= "0111";
					when "0111" =>
						tmp <= "0101";
					when "0101" =>
						tmp <= "0100";
					when "0100" =>
						tmp <= "1100";
					when "1100" =>
						tmp <= "1101";
					when "1101" =>
						tmp <= "1111";
					when "1111" =>
						tmp <= "1110";
					when "1110" =>
						tmp <= "1010";
					when "1010" =>
						tmp <= "1011";
					when "1011" =>
						tmp <= "1001";
					when "1001" =>
						tmp <= "1000";
					when "1000" =>
						tmp <= "0000";
					when others =>
						tmp <= "0000";
				end case;
			end if;
		end if;
	end process;

end Behavioral;

