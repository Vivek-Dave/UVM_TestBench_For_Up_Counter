
class up_counter_any_test extends uvm_test;

    //-----------------------------------------------------------
    `uvm_component_utils(up_counter_any_test)
    //-----------------------------------------------------------

    //-----------------------------------------------------------
    function new(string name="",uvm_component parent);
	    super.new(name,parent);
    endfunction
    //-----------------------------------------------------------

    up_counter_env env_h;

    //-----------------------------------------------------------
    function void build_phase(uvm_phase phase);
      env_h = up_counter_env::type_id::create("env_h",this);
    endfunction
    //-----------------------------------------------------------

    //-----------------------------------------------------------
    function void end_of_elobartion_phase(uvm_phase phase);
      //factory.print();
      $display("End of eleboration phase in agent");
    endfunction
    //-----------------------------------------------------------


    //-----------------------------------------------------------
    task run_phase(uvm_phase phase);
        call_rst_h seq1;
        call_rst_h_low seq2; 
      	phase.raise_objection(this);
        seq1= call_rst_h::type_id::create("seq1");
        seq2= call_rst_h_low::type_id::create("seq");
        seq1.start(env_h.agent_h.sequencer_h);
        seq2.start(env_h.agent_h.sequencer_h);
        #1000 ;
      	phase.drop_objection(this);
    endtask
    //------------------------------------------------------------

endclass:up_counter_any_test

