
`ifndef __RSTGEN_MONITOR_SVH__
`define __RSTGEN_MONITOR_SVH__

typedef enum {ASYNC_RESET, SYNC_RESET} reset_mode_e;

class rstgen_monitor extends uvm_monitor;

    uvm_analysis_port #(rstgen_transaction) ap;

    `uvm_component_utils(rstgen_monitor)

    rstgen_config cfg;

    virtual rstgen_vif vif;

    bit async_mode, reset_trig;

    covergroup reset_cov;
        option.per_instance = 1;

        reset_type: coverpoint async_mode {
            bins async_reset = {0};
            bins sync_reset  = {1};
        }

        reset_polarity: coverpoint reset_trig {
            bins reset_asserted   = {1};
            bins reset_deasserted = {0};
        }

        cross reset_type, reset_polarity;
    endgroup: reset_cov

    function new(string name="rstgen_monitor", uvm_component parent);
        super.new(name, parent);

        ap = new("ap", this);
        reset_cov = new();
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);
    extern function void sample_reset_coverage();

endclass: rstgen_monitor

`endif //__RSTGEN_MONITOR_SVH__
