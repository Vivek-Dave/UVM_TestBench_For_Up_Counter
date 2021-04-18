
class up_counter_agent extends uvm_agent;

  //-----------------------------------------------------------------------
  `uvm_component_utils(up_counter_agent)
  //-----------------------------------------------------------------------


  //-----------------------------------------------------------------------
  function new(string name="",uvm_component parent);
    super.new(name,parent);
  endfunction
  //-----------------------------------------------------------------------


  //----------------- class handles ---------------------------------------
  up_counter_sequencer sequencer_h;
  up_counter_driver    driver_h;
  up_counter_monitor   monitor_h;
  //-----------------------------------------------------------------------


  //---------------------- build phase ------------------------------------
  function void build_phase(uvm_phase phase);    
    driver_h    = up_counter_driver::type_id::create("driver_h",this);
    sequencer_h = up_counter_sequencer::type_id::create("sequencer_h",this);
    monitor_h   = up_counter_monitor::type_id::create("monitor_h",this);
  endfunction
  //------------------------------------------------------------------------


  //----------------------- connect phase ----------------------------------
  function void connect_phase(uvm_phase phase);
    driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
  endfunction
  //------------------------------------------------------------------------

endclass:up_counter_agent

