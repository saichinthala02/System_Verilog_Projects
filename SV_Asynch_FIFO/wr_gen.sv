class wr_gen;
	wr_tx tx;
	task run();
		case(fifo_common::test_name)
			"FULL":begin
				writes(`DEPTH);
			end
			"EMPTY":begin
				fifo_common::gen_count=`DEPTH;
				writes(`DEPTH);
			end
			"OVERFLOW":begin
				writes(`DEPTH+5);
			end
			"UNDERFLOW":begin
				fifo_common::gen_count=`DEPTH;
				writes(`DEPTH);
			end
			"CONCURRENT":begin

			end
			default:begin
				$display("No Testcase is Selected");
			end
		endcase
	endtask
	task writes(input int n);
		repeat(n)begin
			tx=new();
			assert(tx.randomize());
			fifo_common::wr_gen2bfm.put(tx);
			tx.print("wr_gen");
		end
	endtask
endclass
