----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:59:35 05/19/2020 
-- Design Name: 
-- Module Name:    finalcomparator16bit - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity finalcomparator16bit is
Port (a: in  STD_LOGIC_VECTOR(15 downto 0);
b : in  STD_LOGIC_VECTOR(15 downto 0);
c: out  STD_LOGIC);
end finalcomparator16bit;

architecture Behavioral of finalcomparator16bit is
component xnormodule is
port(in1,in2:in std_logic;
out1:out std_logic);
end component;
component notfile is
port(in1:in std_logic;
out1:out std_logic);
end component;
component andd4 is
port(in1,in2,in3,in4:in std_logic;
out1:out std_logic);
end component;
component andmodule is
port(in1,in2:in std_logic;
out1:out std_logic);
end component;
component orr4 is
port(in1,in2,in3,in4:in std_logic;
out1:out std_logic);
end component;

signal w,x,y,z: STD_LOGIC_VECTOR(15 downto 0);
signal temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12,temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20,temp21,temp22,temp23,temp24,temp25,temp26,temp27,temp28,temp29,temp30,temp31,temp32,temp33,temp34,temp35,temp36,temp37,temp38:std_logic;
begin
first:xnormodule port map(in1=>a(0),in2=>b(0),out1=>x(0));
second:xnormodule port map(in1=>a(1),in2=>b(1),out1=>x(1));
third:xnormodule port map(in1=>a(2),in2=>b(2),out1=>x(2));
fourth:xnormodule port map(in1=>a(3),in2=>b(3),out1=>x(3));
fifth:xnormodule port map(in1=>a(4),in2=>b(4),out1=>x(4));
sixth:xnormodule port map(in1=>a(5),in2=>b(5),out1=>x(5));
seventh:xnormodule port map(in1=>a(6),in2=>b(6),out1=>x(6));
eigth:xnormodule port map(in1=>a(7),in2=>b(7),out1=>x(7));
ninth:xnormodule port map(in1=>a(8),in2=>b(8),out1=>x(8));
tenth:xnormodule port map(in1=>a(9),in2=>b(9),out1=>x(9));
eleventh:xnormodule port map(in1=>a(10),in2=>b(10),out1=>x(10));
twelvth:xnormodule port map(in1=>a(11),in2=>b(11),out1=>x(11));
thiteenth:xnormodule port map(in1=>a(12),in2=>b(12),out1=>x(12));
fourteeth:xnormodule port map(in1=>a(13),in2=>b(13),out1=>x(13));
fifteenth:xnormodule port map(in1=>a(14),in2=>b(14),out1=>x(14));
sixteenth:xnormodule port map(in1=>a(15),in2=>b(15),out1=>x(15));
ag:notfile port map(in1=>b(0),out1=>y(0));
bb:notfile port map(in1=>b(1),out1=>y(1));
cg:notfile port map(in1=>b(2),out1=>y(2));
d:notfile port map(in1=>b(3),out1=>y(3));
e:notfile port map(in1=>b(4),out1=>y(4));
f:notfile port map(in1=>b(5),out1=>y(5));
g:notfile port map(in1=>b(6),out1=>y(6));
h:notfile port map(in1=>b(7),out1=>y(7));
i:notfile port map(in1=>b(8),out1=>y(8));
j:notfile port map(in1=>b(9),out1=>y(9));
k:notfile port map(in1=>b(10),out1=>y(10));
l:notfile port map(in1=>b(11),out1=>y(11));
m:notfile port map(in1=>b(12),out1=>y(12));
n:notfile port map(in1=>b(13),out1=>y(13));
o:notfile port map(in1=>b(14),out1=>y(14));
p:notfile port map(in1=>b(15),out1=>y(15));

aba:andmodule port map(in1=>a(0),in2=>y(0),out1=>z(0));
bbb:andmodule port map(in1=>a(1),in2=>y(1),out1=>z(1));
cbc:andmodule port map(in1=>a(2),in2=>y(2),out1=>z(2));
dd:andmodule port map(in1=>a(3),in2=>y(3),out1=>z(3));
ee:andmodule port map(in1=>a(4),in2=>y(4),out1=>z(4));
ff:andmodule port map(in1=>a(5),in2=>y(5),out1=>z(5));
gg:andmodule port map(in1=>a(6),in2=>y(6),out1=>z(6));
hh:andmodule port map(in1=>a(7),in2=>y(7),out1=>z(7));
ggg:andmodule port map(in1=>a(8),in2=>y(8),out1=>z(8));
hhh:andmodule port map(in1=>a(9),in2=>y(9),out1=>z(9));
ii:andmodule port map(in1=>a(10),in2=>y(10),out1=>z(10));
jj:andmodule port map(in1=>a(11),in2=>y(11),out1=>z(11));
kk:andmodule port map(in1=>a(12),in2=>y(12),out1=>z(12));
ll:andmodule port map(in1=>a(13),in2=>y(13),out1=>z(13));
mm:andmodule port map(in1=>a(14),in2=>y(14),out1=>z(14));
nn:andmodule port map(in1=>a(15),in2=>y(15),out1=>z(15));

aaa:andmodule port map(in1=>x(15),in2=>z(15),out1=>w(0));

aab:andd4 port map(in1=>x(15),in2=>z(14),in3=>x(14),in4=>'1',out1=>w(1));

aac:andd4 port map(in1=>x(15),in2=>z(13),in3=>x(14),in4=>x(13),out1=>w(2));

aad:andd4 port map(in1=>x(15),in2=>z(12),in3=>x(14),in4=>x(13),out1=>temp1);
aae:andmodule port map(in1=>x(12),in2=>temp1,out1=>w(3));

aaf:andd4 port map(in1=>x(15),in2=>z(11),in3=>x(14),in4=>x(13),out1=>temp2);
aag:andd4 port map(in1=>temp2,in2=>x(11),in3=>x(12),in4=>'1',out1=>w(4));

aah:andd4 port map(in1=>x(15),in2=>z(10),in3=>x(14),in4=>x(13),out1=>temp3);
aai:andd4 port map(in1=>x(12),in2=>x(11),in3=>temp3,in4=>x(10),out1=>w(5));

aaj:andd4 port map(in1=>x(15),in2=>z(9),in3=>x(14),in4=>x(13),out1=>temp4);
aak:andd4 port map(in1=>x(12),in2=>z(11),in3=>x(10),in4=>x(9),out1=>temp35);
ttt:andmodule port map(in1=>temp4,in2=>temp35,out1=>w(6));

aal:andd4 port map(in1=>x(15),in2=>z(8),in3=>x(14),in4=>x(13),out1=>temp5);
aam:andd4 port map(in1=>x(12),in2=>x(11),in3=>x(10),in4=>x(9),out1=>temp6);
aabn:andd4 port map(in1=>temp5,in2=>temp6,in3=>x(8),in4=>'1',out1=>w(7));

aao:andd4 port map(in1=>x(15),in2=>z(7),in3=>x(14),in4=>x(13),out1=>temp7);
aap:andd4 port map(in1=>x(12),in2=>x(11),in3=>x(10),in4=>x(9),out1=>temp8);
aaq:andd4 port map(in1=>temp7,in2=>temp8,in3=>x(8),in4=>x(7),out1=>w(8));

aar:andd4 port map(in1=>x(15),in2=>z(6),in3=>x(14),in4=>x(13),out1=>temp9);
aas:andd4 port map(in1=>x(12),in2=>x(11),in3=>x(10),in4=>x(9),out1=>temp10);
aat:andd4 port map(in1=>temp9,in2=>temp10,in3=>x(8),in4=>x(7),out1=>temp36);
tott:andmodule port map(in1=>temp36,in2=>x(6),out1=>w(9));

aau:andd4 port map(in1=>x(15),in2=>z(5),in3=>x(14),in4=>x(13),out1=>temp11);
aav:andd4 port map(in1=>x(12),in2=>x(11),in3=>x(10),in4=>x(9),out1=>temp12);
aaw:andd4 port map(in1=>temp11,in2=>temp12,in3=>x(8),in4=>x(7),out1=>temp13);
aax:andd4 port map(in1=>temp13,in2=>x(6),in3=>x(5),in4=>'1',out1=>w(10));

aay:andd4 port map(in1=>x(15),in2=>z(4),in3=>x(14),in4=>x(13),out1=>temp14);
aaz:andd4 port map(in1=>x(12),in2=>x(11),in3=>x(10),in4=>x(9),out1=>temp15);
aagh:andd4 port map(in1=>temp14,in2=>temp15,in3=>x(8),in4=>x(7),out1=>temp16);
aadn:andd4 port map(in1=>temp16,in2=>x(6),in3=>x(4),in4=>x(5),out1=>w(11));

a0ad:andd4 port map(in1=>x(15),in2=>z(3),in3=>x(14),in4=>x(13),out1=>temp17);
aa8d:andd4 port map(in1=>x(12),in2=>x(11),in3=>x(10),in4=>x(9),out1=>temp18);
aa5d:andd4 port map(in1=>temp17,in2=>temp18,in3=>x(8),in4=>x(7),out1=>temp19);
apad:andd4 port map(in1=>temp19,in2=>x(6),in3=>x(4),in4=>x(5),out1=>temp37);
tot:andmodule port map(in1=>temp37,in2=>x(3),out1=>w(12));

a2ad:andd4 port map(in1=>x(15),in2=>z(2),in3=>x(14),in4=>x(13),out1=>temp20);
a5ad:andd4 port map(in1=>x(12),in2=>x(11),in3=>x(10),in4=>x(9),out1=>temp21);
aa78d:andd4 port map(in1=>temp20,in2=>temp21,in3=>x(8),in4=>x(7),out1=>temp22);
aa9d:andd4 port map(in1=>temp22,in2=>x(6),in3=>x(4),in4=>x(5),out1=>temp23);
a6ad:andd4 port map(in1=>temp23,in2=>x(2),in3=>x(3),in4=>'1',out1=>w(13));

arad:andd4 port map(in1=>x(15),in2=>z(1),in3=>x(14),in4=>x(13),out1=>temp24);
aabd:andd4 port map(in1=>x(12),in2=>x(11),in3=>x(10),in4=>x(9),out1=>temp25);
baacd:andd4 port map(in1=>temp24,in2=>temp25,in3=>x(8),in4=>x(7),out1=>temp26);
uaaxd:andd4 port map(in1=>temp26,in2=>x(6),in3=>x(4),in4=>x(5),out1=>temp27);
abad:andd4 port map(in1=>temp27,in2=>x(2),in3=>x(3),in4=>x(1),out1=>w(14));

ab1ad:andd4 port map(in1=>x(15),in2=>z(0),in3=>x(14),in4=>x(13),out1=>temp25);
aadd:andd4 port map(in1=>x(12),in2=>x(11),in3=>x(10),in4=>x(9),out1=>temp26);
aajdd:andd4 port map(in1=>temp25,in2=>temp26,in3=>x(8),in4=>x(7),out1=>temp27);
asad:andd4 port map(in1=>temp27,in2=>x(6),in3=>x(4),in4=>x(5),out1=>temp28);
aawd:andd4 port map(in1=>temp28,in2=>x(2),in3=>x(3),in4=>x(1),out1=>temp29);
aaes:andmodule port map(in1=>temp29,in2=>x(0),out1=>w(15));

abc:orr4 port map(in1=>w(0),in2=>w(1),in3=>w(2),in4=>w(3),out1=>temp30);
ebgc:orr4 port map(in1=>w(4),in2=>w(5),in3=>w(6),in4=>temp30,out1=>temp31);
bmc:orr4 port map(in1=>w(7),in2=>w(8),in3=>w(9),in4=>temp31,out1=>temp32);
bcn:orr4 port map(in1=>w(10),in2=>w(11),in3=>w(12),in4=>temp32,out1=>temp34);
bcv:orr4 port map(in1=>w(13),in2=>w(14),in3=>w(15),in4=>temp34,out1=>temp38);
bco:orr4 port map(in1=>z(15),in2=>'0',in3=>'0',in4=>temp38,out1=>c);

end Behavioral;

