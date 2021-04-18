class up_counter_env extends uvm_env;

   //----------------------------------------------------------------------
  `uvm_component_utils(up_counter_env)
   //----------------------------------------------------------------------

  //-----------------------------------------------------------------------
  function new(string name="",uvm_component parent);
    super.new(name,parent);
  endfunction
  //-----------------------------------------------------------------------


  //-------------------- class handles ------------------------------------
  up_counter_agent    agent_h;
  //up_counter_coverage coverage_h;
  //-----------------------------------------------------------------------
  

  //---------------------- build phase ------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_h    = up_counter_agent::type_id::create("agent_h",this);
    //coverage_h = up_counter_coverage::type_id::create("coverage_h",this);
  endfunction
  //-----------------------------------------------------------------------


  //-------------------------- connect phase ------------------------------
  function void connect_phase(uvm_phase phase);
    //agent_h.monitor_h.ap_mon.connect(coverage_h.analysis_export);
  endfunction
  //------------------------------------------------------------------------
endclass:up_counter_env

