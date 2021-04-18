class up_counter_monitor extends uvm_monitor;
  //-------------------------------------------------------------
  `uvm_component_utils(up_counter_monitor)
  //-------------------------------------------------------------


  //------------------- constructor -----------------------------
  function new(string name="",uvm_component parent);
    super.new(name,parent);
  endfunction
  //-------------------------------------------------------------

  
  //---------------- sequence_item class ------------------------
  up_counter_sequence_item  txn;
  //-------------------------------------------------------------

  
  //------------------------ virtual interface handle------------  
  virtual interface intf vif;
  //-------------------------------------------------------------


  //------------------- build phase -----------------------------
  function void build_phase(uvm_phase phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif)))
    begin
      `uvm_fatal("monitor","unable to get interface")
    end
    
    txn=up_counter_sequence_item::type_id::create("txn");
  endfunction
  //--------------------------------------------------------------

  //-------------------- run phase -------------------------------
  task run_phase(uvm_phase phase);
    forever
    begin
      // write monitor code here 
      @(posedge vif.clk);
      txn.out=vif.out;
      //$display("----------- inside monitor -------");
    end
  endtask
  //--------------------------------------------------------------


endclass:up_counter_monitor

