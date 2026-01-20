class mem_bfm;
	mem_tx tx;
	virtual mem_intrf vif;

	task run();
		vif=top.pif;
		forever begin
			mem_common::gen2bfm.get(tx);
			drive_tx(tx);
			mem_common::count_bfm++;
			//tx.print("mem_bfm");
		end
	endtask

	task drive_tx(input mem_tx tx);
		@(vif.bfm_mp.bfm_cb);
		vif.bfm_mp.bfm_cb.wr_rd                  <= tx.wr_rd;
		vif.bfm_mp.bfm_cb.addr                   <= tx.addr;
		if(tx.wr_rd==1) vif.bfm_mp.bfm_cb.wdata  <= tx.wdata;
		else vif.bfm_mp.bfm_cb.wdata             <= 0;
		vif.bfm_mp.bfm_cb.valid                  <= 1;
		wait(vif.bfm_mp.bfm_cb.ready==1);
		if(tx.wr_rd==0)begin
			@(vif.bfm_mp.bfm_cb);
			tx.rdata = vif.bfm_mp.bfm_cb.rdata;
		end
		@(vif.bfm_mp.bfm_cb);
		vif.bfm_mp.bfm_cb.valid    <= 0;
		vif.bfm_mp.bfm_cb.wr_rd    <= 0;
		vif.bfm_mp.bfm_cb.addr     <= 0;
		vif.bfm_mp.bfm_cb.wdata    <= 0;
	endtask
endclass
