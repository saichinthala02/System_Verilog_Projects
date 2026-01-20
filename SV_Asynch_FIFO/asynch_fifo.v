//--> Implementation of Asynchronous FIFO.
module asynch_fifo(wr_clk,rd_clk,rst,wr_en,rd_en,wdata,rdata,full,empty,overflow,underflow);
	
	input wr_clk,rd_clk,rst,wr_en,rd_en;
	input [`DATA_WIDTH-1:0] wdata;
	output reg [`DATA_WIDTH-1:0] rdata;
	output reg full,empty,overflow,underflow;

	reg [`DATA_WIDTH-1:0] fifo[`DEPTH-1:0];
	reg [`PTR_WIDTH-1:0] wr_ptr,rd_ptr,wr_ptr_rd_clk,rd_ptr_wr_clk;
	wire [`PTR_WIDTH-1:0] wr_gray_ptr,rd_gray_ptr;
	reg wr_toggle,rd_toggle,wr_toggle_rd_clk,rd_toggle_wr_clk;
	integer i;
	
	//--> Write always Block
	always@(posedge wr_clk)begin
		if(rst) begin
			rdata          <= 0;
			full           <= 0;
			empty          <= 1;
			overflow       <= 0;
			underflow      <= 0;
			wr_ptr           <= 0;
			rd_ptr           <= 0;
			wr_ptr_rd_clk    <= 0;
			rd_ptr_wr_clk    <= 0;
			wr_toggle        <= 0;
			rd_toggle        <= 0;
			wr_toggle_rd_clk <= 0;
			rd_toggle_wr_clk <= 0;
			//wr_gray_ptr    <= 0;
			//rd_gray_ptr    <= 0;

			for(i=0;i<`DEPTH;i=i+1) begin
				fifo[i]  <= 0;
			end
		end
		else begin
			overflow=0;
			if(wr_en==1) begin
				if(full==1) overflow=1;
				else begin
					fifo[wr_ptr]=wdata;
					if(wr_ptr==`DEPTH-1) begin
						wr_toggle=~wr_toggle;
						wr_ptr=0;
					end
					else wr_ptr=wr_ptr+1;
				end
			end
		end
	end
	//--> Read always block
	always@(posedge rd_clk)begin
		if(rst==0)begin
			underflow=0;
			if(rd_en==1) begin
				if(empty==1) underflow=1;
				else begin
					rdata=fifo[rd_ptr];
					if(rd_ptr==`DEPTH-1) begin
						rd_toggle=~rd_toggle;
						rd_ptr=0;
					end
					else rd_ptr=rd_ptr+1;
				end
			end
		end
	end

	//--> Synchronization
	always@(posedge rd_clk) begin
		wr_ptr_rd_clk =  wr_gray_ptr;
		wr_toggle_rd_clk = wr_toggle;
	end
	always@(posedge wr_clk) begin
		rd_ptr_wr_clk =  rd_gray_ptr;
		rd_toggle_wr_clk = rd_toggle;
	end

	always@(*)begin
		full=0;
		empty=0;
		if(wr_gray_ptr==rd_ptr_wr_clk && wr_toggle!=rd_toggle_wr_clk) full=1;
		if(wr_ptr_rd_clk==rd_gray_ptr && wr_toggle_rd_clk==rd_toggle) empty=1;
	end
	assign wr_gray_ptr = wr_ptr ^ (wr_ptr>>1);
	assign rd_gray_ptr = rd_ptr ^ (rd_ptr>>1);
endmodule
