class up_counter_sequence extends uvm_sequence#(up_counter_sequence_item);
 
  `uvm_object_utils(up_counter_sequence)            // Register up_counter_sequence with factory
 
  up_counter_sequence_item txn;                     // object of transaction class
  

  function new(string name="up_counter_sequence");  // constructor -> create first base class and then derive class
    super.new(name);
  endfunction
  
 virtual task body();
    
 endtask:body
  
endclass:up_counter_sequence

class call_rst_h extends up_counter_sequence;

  `uvm_object_utils(call_rst_h)            // Register call_rst_h with factory

  function new(string name="call_rst_h");  // constructor -> create first base class and then derive class
    super.new(name);
  endfunction

  task body();
    up_counter_sequence_item txn;
    txn=up_counter_sequence_item::type_id::create("txn");
    start_item(txn);
    txn.rst_h=1;
    finish_item(txn);
  endtask

endclass:call_rst_h


class call_rst_h_low extends up_counter_sequence;

  `uvm_object_utils(call_rst_h_low)            // Register call_rst_h_low with factory

  function new(string name="call_rst_h_low");  // constructor -> create first base class and then derive class
    super.new(name);
  endfunction

  task body();
    up_counter_sequence_item txn;
    txn=up_counter_sequence_item::type_id::create("txn");
    start_item(txn);
    txn.rst_h=0;
    finish_item(txn);
  endtask

endclass