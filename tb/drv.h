#include "pkt.h"

SC_MODULE(drv){
   sc_in<bool> clk;
   sc_in<bool> rst;
   sc_out<sc_bv< 8> > xin;
   sc_in<bool> rdy_o;
   
   sc_port<sc_fifo_out_if<pkt*> > drv_f;
   
   void driver();

   SC_CTOR(drv){
      SC_CTHREAD(driver, clk.pos());
      reset_signal_is(rst, true);
   }
};
void drv::driver(){
   wait();
   while(true){
      pkt* p = new (pkt);
      dct_calc(p);
      cout<<"@"<<sc_time_stamp()<<"driving xin to DCT_DUT"<<endl;
      for(int i=0;i<64;i++){
	 xin->write(p->xin[i]);
	 wait();
      }
      drv_f->write(p);
      while(!rdy_o) wait();
      while(rdy_o) wait();
   }
}
