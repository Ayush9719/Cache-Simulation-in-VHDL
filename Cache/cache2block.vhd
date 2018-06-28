LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

entity cache2block is port(

	--Main ports
	write_data	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	addr_to_be_read	: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	read_write	: INOUT STD_LOGIC;
	clk		: INOUT STD_LOGIC;
	read_data	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);

	--Cache 0 ports
	d0		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ld0		: INOUT STD_LOGIC; -- load/enable.
	output0		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	src_addr0	: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	addr0		: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	ctr0		: INOUT STD_LOGIC;
    
	--Cache 1 port
	d1		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ld1		: INOUT STD_LOGIC;
	output1		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	src_addr1	: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	addr1    	: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	ctr1     	: INOUT STD_LOGIC;

	
	--Memory 0 port
	mem_d0		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld0		: INOUT STD_LOGIC;
	mem_output0	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr0	: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);

	--Memory 1 port
	mem_d1		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld1		: INOUT STD_LOGIC;
	mem_output1	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr1	: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);

	--Memory 2 port
	mem_d2		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld2		: INOUT STD_LOGIC;
	mem_output2	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr2	: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0);

	--Memory 3 port
	mem_d3		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld3		: INOUT STD_LOGIC;
	mem_output3	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr3	: INOUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
end cache2block;

ARCHITECTURE main_cache_2 OF cache2block IS 
signal addr_00:STD_LOGIC_VECTOR(1 DOWNTO 0):="00";
signal addr_01:STD_LOGIC_VECTOR(1 DOWNTO 0):="01";
signal addr_02:STD_LOGIC_VECTOR(1 DOWNTO 0):="10";
signal addr_03:STD_LOGIC_VECTOR(1 DOWNTO 0):="11";

BEGIN 

	process(clk)
	begin
	if read_write='1' then
		if (addr_to_be_read=addr_00) or (addr_to_be_read=addr_02) then
			if (addr_to_be_read=addr0) then
				read_data<=output0;
			elsif(addr_to_be_read=mem_addr0) then
				src_addr0<=addr_to_be_read;	
				ctr0<='1'; --addr line
				addr0<=src_addr0;
				ld0<='1';
				d0<=mem_output0;
				output0<=d0;
				read_data<=d0;
			
			elsif(addr_to_be_read=mem_addr2) then
				src_addr0<=addr_to_be_read;	
				ctr0<='1'; --addr line
				addr0<=src_addr0;
				ld0<='1';
				d0<=mem_output2;
				output0<=d0;
				read_data<=d0;
			
			end if;
		elsif (addr_to_be_read=addr_01) or (addr_to_be_read=addr_03) then
			if (addr_to_be_read=addr1) then
				read_data<=output1;
			elsif(addr_to_be_read=mem_addr1) then
				src_addr1<=addr_to_be_read;	
				ctr1<='1'; --addr line
				addr1<=src_addr1;
				ld1<='1';
				d1<=mem_output1;
				output1<=d1;
				read_data<=d1;
			elsif(addr_to_be_read=mem_addr3) then
				src_addr1<=addr_to_be_read;	
				ctr1<='1'; --addr line
				addr1<=src_addr1;
				ld1<='1';
				d1<=mem_output3;
				output1<=d1;
				read_data<=d1;
			
			end if;
		
		end if;
	else
		if (addr_to_be_read=addr0) then
			ld0<='1';
			d0<=write_data;
		end if;
		if (mem_addr0=addr0) then
			mem_ld0<='1';
			mem_d0<=write_data;
			mem_output0<=write_data;
		elsif (mem_addr2=addr0) then
			mem_ld2<='1';
			mem_d2<=write_data;
			mem_output2<=write_data;
		end if;
		
		if (addr_to_be_read=addr1) then
			ld1<='1';
			d1<=write_data;
		end if;
		if (mem_addr1=addr1) then
			mem_ld1<='1';
			mem_d1<=write_data;
			mem_output1<=write_data;
		elsif (mem_addr3=addr1) then
			mem_ld3<='1';
			mem_d3<=write_data;
			mem_output3<=write_data;
		end if;
	end if;
end process;
END main_cache_2;