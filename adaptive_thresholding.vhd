library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adaptive_thresholding is
	port(	data_in: in std_logic_vector(7 downto 0);
			clk,clr: in std_logic;
			peak_detected: out std_logic;
			data_out: out std_logic_vector(20 downto 0)
			);
end adaptive_thresholding;

architecture Behavioral of adaptive_thresholding is
component counter
		port(	clk,clr: in std_logic;
				done: out std_logic;
				count: out std_logic_vector (9 downto 0)
				);
	end component;
	component reg_8_bit
		port(	data_in: in std_logic_vector(7 downto 0);
				clk,clr,w_en: in std_logic;
				data_out: out std_logic_vector(7 downto 0)
				);
	end component;
	component reg_16_bit
		port(	data_in: in std_logic_vector(15 downto 0);
				clk,clr,w_en: in std_logic;
				data_out: out std_logic_vector(15 downto 0)
				);
	end component;
	component signed_comparator
		port(	a,b: in  STD_LOGIC_VECTOR(7 downto 0);
				z: out  STD_LOGIC
				);
	end component;
	component signed_multiplier
		port( a,b: in std_logic_vector(7 downto 0);
				p: out std_logic_vector (15 downto 0)
				);
	end component;
	component Adder_16
		port(	A,B:in std_logic_vector(15 downto 0); 
				Cin:in std_logic; 
				Sum:out std_logic_vector(15 downto 0); 
				carry:out std_logic
				); 
	end component;
	component mux_1 
		port(	i0,i1: in std_logic;
				s: in std_logic;
				o: out std_logic
				);
	end component;
	
	component reg_20_bit
		port(	data_in: in std_logic_vector(19 downto 0);
				clk,reset,w_en: in std_logic;
				data_out: out std_logic_vector(19 downto 0)
				);
	end component;
	component reg_8_sync
		port(	data_in: in std_logic_vector(7 downto 0);
				clk,clr,w_en: in std_logic;
				data_out: out std_logic_vector(7 downto 0)
				);
	end component;
	component reg_8_comp
	port(	data_in: in std_logic_vector(7 downto 0);
			clk,clr,w_en: in std_logic;
			data_out: out std_logic_vector(7 downto 0)
			);
	end component;
	component counter_72
		port(	clk,clr: in std_logic;
				done: out std_logic;
				count: out std_logic_vector(9 downto 0)
				);
	end component;
	component counter_3600
	port(	clk,clr: in std_logic;
			count: out std_logic_vector(11 downto 0)
			);
	end component;
	component counter_50
		port(	clk,clr,add_en: in std_logic;
				count: out std_logic_vector(6 downto 0)
				);
	end component;
	
	component mux_8
		port(	i0,i1: in std_logic_vector(7 downto 0);
				s: in std_logic;
				o: out std_logic_vector(7 downto 0)
				);
	end component;
	
	
	component demux_21
		port(	s,i: in std_logic;
				o0,o1: out std_logic
				);
	end component;
	
	component RCA_8
		port(	a,b: in std_logic_vector (7 downto 0);
				s: out std_logic_vector (7 downto 0);
				c: out std_logic
				);
	end component;
	
	component twos_comp
		port(	a: in std_logic_vector (7 downto 0);
				b: out std_logic_vector (7 downto 0)
				);
	end component;
	
	component ff_8_bit
	port(	D: in std_logic_vector(7 downto 0);
			clk: in std_logic;
			Q: out std_logic_vector(7 downto 0)
			);
	end component;
	
	component ff_20_bit
	port(	D: in std_logic_vector(19 downto 0);
			clk: in std_logic;
			Q: out std_logic_vector(19 downto 0)
			);
	end component;
	
	constant divisor1: std_logic_vector (7 downto 0):= "00010101"; -- (1/3)
	constant divisor2: std_logic_vector (7 downto 0):= "00000011"; -- (1/24)
	constant divisor3: std_logic_vector (7 downto 0):= "00000010"; -- (1/30)
	constant divisor4: std_logic_vector (7 downto 0):= "00100000"; -- (1/2)
	constant divisor5: std_logic_vector (7 downto 0):= "00001000"; -- (1/8)
	constant divisor6: std_logic_vector (7 downto 0):= "00111000"; -- (0.875)
	constant divisor7: std_logic_vector (7 downto 0):= "00010000"; -- (1/4)
	
	signal gt_en_tr,gated_clk_tr,inv_clk_tr,done_tr,sel,training_complete,reset: std_logic;
	signal max_val_tr,ecg_in: std_logic_vector (7 downto 0);
	signal sample_count: std_logic_vector (9 downto 0);
	signal thr_sig_temp,div2,div3,temp_mean,add_out,noise_temp: std_logic_vector (15 downto 0);
	
	type rr_storage is array(0 to 49) of std_logic_vector(19 downto 0);
	signal rr_peak,fiducial_mark: rr_storage := (others => (others => '0'));
	signal inv_clk_fi,done_72,gt_en_fi,reset_max_fi: std_logic;
	signal count_72: std_logic_vector(9 downto 0);
	signal count_50: std_logic_vector(6 downto 0);
	signal count_3600: std_logic_vector(11 downto 0);
	signal max_val_fi: std_logic_vector(7 downto 0);
	signal to_mem_fi,to_mem_at: std_logic_vector(19 downto 0);

	signal	thr_noise,thr_sig,thr_val0,new_thr,sig_lev_in,thr_noise_neg,
				temp_thr,threshold1,threshold2,noise_lev_in,max_val_at,
				correct_max_at,correct_max_at_temp,temp_out_at: std_logic_vector(7 downto 0);
	signal 	select_peak_at,c0_at,c1_at,c2_at,en_sig_at,en_noise_at,gt_en_sig,
				gt_en_noise,peak_one,peak_two,gt_en_at,write_peak,select_max_at,peak_detected_temp: std_logic;
	signal s_peak,thr_val,temp_thr1,temp_thr2: std_logic_vector(15 downto 0);
begin
	-- Training Phase
	-- Thr_Sig
	sel <= (not done_tr) or clr;
--	mux1: mux_1 port map('0',clk,sel,gated_clk_tr);
	gated_clk_tr <= done_tr or clk;
	inv_clk_tr <= not gated_clk_tr;
	training_complete <= done_tr;
	counter1_tr: counter port map(gated_clk_tr,clr,done_tr,sample_count);
	comparator1_tr: signed_comparator port map(data_in,max_val_tr,gt_en_tr);
	store1_tr: reg_8_bit port map(data_in,gated_clk_tr,clr,gt_en_tr,max_val_tr);
	divider1_tr: signed_multiplier port map(max_val_tr,divisor1,thr_sig_temp);
	
	gt_en_sig <= gt_en_tr or en_sig_at;
	mux1_tr: mux_8 port map(thr_sig_temp(13 downto 6),new_thr,training_complete,sig_lev_in);
	store_sig_lev: reg_8_bit port map(sig_lev_in,clk,clr,gt_en_sig,thr_sig);
--	thr_sig <= thr_sig_temp(13 downto 6);
	-- Thr_Noise
	divider2_tr: signed_multiplier port map(data_in,divisor2,div2);
	add1_tr: Adder_16 port map(div2,temp_mean,'0',add_out);
	store2_tr: reg_16_bit port map(add_out,gated_clk_tr,clr,inv_clk_tr,temp_mean);
	divider3_tr: signed_multiplier port map(temp_mean(13 downto 6),divisor3,div3);
	divider4_tr: signed_multiplier port map(div3(13 downto 6),divisor4,noise_temp);
	
	gt_en_noise <= gt_en_tr or en_noise_at;
	mux2_tr: mux_8 port map(noise_temp(13 downto 6),new_thr,training_complete,noise_lev_in);
	store_noise_lev: reg_8_bit port map(noise_lev_in,clk,clr,gt_en_noise,thr_noise);
--	thr_noise <= noise_temp(13 downto 6);
	reset <= clr;
	ecg_in <= data_in;
	-- Fiducual Marks
	reset_max_fi <= not(reset or (count_72(3) and count_72(6)));
	inv_clk_fi <= not clk;
	counter72: counter_72 port map(clk,reset,done_72,count_72);
	counter50: counter_50 port map(inv_clk_fi,reset,done_72,count_50);
	counter3600: counter_3600 port map(clk,reset,count_3600);
	comparator1: signed_comparator port map(ecg_in,max_val_fi,gt_en_fi);
	store1: reg_8_sync port map(ecg_in,inv_clk_fi,reset_max_fi,gt_en_fi,max_val_fi);
	store2: reg_20_bit port map(("00000000" & count_3600),inv_clk_fi,reset,gt_en_fi,to_mem_fi);
	fiducial_mark(to_integer(unsigned(count_50))) <= max_val_fi & to_mem_fi(11 downto 0);	
	
	-- Adaptive Thresholding
-- Find Peak of input Signal
	comparator1_at: signed_comparator port map(ecg_in,max_val_at,gt_en_at);
	store1_at: reg_8_comp port map(ecg_in,inv_clk_fi,reset_max_fi,gt_en_at,max_val_at);
-- corrent max value
	comparator0_at: signed_comparator port map(max_val_at,"10000000",select_max_at);
	mux0_at: mux_8 port map("00000000",max_val_at,select_max_at,correct_max_at_temp);
	reg0_at: ff_8_bit port map(correct_max_at_temp,clk,correct_max_at);
-- peak = noise peak or signal peak?
	comparator2_at: signed_comparator port map(correct_max_at,thr_sig,select_peak_at);
-- 0.125*(peak) + (select_peak_at?((0.875)*thr_sig):((0.875)*thr_noise))
	mul1_at: signed_multiplier port map(correct_max_at,divisor5,s_peak); -- 0.125*peak
	mux1_at: mux_8 port map(thr_noise,thr_sig,select_peak_at,thr_val0); -- thr_sig or thr_noise?
	mul2_at: signed_multiplier port map(thr_val0,divisor6,thr_val); -- 0.875*thr
	demux1_at: demux_21 port map(select_peak_at,done_72,en_noise_at,en_sig_at); -- write to sig_lev or noise_lev
	adder1_at: RCA_8 port map(s_peak(13 downto 6),thr_val(13 downto 6),new_thr,c0_at); -- new threshold value to be written
-- Store if R peak.
	twos_comp_at: twos_comp port map(thr_noise,thr_noise_neg); -- (-noise peak)
	adder2_at: RCA_8 port map(thr_sig,thr_noise_neg,temp_thr,c1_at); -- (sig_lev - sig_noise)
	mul3_at: signed_multiplier port map(temp_thr,divisor7,temp_thr1); -- 0.25*(sig_lev - sig_noise)
	adder3_at: RCA_8 port map(thr_noise,temp_thr1(13 downto 6),threshold1,c2_at); -- threshold1 = sig_noise + 0.25*(sig_lev - sig_noise)
	mul4_at: signed_multiplier port map(threshold1,divisor4,temp_thr2); -- threshold2 = 0.5*threshold1
	threshold2 <= temp_thr2(13 downto 6);
	
	comparator3_at: signed_comparator port map(correct_max_at,threshold1,peak_one);
	comparator4_at: signed_comparator port map(correct_max_at,threshold2,peak_two);
	write_peak <= select_peak_at and (peak_one or peak_two);
--	reg1_at: ff_20_bit port map((correct_max_at & count_3600),gt_en_at,to_mem_at);
--	store2_at: reg_20_bit port map((correct_max_at & count_3600),inv_clk_fi,reset,write_peak,to_mem_at);
	store2_at: reg_20_bit port map((correct_max_at & count_3600),inv_clk_fi,reset,gt_en_at,to_mem_at);
	rr_peak(to_integer(unsigned(count_50))) <= correct_max_at & to_mem_at(11 downto 0);
	data_out(19 downto 0) <= to_mem_at;
--	reg1_at: ff_20_bit port map(to_mem_at,clk,data_out(19 downto 0));
	data_out(20) <= done_72;
	comparator5_at: signed_comparator port map(to_mem_at(19 downto 12),"00000000",peak_detected_temp);
	peak_detected <= peak_detected_temp and done_72;
--	data_out <= correct_max_at & to_mem_at(11 downto 0) & done_72;
end Behavioral;