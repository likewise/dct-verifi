`timescale 100ps/1ps
module test_dct;

parameter CLK_PERIOD = 10;

wire[11:0] dct_2d;
reg CLK,RST;
reg[7:0] xin;

dct_idct test(.CLK(CLK), .RST(RST), .xin(xin), .dct_2d(dct_2d));

initial 
begin
		  CLK <= 1'b0;
		  RST <= 1'b1;
		  #20 RST <= 1'b0;
end

always
		  #(CLK_PERIOD/2) CLK = ~CLK;

initial
begin

		  #15 xin <= 8'h28;#10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h16;
		  #10 xin <= 8'h1A;#10 xin <= 8'h28;#10 xin <= 8'h24;#10 xin <= 8'h1A;

		  #10 xin <= 8'h2B;#10 xin <= 8'h1A;#10 xin <= 8'h21;#10 xin <= 8'h16;
		  #10 xin <= 8'h1D;#10 xin <= 8'h2B;#10 xin <= 8'h16;#10 xin <= 8'h24;

		  #10 xin <= 8'h2B;#10 xin <= 8'h28;#10 xin <= 8'h13;#10 xin <= 8'h24;
		  #10 xin <= 8'h24;#10 xin <= 8'h21;#10 xin <= 8'h0F;#10 xin <= 8'h1A;

		  #10 xin <= 8'h24;#10 xin <= 8'h2B;#10 xin <= 8'h1A;#10 xin <= 8'h21;
		  #10 xin <= 8'h1D;#10 xin <= 8'h1D;#10 xin <= 8'h13;#10 xin <= 8'h04;

		  #10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h1D;#10 xin <= 8'h1A;
		  #10 xin <= 8'h0F;#10 xin <= 8'h21;#10 xin <= 8'h1A;#10 xin <= 8'h04;

		  #10 xin <= 8'h24;#10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h1A;
		  #10 xin <= 8'h16;#10 xin <= 8'h1D;#10 xin <= 8'h1A;#10 xin <= 8'h0C;

		  #10 xin <= 8'h21;#10 xin <= 8'h28;#10 xin <= 8'h1D;#10 xin <= 8'h1A;
		  #10 xin <= 8'h21;#10 xin <= 8'h0C;#10 xin <= 8'h0C;#10 xin <= 8'h04;

		  #10 xin <= 8'h1A;#10 xin <= 8'h21;#10 xin <= 8'h1D;#10 xin <= 8'h16;
		  #10 xin <= 8'h0C;#10 xin <= 8'h04;#10 xin <= 8'h08;#10 xin <= 8'h00;



		  #10 xin <= 8'h28;#10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h16;
		  #10 xin <= 8'h1A;#10 xin <= 8'h28;#10 xin <= 8'h24;#10 xin <= 8'h1A;

		  #10 xin <= 8'h2B;#10 xin <= 8'h1A;#10 xin <= 8'h21;#10 xin <= 8'h16;
		  #10 xin <= 8'h1D;#10 xin <= 8'h2B;#10 xin <= 8'h16;#10 xin <= 8'h24;

		  #10 xin <= 8'h2B;#10 xin <= 8'h28;#10 xin <= 8'h13;#10 xin <= 8'h24;
		  #10 xin <= 8'h24;#10 xin <= 8'h21;#10 xin <= 8'h0F;#10 xin <= 8'h1A;

		  #10 xin <= 8'h24;#10 xin <= 8'h2B;#10 xin <= 8'h1A;#10 xin <= 8'h21;
		  #10 xin <= 8'h1D;#10 xin <= 8'h1D;#10 xin <= 8'h13;#10 xin <= 8'h04;

		  #10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h1D;#10 xin <= 8'h1A;
		  #10 xin <= 8'h0F;#10 xin <= 8'h21;#10 xin <= 8'h1A;#10 xin <= 8'h04;

		  #10 xin <= 8'h24;#10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h1A;
		  #10 xin <= 8'h16;#10 xin <= 8'h1D;#10 xin <= 8'h1A;#10 xin <= 8'h0C;

		  #10 xin <= 8'h21;#10 xin <= 8'h28;#10 xin <= 8'h1D;#10 xin <= 8'h1A;
		  #10 xin <= 8'h21;#10 xin <= 8'h0C;#10 xin <= 8'h0C;#10 xin <= 8'h04;

		  #10 xin <= 8'h1A;#10 xin <= 8'h21;#10 xin <= 8'h1D;#10 xin <= 8'h16;
		  #10 xin <= 8'h0C;#10 xin <= 8'h04;#10 xin <= 8'h08;#10 xin <= 8'h00;


		  #10 xin <= 8'h28;#10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h16;
		  #10 xin <= 8'h1A;#10 xin <= 8'h28;#10 xin <= 8'h24;#10 xin <= 8'h1A;

		  #10 xin <= 8'h2B;#10 xin <= 8'h1A;#10 xin <= 8'h21;#10 xin <= 8'h16;
		  #10 xin <= 8'h1D;#10 xin <= 8'h2B;#10 xin <= 8'h16;#10 xin <= 8'h24;

		  #10 xin <= 8'h2B;#10 xin <= 8'h28;#10 xin <= 8'h13;#10 xin <= 8'h24;
		  #10 xin <= 8'h24;#10 xin <= 8'h21;#10 xin <= 8'h0F;#10 xin <= 8'h1A;

		  #10 xin <= 8'h24;#10 xin <= 8'h2B;#10 xin <= 8'h1A;#10 xin <= 8'h21;
		  #10 xin <= 8'h1D;#10 xin <= 8'h1D;#10 xin <= 8'h13;#10 xin <= 8'h04;

		  #10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h1D;#10 xin <= 8'h1A;
		  #10 xin <= 8'h0F;#10 xin <= 8'h21;#10 xin <= 8'h1A;#10 xin <= 8'h04;

		  #10 xin <= 8'h24;#10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h1A;
		  #10 xin <= 8'h16;#10 xin <= 8'h1D;#10 xin <= 8'h1A;#10 xin <= 8'h0C;

		  #10 xin <= 8'h21;#10 xin <= 8'h28;#10 xin <= 8'h1D;#10 xin <= 8'h1A;
		  #10 xin <= 8'h21;#10 xin <= 8'h0C;#10 xin <= 8'h0C;#10 xin <= 8'h04;

		  #10 xin <= 8'h1A;#10 xin <= 8'h21;#10 xin <= 8'h1D;#10 xin <= 8'h16;
		  #10 xin <= 8'h0C;#10 xin <= 8'h04;#10 xin <= 8'h08;#10 xin <= 8'h00;


		  #10 xin <= 8'h28;#10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h16;
		  #10 xin <= 8'h1A;#10 xin <= 8'h28;#10 xin <= 8'h24;#10 xin <= 8'h1A;

		  #10 xin <= 8'h2B;#10 xin <= 8'h1A;#10 xin <= 8'h21;#10 xin <= 8'h16;
		  #10 xin <= 8'h1D;#10 xin <= 8'h2B;#10 xin <= 8'h16;#10 xin <= 8'h24;

		  #10 xin <= 8'h2B;#10 xin <= 8'h28;#10 xin <= 8'h13;#10 xin <= 8'h24;
		  #10 xin <= 8'h24;#10 xin <= 8'h21;#10 xin <= 8'h0F;#10 xin <= 8'h1A;

		  #10 xin <= 8'h24;#10 xin <= 8'h2B;#10 xin <= 8'h1A;#10 xin <= 8'h21;
		  #10 xin <= 8'h1D;#10 xin <= 8'h1D;#10 xin <= 8'h13;#10 xin <= 8'h04;

		  #10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h1D;#10 xin <= 8'h1A;
		  #10 xin <= 8'h0F;#10 xin <= 8'h21;#10 xin <= 8'h1A;#10 xin <= 8'h04;

		  #10 xin <= 8'h24;#10 xin <= 8'h21;#10 xin <= 8'h21;#10 xin <= 8'h1A;
		  #10 xin <= 8'h16;#10 xin <= 8'h1D;#10 xin <= 8'h1A;#10 xin <= 8'h0C;

		  #10 xin <= 8'h21;#10 xin <= 8'h28;#10 xin <= 8'h1D;#10 xin <= 8'h1A;
		  #10 xin <= 8'h21;#10 xin <= 8'h0C;#10 xin <= 8'h0C;#10 xin <= 8'h04;

		  #10 xin <= 8'h1A;#10 xin <= 8'h21;#10 xin <= 8'h1D;#10 xin <= 8'h16;
		  #10 xin <= 8'h0C;#10 xin <= 8'h04;#10 xin <= 8'h08;#10 xin <= 8'h00;


		  //#100 $finish;
end

initial $display($time, "clk=%b", CLK, " xin = %h", xin);
endmodule

