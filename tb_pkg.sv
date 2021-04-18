`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "up_counter_sequence_item.sv"        // transaction class
 `include "up_counter_sequence.sv"             // sequence class
 `include "up_counter_sequencer.sv"            // sequencer class
 `include "up_counter_driver.sv"               // driver class
 `include "up_counter_monitor.sv"
 `include "up_counter_agent.sv"                // agent class  
 //`include "up_counter_coverage.sv"           // coverage class
 `include "up_counter_env.sv"                  // environment class

 `include "up_counter_any_test.sv"             // test1
 //`include "test2.sv"
 //`include "test3.sv"

endpackage
`endif 


