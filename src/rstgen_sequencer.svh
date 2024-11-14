
`ifndef __RSTGEN_SEQUENCER_SVH__
`define __RSTGEN_SEQUENCER_SVH__

class rstgen_sequencer extends uvm_sequencer #(rstgen_transaction);

    `uvm_component_utils(rstgen_sequencer)

    function new(string name="rstgen_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);

endclass: rstgen_sequencer

`endif //__RSTGEN_SEQUENCER_SVH__
