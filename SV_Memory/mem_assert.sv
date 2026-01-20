module mem_assert(mem_intrf.assert_mp mp);

	property reset;
		@(posedge mp.clk) (mp.rst==1) |-> (mp.wr_rd==0 && mp.addr==0 && mp.wdata==0 && mp.rdata==0 && mp.valid==0 && mp.ready==0);
	endproperty
	RESET: assert property(reset);

	property preset;
		@(posedge mp.clk) (mp.rst==0) |-> (!($isunknown(mp.wr_rd)) && !($isunknown(mp.addr)) && !($isunknown(mp.wdata)) && !($isunknown(mp.rdata)) && !($isunknown(mp.valid)) && !($isunknown(mp.ready)));
	endproperty
	PRESET: assert property(preset);

	property hand_shaking;
		@(posedge mp.clk) (mp.valid==1) |=> (mp.ready==1);
	endproperty
	HAND_SHAKING: assert property(hand_shaking);

	property write_enable;
		@(posedge mp.clk) (mp.valid==1 && mp.ready==1)|->(!($isunknown(mp.wr_rd)));
	endproperty
	WRITE_ENABLE:assert property(write_enable);

	property writes;
		@(posedge mp.clk) (mp.wr_rd==1) |-> (!($isunknown(mp.addr)) && !($isunknown(mp.wdata)));
	endproperty
	WRITES:assert property(writes);
	
	property reads;
		@(posedge mp.clk) disable iff(mp.rst==1)(mp.wr_rd==0) |-> (!($isunknown(mp.addr)) && !($isunknown(mp.rdata)));
	endproperty
	READS:assert property(reads);
endmodule
