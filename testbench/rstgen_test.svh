
`ifndef __RSTGEN_TEST_SVH__
`define __RSTGEN_TEST_SVH__

class rstgen_test extends uvm_test;

    `uvm_component_utils(rstgen_test)

    rstgen_env env;

    function new(string name="rstgen_test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern function void report_phase(uvm_phase phase);
    extern task reset_phase(uvm_phase phase);
    extern task main_phase(uvm_phase phase);

endclass: rstgen_test

`endif //__RSTGEN_TSET_SVH__
