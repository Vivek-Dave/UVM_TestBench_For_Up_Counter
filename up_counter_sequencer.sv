

class up_counter_sequencer extends uvm_sequencer#(up_counter_sequence_item);
  
  `uvm_component_utils(up_counter_sequencer)  
  
  function new(string name="",uvm_component parent);  // constructor
    super.new(name,parent);
  endfunction
  
endclass:up_counter_sequencer

