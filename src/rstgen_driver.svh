
`ifndef __RSTGEN_DRIVER_SVH__
`define __RSTGEN_DRIVER_SVH__

class rstgen_driver extends uvm_driver #(rstgen_transaction);

    `uvm_component_utils(rstgen_driver)

    rstgen_config cfg;

    virtual rstgen_vif vif;

    function new(string name="rstgen_driver", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);

endclass: rstgen_driver

`endif //__RSTGEN_DRIVER_SVH__
