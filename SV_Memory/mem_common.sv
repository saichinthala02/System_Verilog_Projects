`define DEPTH 16
`define WIDTH 8
`define	ADDR_WIDTH $clog2(`DEPTH)
class mem_common;
	static string test_name;
	static int N;
	static mailbox gen2bfm = new();
	static mailbox mon2cov = new();
	static mailbox mon2sbd = new();
	static int matching;
	static int mismatching;
	static int count_gen;
	static int count_bfm;
endclass
