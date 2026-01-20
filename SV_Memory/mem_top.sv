module top;
	reg clk,rst;
	mem_env env;
	mem_intrf pif(clk,rst);
	
	memory dut(pif.design_mp);

	mem_assert uut(pif.assert_mp);		   

	always #5 clk=~clk;
	initial begin
		clk=0;
		rst=1;
		repeat(2)@(posedge clk);
		rst=0;
		assert($value$plusargs("test_name=%0s",mem_common::test_name));
		assert($value$plusargs("N=%0d",mem_common::N));
		env=new();
		env.run();
	end
	initial begin
		#20;
		wait(mem_common::count_gen==mem_common::count_bfm);
		#20;
		if(mem_common::matching!=0 && mem_common::mismatching==0)begin
			$display("=====================================");
			$display("Test Passed ");
			$display("Matchings:- %0d",mem_common::matching);
			$display("Mis-Matchings:- %0d",mem_common::mismatching);
			$display("=====================================");
		end
		else begin
			$display("=====================================");
			$display("Test Passed");
			$display("Matchings:- %0d",mem_common::matching);
			$display("Mis-Matchings:- %0d",mem_common::mismatching);
			$display("=====================================");
		end
		$finish;
	end
endmodule
