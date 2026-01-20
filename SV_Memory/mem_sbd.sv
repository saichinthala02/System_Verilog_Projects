class mem_sbd;
	mem_tx tx;
	int asso[int];
	task run();
		forever begin
			mem_common::mon2sbd.get(tx);
			tx.print("mem_sbd");
			if(tx.wr_rd==1) asso[tx.addr]=tx.wdata;
			else begin
				if(tx.rdata==asso[tx.addr]) mem_common::matching++;
				else mem_common::mismatching++;
			end
		end
	endtask
endclass
