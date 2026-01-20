class mem_env;
	mem_agent agent;
	mem_sbd sbd;

	task run();
		agent = new();
		sbd = new();

		fork
			agent.run();
			sbd.run();
		join
	endtask
endclass
