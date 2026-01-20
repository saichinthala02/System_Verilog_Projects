class mem_cov;
	mem_tx tx;
	covergroup Mem_cb;
		option.per_instance=1;
		WR_RD:coverpoint tx.wr_rd{
			option.comment="mem_wr_rd";
			option.weight=5;
			bins READS = {1'b0};
			bins WRITES = {1'b1};

		}
		ADDRESS:coverpoint tx.addr{
			option.comment="mem_address";
			option.weight=2;
			bins ADDR0 =  {4'b0000};
			bins ADDR1 =  {4'b0001};
			bins ADDR2 =  {4'b0010};
			bins ADDR3 =  {4'b0011};
			bins ADDR4 =  {4'b0100};
			bins ADDR5 =  {4'b0101};
			bins ADDR6 =  {4'b0110};
			bins ADDR7 =  {4'b0111};
			bins ADDR8 =  {4'b1000};
			bins ADDR9 =  {4'b1001};
			bins ADDR10 = {4'b1010};
			bins ADDR11 = {4'b1011};
			bins ADDR12 = {4'b1100};
			bins ADDR13 = {4'b1101};
			bins ADDR14 = {4'b1110};
			bins ADDR15 = {4'b1111};
			
			//bins ADDR[]={[0:127]} with (item%9==0);
			// option.auto_bin_max=16;
		}
		cross WR_RD,ADDRESS{
			option.comment="mem_cross_coverage";
			option.weight=3;
			bins SAMPLE = binsof(WR_RD.READS);
		}
	endgroup

	function new();
		Mem_cb=new();
	endfunction
	task run();
		forever begin
			mem_common::mon2cov.get(tx);
			Mem_cb.sample();
			//tx.print("mem_cov");
		end
	endtask
endclass
