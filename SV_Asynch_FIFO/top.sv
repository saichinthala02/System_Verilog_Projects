module top;
	reg wr_clk,rd_clk,rst;

	fifo_intrf pif(wr_clk,rd_clk,rst);
	asynch_fifo dut(.wr_clk(pif.wr_clk),
					.rd_clk(pif.rd_clk),
					.rst   (pif.rst),
					.wr_en (pif.wr_en),
					.rd_en (pif.rd_en),
					.wdata (pif.wdata),
					.rdata (pif.rdata),
					.full  (pif.full),
					.empty (pif.empty),
					.overflow(pif.overflow),
					.underflow(pif.underflow));

	fifo_assert uut(.wr_clk(pif.wr_clk),
					.rd_clk(pif.rd_clk),
					.rst   (pif.rst),
					.wr_en (pif.wr_en),
					.rd_en (pif.rd_en),
					.wdata (pif.wdata),
					.rdata (pif.rdata),
					.full  (pif.full),
					.empty (pif.empty),
					.overflow(pif.overflow),
					.underflow(pif.underflow));
				

	fifo_env env;
	always #5 wr_clk=~wr_clk;
	always #7 rd_clk=~rd_clk;
	initial begin
		wr_clk = 0;
		rd_clk = 0;
		rst=1;
		repeat(2)@(posedge wr_clk);
		rst=0;
		$value$plusargs("test_name=%0s",fifo_common::test_name);
		env = new();
		env.run();
	end
	initial begin
		#1000;
		if(fifo_common::matchings!=0 && fifo_common::mismatchings==0)begin
			$display("-----------------------------");
			$display("Test_Pass");
			$display("Matchings:- %0d",fifo_common::matchings);
			$display("Mis-Matchings:- %0d",fifo_common::mismatchings);
			$display("-----------------------------");
		end	
		else begin
			$display("-----------------------------");
			$display("Test_Fail");
			$display("Matchings:- %0d",fifo_common::matchings);
			$display("Mis-Matchings:- %0d",fifo_common::mismatchings);
			$display("-----------------------------");
		end
		$finish;
	end
endmodule
