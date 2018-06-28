LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

entity cache is port(

	--Main ports
	write_data	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	addr_to_be_read	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	read_write	: INOUT STD_LOGIC;
	clk		: INOUT STD_LOGIC;
	read_data	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);

	--Cache 0 ports
	d0		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ld0		: INOUT STD_LOGIC; -- load/enable.
	output0		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	src_addr0	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	addr0		: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	ctr0		: INOUT STD_LOGIC;
    
	--Cache 1 port
	d1		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ld1		: INOUT STD_LOGIC;
	output1		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	src_addr1	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	addr1    	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	ctr1     	: INOUT STD_LOGIC;

	--Cache 2 ports
	d2		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ld2		: INOUT STD_LOGIC; -- load/enable.
	output2		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	src_addr2	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	addr2		: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	ctr2		: INOUT STD_LOGIC;
    
	--Cache 3 port
	d3		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ld3		: INOUT STD_LOGIC;
	output3		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	src_addr3	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	addr3    	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	ctr3     	: INOUT STD_LOGIC;

	--Memory 0 port
	mem_d0		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld0		: INOUT STD_LOGIC;
	mem_output0	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr0	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 1 port
	mem_d1		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld1		: INOUT STD_LOGIC;
	mem_output1	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr1	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 2 port
	mem_d2		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld2		: INOUT STD_LOGIC;
	mem_output2	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr2	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 3 port
	mem_d3		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld3		: INOUT STD_LOGIC;
	mem_output3	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr3	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 4 port
	mem_d4		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld4		: INOUT STD_LOGIC;
	mem_output4	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr4	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 5 port
	mem_d5		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld5		: INOUT STD_LOGIC;
	mem_output5	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr5	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 6 port
	mem_d6		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld6		: INOUT STD_LOGIC;
	mem_output6	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr6	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 7 port
	mem_d7		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld7		: INOUT STD_LOGIC;
	mem_output7	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr7	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 8 port
	mem_d8		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld8		: INOUT STD_LOGIC;
	mem_output8	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr8	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 9 port
	mem_d9		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld9		: INOUT STD_LOGIC;
	mem_output9	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr9	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 10 port
	mem_d10		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld10	: INOUT STD_LOGIC;
	mem_output10	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr10	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 11 port
	mem_d11		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld11	: INOUT STD_LOGIC;
	mem_output11	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr11	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 12 port
	mem_d12		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld12	: INOUT STD_LOGIC;
	mem_output12	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr12	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 13 port
	mem_d13		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld13	: INOUT STD_LOGIC;
	mem_output13	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr13	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 14 port
	mem_d14		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld14	: INOUT STD_LOGIC;
	mem_output14	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr14	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);

	--Memory 15 port
	mem_d15		: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_ld15	: INOUT STD_LOGIC;
	mem_output15	: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mem_addr15	: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0)

);
end cache;

ARCHITECTURE main_cache OF cache IS 
signal addr_00:STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
signal addr_01:STD_LOGIC_VECTOR(3 DOWNTO 0):="0001";
signal addr_02:STD_LOGIC_VECTOR(3 DOWNTO 0):="0010";
signal addr_03:STD_LOGIC_VECTOR(3 DOWNTO 0):="0011";
signal addr_04:STD_LOGIC_VECTOR(3 DOWNTO 0):="0100";
signal addr_05:STD_LOGIC_VECTOR(3 DOWNTO 0):="0101";
signal addr_06:STD_LOGIC_VECTOR(3 DOWNTO 0):="0110";
signal addr_07:STD_LOGIC_VECTOR(3 DOWNTO 0):="0111";
signal addr_08:STD_LOGIC_VECTOR(3 DOWNTO 0):="1000";
signal addr_09:STD_LOGIC_VECTOR(3 DOWNTO 0):="1001";
signal addr_10:STD_LOGIC_VECTOR(3 DOWNTO 0):="1010";
signal addr_11:STD_LOGIC_VECTOR(3 DOWNTO 0):="1011";
signal addr_12:STD_LOGIC_VECTOR(3 DOWNTO 0):="1100";
signal addr_13:STD_LOGIC_VECTOR(3 DOWNTO 0):="1101";
signal addr_14:STD_LOGIC_VECTOR(3 DOWNTO 0):="1110";
signal addr_15:STD_LOGIC_VECTOR(3 DOWNTO 0):="1111";
BEGIN 

	process(clk)
	begin
	if read_write='1' then
		if (addr_to_be_read=addr_00) or (addr_to_be_read=addr_04)or (addr_to_be_read=addr_08)or (addr_to_be_read=addr_12) then
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
			
			elsif(addr_to_be_read=mem_addr4) then
				src_addr0<=addr_to_be_read;	
				ctr0<='1'; --addr line
				addr0<=src_addr0;
				ld0<='1';
				d0<=mem_output4;
				output0<=d0;
				read_data<=d0;
			elsif(addr_to_be_read=mem_addr8) then
				src_addr0<=addr_to_be_read;	
				ctr0<='1'; --addr line
				addr0<=src_addr0;
				ld0<='1';
				d0<=mem_output8;
				output0<=d0;
				read_data<=d0;
			elsif(addr_to_be_read=mem_addr12) then
				src_addr0<=addr_to_be_read;	
				ctr0<='1'; --addr line
				addr0<=src_addr0;
				ld0<='1';
				d0<=mem_output12;
				output0<=d0;
				read_data<=d0;
			end if;
		elsif (addr_to_be_read=addr_01) or (addr_to_be_read=addr_05)or (addr_to_be_read=addr_09)or (addr_to_be_read=addr_13) then
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
			elsif(addr_to_be_read=mem_addr5) then
				src_addr1<=addr_to_be_read;	
				ctr1<='1'; --addr line
				addr1<=src_addr1;
				ld1<='1';
				d1<=mem_output5;
				output1<=d1;
				read_data<=d1;
			elsif(addr_to_be_read=mem_addr9) then
				src_addr1<=addr_to_be_read;	
				ctr1<='1'; --addr line
				addr1<=src_addr0;
				ld1<='1';
				d1<=mem_output9;
				output1<=d1;
				read_data<=d1;
			elsif(addr_to_be_read=mem_addr13) then
				src_addr1<=addr_to_be_read;	
				ctr1<='1'; --addr line
				addr1<=src_addr1;
				ld1<='1';
				d1<=mem_output13;
				output0<=d1;
				read_data<=d1;
			end if;
		
		elsif (addr_to_be_read=addr_02) or (addr_to_be_read=addr_06)or (addr_to_be_read=addr_10)or (addr_to_be_read=addr_14) then
			if (addr_to_be_read=addr3) then
				read_data<=output2;
			elsif(addr_to_be_read=mem_addr2) then
				src_addr2<=addr_to_be_read;	
				ctr2<='1'; --addr line
				addr2<=src_addr2;
				ld2<='1';
				d2<=mem_output2;
				output2<=d2;
				read_data<=d2;
			elsif(addr_to_be_read=mem_addr6) then
				src_addr2<=addr_to_be_read;	
				ctr2<='1'; --addr line
				addr2<=src_addr2;
				ld2<='1';
				d2<=mem_output6;
				output2<=d2;
				read_data<=d2;
			elsif(addr_to_be_read=mem_addr10) then
				src_addr2<=addr_to_be_read;	
				ctr2<='1'; --addr line
				addr2<=src_addr2;
				ld2<='1';
				d2<=mem_output10;
				output2<=d2;
				read_data<=d2;
			elsif(addr_to_be_read=mem_addr14) then
				src_addr2<=addr_to_be_read;	
				ctr2<='1'; --addr line
				addr2<=src_addr2;
				ld2<='1';
				d2<=mem_output14;
				output2<=d2;
				read_data<=d2;
			end if;
		elsif (addr_to_be_read=addr_03) or (addr_to_be_read=addr_07)or (addr_to_be_read=addr_11)or (addr_to_be_read=addr_15) then
			if (addr_to_be_read=addr3) then
				read_data<=output3;
			elsif(addr_to_be_read=mem_addr3) then
				src_addr3<=addr_to_be_read;	
				ctr3<='1'; --addr line
				addr3<=src_addr3;
				ld3<='1';
				d3<=mem_output3;
				output3<=d3;
				read_data<=d3;
			elsif(addr_to_be_read=mem_addr7) then
				src_addr3<=addr_to_be_read;	
				ctr3<='1'; --addr line
				addr3<=src_addr3;
				ld3<='1';
				d3<=mem_output5;
				output3<=d1;
				read_data<=d3;
			elsif(addr_to_be_read=mem_addr11) then
				src_addr3<=addr_to_be_read;	
				ctr3<='1'; --addr line
				addr3<=src_addr3;
				ld3<='1';
				d3<=mem_output11;
				output3<=d3;
				read_data<=d3;
			elsif(addr_to_be_read=mem_addr15) then
				src_addr3<=addr_to_be_read;	
				ctr3<='1'; --addr line
				addr3<=src_addr3;
				ld3<='1';
				d3<=mem_output15;
				output3<=d3;
				read_data<=d3;
			end if;
		end if;
	else
		if (addr_to_be_read=addr0) then
			ld0<='1';
			d0<=write_data;
			if (mem_addr0=addr0) then
				mem_ld0<='1';
				mem_d0<=write_data;
				mem_output0<=write_data;
			elsif (mem_addr4=addr0) then
				mem_ld4<='1';
				mem_d4<=write_data;
				mem_output4<=write_data;
			elsif (mem_addr8=addr0) then
				mem_ld8<='1';
				mem_d8<=write_data;
				mem_output8<=write_data;
			elsif (mem_addr12=addr0) then
				mem_ld12<='1';
				mem_d12<=write_data;
				mem_output12<=write_data;
			end if;
		elsif (addr_to_be_read=addr1) then
			ld1<='1';
			d1<=write_data;
			if (mem_addr1=addr1) then
				mem_ld1<='1';
				mem_d1<=write_data;
				mem_output1<=write_data;
			elsif (mem_addr5=addr1) then
				mem_ld3<='1';
				mem_d3<=write_data;
				mem_output3<=write_data;
			elsif (mem_addr9=addr1) then
				mem_ld9<='1';
				mem_d9<=write_data;
				mem_output9<=write_data;
			elsif (mem_addr13=addr1) then
				mem_ld13<='1';
				mem_d13<=write_data;
				mem_output13<=write_data;
			end if;
		elsif (addr_to_be_read=addr2) then
			ld2<='1';
			d2<=write_data;
			if (mem_addr2=addr2) then
				mem_ld2<='1';
				mem_d2<=write_data;
				mem_output2<=write_data;
			elsif (mem_addr6=addr2) then
				mem_ld6<='1';
				mem_d6<=write_data;
				mem_output6<=write_data;
			elsif (mem_addr10=addr2) then
				mem_ld10<='1';
				mem_d10<=write_data;
				mem_output10<=write_data;
			elsif (mem_addr14=addr2) then
				mem_ld14<='1';
				mem_d14<=write_data;
				mem_output14<=write_data;
			end if;
		elsif (addr_to_be_read=addr3) then
			ld3<='1';
			d3<=write_data;
			if (mem_addr3=addr3) then
				mem_ld3<='1';
				mem_d3<=write_data;
				mem_output3<=write_data;
			elsif (mem_addr7=addr3) then
				mem_ld7<='1';
				mem_d7<=write_data;
				mem_output7<=write_data;
			elsif (mem_addr11=addr3) then
				mem_ld11<='1';
				mem_d11<=write_data;
				mem_output11<=write_data;
			elsif (mem_addr15=addr3) then
				mem_ld15<='1';
				mem_d15<=write_data;
				mem_output15<=write_data;
			end if;
		end if;
	end if;
end process;
END main_cache;