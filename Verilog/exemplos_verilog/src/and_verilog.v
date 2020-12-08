module and_verilog(a, b, c);

	input a, b;
	output c;
	
	and(w, a, b);
	not(c, w);


endmodule
