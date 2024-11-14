
`ifndef __RSTGEN_AGENT_SVH__
`define __RSTGEN_AGENT_SVH__

class rstgen_agent extends uvm_agent;

    `uvm_component_utils(rstgen_agent)

    rstgen_config cfg;
    rstgen_driver drv;
    rstgen_monitor mon;
    rstgen_sequencer seqr;

    virtual rstgen_vif vif;
    
    function new(string name="rstgen_agent", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass: rstgen_agent

`endif //__RSTGEN_AGENT_SVH__
