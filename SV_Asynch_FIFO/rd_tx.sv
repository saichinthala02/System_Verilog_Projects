class rd_tx;
	rand bit rd_en;
		 bit[`DATA_WIDTH-1:0]rdata;
		 bit empty;
		 bit underflow;
	
	function void print(input string str="rd_tx");
		$display("[%0t]------> %0s <------",$time,str);
		$display("rd_en=%b",rd_en);
		$display("rdata=%0d",rdata);
		$display("empty=%b",empty);
		$display("underflow=%b",underflow);
	endfunction

	constraint r_c{
		rd_en == 1'b1;
	}
endclass
