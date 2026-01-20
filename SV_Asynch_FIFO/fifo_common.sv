`define DEPTH  16
`define DATA_WIDTH  8
`define PTR_WIDTH  $clog2(`DEPTH)
class fifo_common;
	static string test_name;
	static mailbox wr_gen2bfm = new();
	static mailbox wr_mon2cov = new();
	static mailbox wr_mon2sbd = new();
	static mailbox rd_gen2bfm = new();
	static mailbox rd_mon2cov = new();
	static mailbox rd_mon2sbd = new();
	static int gen_count,bfm_count;
	static int matchings,mismatchings;
endclass
