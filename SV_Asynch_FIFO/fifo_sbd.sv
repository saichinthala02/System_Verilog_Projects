class fifo_sbd;
	wr_tx w_t;
	rd_tx r_t;
	int que[$];
	int data;

	/*task run();
	forever begin
		fifo_common::wr_mon2sbd.get(w_t);
			w_t.print("wr_sbd_print");

			fifo_common::rd_mon2sbd.get(r_t);
			r_t.print("rd_sbd_print");

	end
	endtask*/
	task run1();
		forever begin
			fifo_common::wr_mon2sbd.get(w_t);
			w_t.print("wr_sbd_print");
			if(w_t.wr_en==1) que.push_back(w_t.wdata);
			//fifo_common::rd_mon2sbd.get(r_t);
			//r_t.print("rd_sbd_print");
		end
	endtask
	task run2();
		forever begin
			fifo_common::rd_mon2sbd.get(r_t);
			r_t.print("rd_sbd_print");
			if(r_t.rd_en==1)begin
				data=que.pop_front();
				if(data==r_t.rdata) fifo_common::matchings++;
				else fifo_common::mismatchings++;
			end
			//fifo_common::rd_mon2sbd.get(r_t);
			//r_t.print("rd_sbd_print");
		end
	endtask
endclass
