//module memory(clk,rst,wr_rd,addr,wdata,rdata,valid,ready);
//	input clk,rst,wr_rd,valid;
//	input [`ADDR_WIDTH-1:0]addr;
//	input [`WIDTH-1:0]wdata;
//	output reg [`WIDTH-1:0]rdata;
//	output reg ready;
//
//	reg [`WIDTH-1:0]mem[`DEPTH-1:0];
//	integer i;
//
//	always@(posedge clk)begin
//		if(rst==1)begin
//			rdata = 0;
//			ready = 0;
//			for(i=0;i<`DEPTH;i=i+1) mem[i]=0;
//		end 
//		else begin
//			if(valid==1)begin
//				ready=1;
//				if(wr_rd==1) mem[addr]=wdata;
//				else rdata=mem[addr];
//			end
//			else ready = 0;
//		end
//	end
//endmodule 

module memory(mem_intrf.design_mp mp);
	
	reg [`WIDTH-1:0]mem[`DEPTH-1:0];
	integer i;

	always@(posedge mp.clk)begin
		if(mp.rst==1)begin
			mp.rdata = 0;
			mp.ready = 0;
			for(i=0;i<`DEPTH;i=i+1) mem[i]=0;
		end 
		else begin
			if(mp.valid==1)begin
				mp.ready=1;
				if(mp.wr_rd==1) mem[mp.addr]=mp.wdata;
				else mp.rdata=mem[mp.addr];
			end
			else mp.ready = 0;
		end
	end
endmodule 
