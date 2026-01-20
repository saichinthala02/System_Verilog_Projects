class rd_gen;
	rd_tx tx;
	task run();
		case(fifo_common::test_name)
			"FULL":begin
				
			end
			"EMPTY":begin
				wait(fifo_common::gen_count==fifo_common::bfm_count);
				reads(`DEPTH);
			end
			"OVERFLOW":begin

			end
			"UNDERFLOW":begin
				wait(fifo_common::gen_count==fifo_common::bfm_count);
				reads(`DEPTH+2);
			end
			"CONCURRENT":begin

			end
			default:begin
				$display("No Testcase is Selected");
			end
		endcase
	endtask
	task reads(input int n);
		repeat(n)begin
			tx=new();
			assert(tx.randomize());
			fifo_common::rd_gen2bfm.put(tx);
			tx.print("rd_gen");
		end
	endtask
endclass
