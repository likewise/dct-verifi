#define SC_INCLUDE_DYNAMIC_PROCESSES
#include <stdio.h>
#include <iostream>
#include <sys/times.h>
#include <sys/stat.h>

#include "systemc.h"
#include "verilated.h"
#include "verilated_vcd_sc.h"

#include "Vdct.h"
#include "mon.h"
#include "drv.h"

int sc_main(int argc, char* argv[]) {
   Verilated::randReset(2);
   Verilated::debug(0);

   sc_clock clk("clock", 10, SC_NS);
   sc_signal<bool>        rst;
   sc_signal<bool>        rdy_out;
   sc_signal<sc_bv< 8> >  xin;
   sc_signal<sc_bv<11> >  z_out;
   sc_signal<sc_bv<12> >  dct_2d;

   sc_fifo<pkt*> drv_f(1),pkt_f(1);


   //_DUT
   Vdct* top = new Vdct("top");
   top-> CLK(clk);
   top-> RST(rst);
   top-> xin(xin);
   top-> z_out(z_out);
   top-> dct_2d(dct_2d);
   top-> rdy_out(rdy_out);

   //_drv
   drv* drv_t = new drv("drv_t");
   drv_t -> clk(clk);
   drv_t -> rst(rst);
   drv_t -> xin(xin);
   drv_t -> rdy_o(rdy_out);

   //_mon
   mon* mon_t = new mon("mon_t");
   mon_t -> clk(clk);
   mon_t -> rst(rst);
   mon_t -> xin(xin);
   mon_t -> z1d(z_out);
   mon_t -> dct(dct_2d);
   mon_t -> rdy_o(rdy_out);

   //_gen
   gen* gen_t = new gen("gen_t");

   //_connections
   gen_t->pkt_f(pkt_f);
   gen_t->drv_f(drv_f);
   drv_t->drv_f(drv_f);
   mon_t->pkt_f(pkt_f);

   srand(time(0));
   //_WAVES
   Verilated::traceEverOn(true);

   rst= 1;
   sc_start(20,SC_NS);

   cout << "Enabling waves...\n";
   VerilatedVcdSc* tfp = new VerilatedVcdSc;
   top->trace (tfp, 99);
   tfp->open ("./vl.vcd");

   while(!gen_t->done){
      tfp->flush();

      rst= 0;
      sc_start(1,SC_NS);
   }

   top->final();
   tfp->close();

   delete top;
   top = NULL;

   return 0;
}
