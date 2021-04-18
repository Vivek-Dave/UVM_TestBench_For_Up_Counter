
class up_counter_sequence_item extends uvm_sequence_item;

  //------------ i/p || o/p field declaration-----------------

  logic rst_h  ;  //i/p
  logic [7:0]out;  
  //register up_counter_sequence_item class with factory -----
  `uvm_object_utils_begin(up_counter_sequence_item) 
     `uvm_field_int(rst_h  ,UVM_ALL_ON)
  `uvm_object_utils_end
  //--------------------------------------------------------
  
  //-----------------  constructor --------------------
  function new(string name="up_counter_sequence_item");
    super.new();
  endfunction
  //---------------------------------------------------
    
endclass:up_counter_sequence_item
