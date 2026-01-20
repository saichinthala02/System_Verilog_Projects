module fifo_assert(wr_clk,rd_clk,rst,wr_en,rd_en,wdata,rdata,full,empty,overflow,underflow);
	input wr_clk,rd_clk,rst,wr_en,rd_en;
	input [`DATA_WIDTH-1:0]wdata,rdata;
	input full,empty,overflow,underflow;

	property reset;
		@(posedge wr_clk) (rst==1) |-> (rdata==0 && full==0 && empty==1 && overflow==0 && underflow==0);
	endproperty
	RESET: assert property(reset);

	property write_en;
		 @(posedge wr_clk) (rst==0 && wr_en==1) |-> (!$isunknown(wdata));
	endproperty
	WDATA: assert property(write_en);

	property read_en;
		 @(posedge rd_clk) (rst==0 && rd_en==1) |-> (!$isunknown(rdata));
	endproperty
	RDATA: assert property(read_en);

	property full_overflow;
		@(posedge wr_clk) (wr_en==1 && full==1) |=> (overflow==1);
	endproperty
	OVERFLOW: assert property(full_overflow);

	property empty_underflow;
		@(posedge rd_clk) (rd_en==1 && empty==1) |=> (underflow==1);
	endproperty
	UNDERFLOW: assert property(empty_underflow);

	property full_empty;
		@(posedge wr_clk) full |-> !empty;
	endproperty
	FULL_EMPTY: assert property(full_empty);

endmodule
