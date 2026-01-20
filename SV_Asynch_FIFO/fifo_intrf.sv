interface fifo_intrf(input reg wr_clk,rd_clk,rst);
	bit wr_en,rd_en;
	bit[`DATA_WIDTH-1:0]wdata,rdata;
	bit full,empty,overflow,underflow;

	clocking wr_bfm_cb @(posedge wr_clk);
		default input#0 output #1;
		output wr_en,wdata;
		input#1 overflow;
		input full;
	endclocking

	clocking rd_bfm_cb @(posedge rd_clk);
		default input#0 output #1;
		output rd_en;
		input rdata,empty;
		input#1 underflow;
	endclocking

	clocking wr_mon_cb @(posedge wr_clk);
		default input#1;
		input wr_en,wdata,full;
		input#0 overflow; 
	endclocking
	
	clocking rd_mon_cb @(posedge rd_clk);
		default input#1;
		input rd_en,rdata,empty;
		input#0 underflow;
	endclocking
endinterface
