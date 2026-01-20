interface mem_intrf (input reg clk,rst);
	bit wr_rd,valid,ready;
	bit [`ADDR_WIDTH-1:0]addr;
	bit [`WIDTH-1:0]wdata,rdata;

	clocking bfm_cb@(posedge clk);
		default input#0 output#1;
		input rdata,ready;
		output wr_rd,addr,wdata,valid;
	endclocking

	clocking mon_cb@(posedge clk);
		default input#1;
		input wr_rd,addr,wdata,valid,rdata,ready;
		//input #0 rdata,ready;
	endclocking

	modport design_mp(
		input clk,rst,wr_rd,addr,wdata,valid,
		output ready,rdata);
	
	modport bfm_mp(clocking bfm_cb);
	
	modport mon_mp(clocking mon_cb);

	modport assert_mp(input clk,rst,wr_rd,addr,wdata,rdata,valid,ready);
	

endinterface
