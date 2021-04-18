
`include "interface.sv"
`include "tb_pkg.sv"
module top;
  import uvm_pkg::*;
  import tb_pkg::*;
  
  logic clk ;
  
  intf i_intf(clk);
  
  up_counter DUT(.out(i_intf.out),
                 .rst_h(i_intf.rst_h),
                 .clk(i_intf.clk)
                  );
  

  initial begin
    forever #5 clk=~clk;  
  end

  initial clk=0;
  
  initial begin
    $dumpfile("dump1.vcd");
    $dumpvars(0,top);
  end
  
  initial begin
    uvm_config_db#(virtual intf)::set(uvm_root::get(),"","vif",i_intf);
  end

  initial begin
    run_test("up_counter_any_test");
  end
  
endmodule


