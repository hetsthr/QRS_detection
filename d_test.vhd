library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dffst is

Port ( d,clk : in  STD_LOGIC;

q,qb : inout STD_LOGIC);

end dffst;

architecture dffstar of dffst is

component nand21

port(a,b: in STD_LOGIC;

y:out STD_LOGIC);

end component;

signal d1,s1,r1:STD_LOGIC;

begin

n0: nand21 port map(d,clk,s1);

n1: nand21 port map(d,d,d1);

n2: nand21 port map(d1,clk,r1);

n3: nand21 port map(s1,qb,q);

n4: nand21 port map(r1,q,qb);

end dffstar;

-- nand gate

library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nand21 is

Port ( a,b : in  STD_LOGIC;

y : out  STD_LOGIC);

end nand21;

architecture Behavioral of nand21 is

begin

y <= a nand b;

end Behavioral;