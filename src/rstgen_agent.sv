
`ifndef __RSTGEN_AGENT_SV__
`define __RSTGEN_AGENT_SV__

`include "rstgen_agent.svh"

function void rstgen_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(rstgen_config)::get(this, "", "cfg", cfg))
        `uvm_fatal("NO_CFG", {"The configuration must be set for: ",get_full_name(), ".cfg"})
    else begin
        uvm_config_db#(rstgen_config)::set(this, "drv", "cfg", cfg);
        uvm_config_db#(rstgen_config)::set(this, "mon", "cfg", cfg);
    end

    if (!uvm_config_db#(virtual rstgen_vif)::get(this, "", "vif", vif))
        `uvm_fatal("NO_VIF", {"The virtual interface must be set for: ",get_full_name(), ".vif"})
    else begin
        uvm_config_db#(virtual rstgen_vif)::set(this, "drv", "vif", vif);
        uvm_config_db#(virtual rstgen_vif)::set(this, "mon", "vif", vif);
    end

    if (get_is_active() == UVM_ACTIVE) begin
        drv = rstgen_driver::type_id::create("drv", this);
    end

    mon = rstgen_monitor::type_id::create("mon", this);
    seqr = rstgen_sequencer::type_id::create("seqr", this);

endfunction: build_phase

function void rstgen_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    if (get_is_active() == UVM_ACTIVE) begin
        drv.seq_item_port.connect(seqr.seq_item_export);
    end

endfunction: connect_phase

`endif //__RSTGEN_AGENT_SV__
