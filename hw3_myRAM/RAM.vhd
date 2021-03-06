library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_bit.all;

entity RAM is
	port(
		Clock, Write_En : in std_logic;
		Read_Adr, Write_Adr : in integer range 511 downto 0;
		Write_Data : in std_logic_vector( 15 downto 0 );
		Read_Data : out std_logic_vector( 15 downto 0 )
	);
end RAM;

architecture behavior of RAM is
type my_storage is array( 511 downto 0 )of std_logic_vector( 15 downto 0 );
begin
	process( Clock, Write_En, Write_Data, Read_Adr, Write_Adr )
	variable my_RAM : my_storage;
	begin
		Read_Data <= my_RAM( Read_Adr );
		if( ( Clock'EVENT and Clock = '1' ) and Write_En = '1' ) then
			my_RAM( Write_Adr ) := Write_Data;
		end if;
	end process;
end behavior;