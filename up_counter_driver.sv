
class up_counter_driver extends uvm_driver #(up_counter_sequence_item);
  `uvm_component_utils(up_counter_driver)
  
  function new(string name="",uvm_component parent);
    super.new(name,parent);
  endfunction

  //--------------------------  virtual interface handel ------------  
  virtual interface intf vif;
  //-----------------------------------------------------------------
  
  //-------------------------  get interface handel from top --------
  function void build_phase(uvm_phase phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif))) begin
      `uvm_fatal("driver","unable to get interface");
    end
  endfunction
  //-----------------------------------------------------------------
  
  //---------------------------- run task ---------------------------
  task run_phase(uvm_phase phase);
    up_counter_sequence_item txn;
    forever begin
      seq_item_port.get_next_item(txn);
      // write friver code here
      @(posedge this.vif.clk);
      this.vif.rst_h=txn.rst_h;
      seq_item_port.item_done();    
    end
  endtask
  
endclass:up_counter_driver

