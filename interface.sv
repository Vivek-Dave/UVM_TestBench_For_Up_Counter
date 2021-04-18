
interface intf(input logic clk);
    // ------------------- port declaration--------------
    logic rst_h;
    logic [7:0]out;
    //---------------------------------------------------
  
    //------------------- clocking & modport declaration ------

    // SystemVerilog "clocking block"
    // Clocking outputs are DUT inputs and vice versa
  	clocking cb_driver @(posedge clk);
      default input #1step output #1;
      output rst_h;
      input out;
    endclocking
    //---------------------------------------------------------
        
  	modport driver_block(clocking cb_driver);
    
	//---------------------- ASSERTION -------------------------
    property check_counter;
      disable iff (rst_h)
      @(posedge clk) out|=>(out==$past(out,1)+1);
    endproperty
      
    //----------------------------------------------------------
    
      ASSERT:assert property(check_counter) $display("--------- ASSERTION PASS --------");
        else $display("----------- ASSERTION FAILS --------------"); 
    
endinterface
