class mem_gen;
	mem_tx tx,temp;
	mem_tx que[$];
	task run();
		case(mem_common::test_name)
			"1WR":begin
				mem_common::count_gen=1;
				tx=new();
				assert(tx.randomize() with {tx.wr_rd==1;});
				mem_common::gen2bfm.put(tx);				
				//tx.print("mem_gen_wr_tx");
			end
			"5WR":begin
				mem_common::count_gen=5;
				tx=new();
				repeat(5)begin
					assert(tx.randomize() with {tx.wr_rd==1;});
					temp=new tx;
					mem_common::gen2bfm.put(temp);	
					//tx.print("mem_gen_wr_tx");
				end
			end
			"1WR_1RD":begin
				mem_common::count_gen=2;
				//--> Generating Write Txn
				tx=new();
				assert(tx.randomize() with {tx.wr_rd==1;});
				temp = new tx;
				mem_common::gen2bfm.put(temp);	
				//tx.print("mem_gen_wr_tx");

				//--> Generating Read Txn
				tx=new();
				assert(tx.randomize() with {tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
				mem_common::gen2bfm.put(tx);	
				tx.print("mem_gen_rd_tx");

			end
			"5WR_5RD":begin
				mem_common::count_gen=10;
				tx=new();
				repeat(5)begin
					assert(tx.randomize() with {tx.wr_rd==1;});
					temp=new tx;
					que.push_back(temp);
					mem_common::gen2bfm.put(temp);	
					//tx.print("mem_gen_wr_tx");
				end

				repeat(5)begin
					tx=new();
					temp=que.pop_front();
					assert(tx.randomize() with {tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
					mem_common::gen2bfm.put(tx);	
					//tx.print("mem_gen_rd_tx");
				end
			end
			"NWR_NRD":begin
				mem_common::count_gen=2*mem_common::N;
				tx=new();
				repeat(mem_common::N)begin
					assert(tx.randomize() with {tx.wr_rd==1;});
					temp=new tx;
					que.push_back(temp);
					mem_common::gen2bfm.put(temp);	
					//tx.print("mem_gen_wr_tx");
				end

				repeat(mem_common::N)begin
					tx=new();
					temp=que.pop_front();
					assert(tx.randomize() with {tx.wr_rd==0;tx.addr==temp.addr;tx.wdata==0;});
					mem_common::gen2bfm.put(tx);	
					//tx.print("mem_gen_rd_tx");
				end
			end
			default : $display("NO TEST PASSED");
		endcase
	endtask
endclass
