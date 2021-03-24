LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY RAM_2_PORT is
	PORT
	(
		Clock, Write_En : IN STD_LOGIC;
		Write_Data : IN STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		Read_Adr, Write_Adr : IN STD_LOGIC_VECTOR( 8 DOWNTO 0 );
		Read_Data : OUT STD_LOGIC_VECTOR( 15 DOWNTO 0 )
	);
END RAM_2_PORT;


ARCHITECTURE behavior of RAM_2_PORT is

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (15 DOWNTO 0);

	COMPONENT altsyncram
	GENERIC (
		address_aclr_a	: STRING;
		address_aclr_b	: STRING;
		address_reg_b : STRING;
		indata_aclr_a : STRING;
		intended_device_family : STRING;
		lpm_type : STRING;
		numwords_a : NATURAL;
		numwords_b : NATURAL;
		operation_mode : STRING;
		outdata_aclr_b : STRING;
		outdata_reg_b : STRING;
		power_up_uninitialized : STRING;
		read_during_write_mode_mixed_ports : STRING;
		widthad_a : NATURAL;
		widthad_b : NATURAL;
		width_a : NATURAL;
		width_b	: NATURAL;
		width_byteena_a : NATURAL;
		wrcontrol_aclr_a : STRING
	);
	PORT (
			wren_a : IN STD_LOGIC ;
			clock0 : IN STD_LOGIC ;
			address_a : IN STD_LOGIC_VECTOR( 8 DOWNTO 0 );
			address_b : IN STD_LOGIC_VECTOR( 8 DOWNTO 0 );
			q_b : OUT STD_LOGIC_VECTOR( 15 DOWNTO 0 );
			data_a : IN STD_LOGIC_VECTOR( 15 DOWNTO 0 )
	);
	END COMPONENT;

BEGIN
	Read_Data <= sub_wire0( 15 DOWNTO 0 );

	altsyncram_component : altsyncram
	GENERIC MAP (
		address_aclr_a => "NONE",
		address_aclr_b => "NONE",
		address_reg_b => "CLOCK0",
		indata_aclr_a => "NONE",
		intended_device_family => "Stratix",
		lpm_type => "altsyncram",
		numwords_a => 512,
		numwords_b => 512,
		operation_mode => "DUAL_PORT",
		outdata_aclr_b => "NONE",
		outdata_reg_b => "UNREGISTERED",
		power_up_uninitialized => "FALSE",
		read_during_write_mode_mixed_ports => "DONT_CARE",
		widthad_a => 9,
		widthad_b => 9,
		width_a => 16,
		width_b => 16,
		width_byteena_a => 1,
		wrcontrol_aclr_a => "NONE"
	)
	PORT MAP (
		wren_a => Write_En,
		clock0 => Clock,
		address_a => Write_Adr,
		address_b => Read_Adr,
		data_a => Write_Data,
		q_b => sub_wire0
	);

END behavior;