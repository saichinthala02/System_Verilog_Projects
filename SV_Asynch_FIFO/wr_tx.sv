class wr_tx;
	rand bit wr_en;
	rand bit[`DATA_WIDTH-1:0]wdata;
		 bit full;
		 bit overflow;
	
	function void print(input string str="wr_tx");
		$display("[%0t]------> %0s <------",$time,str);
		$display("wr_en=%b",wr_en);
		$display("wdata=%0d",wdata);
		$display("full=%b",full);
		$display("overflow=%b",overflow);
	endfunction

	constraint w_c{
		wr_en == 1'b1;
	}
endclass
