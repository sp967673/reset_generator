
`ifndef __RSTGEN_MONITOR_SV__
`define __RSTGEN_MONITOR_SV__

`include "rstgen_monitor.svh"

function void rstgen_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(rstgen_config)::get(this, "", "cfg", cfg))
        `uvm_fatal("NO_CFG", {"The configuration must be set for: ",get_full_name(), ".cfg"})

    if (!uvm_config_db#(virtual rstgen_vif)::get(this, "", "vif", vif))
        `uvm_fatal("NO_VIF", {"The virtual interface must be set for: ",get_full_name(), ".vif"})

endfunction: build_phase

task rstgen_monitor::run_phase(uvm_phase phase);
    rstgen_transaction tr;
    bit reset_type     = cfg.get_rst_mode();
    bit reset_polarity = cfg.get_rst_polarity();
    real rst_start, rst_end, rst_width;

    forever begin
        if (reset_polarity == 0) begin // active_low
            @(negedge vif.rst_o);
            rst_start = $realtime;
            sample_reset_coverage();
            `uvm_info(get_type_name(), $sformatf("[%0t] Reset is active (active-low) at time %0t", $realtime, rst_start), UVM_LOW)
            @(posedge vif.rst_o);
            rst_end = $realtime;
            sample_reset_coverage();
            `uvm_info(get_type_name(), $sformatf("[%0t] Reset is deactive (active-low) at time %0t", $realtime, rst_end), UVM_LOW)
        end else begin
            @(posedge vif.rst_o);
            rst_start = $realtime;
            sample_reset_coverage();
            `uvm_info(get_type_name(), $sformatf("[%0t] Reset is active (active-high) at time %0t", $realtime, rst_start), UVM_LOW)
            @(negedge vif.rst_o);
            rst_end = $realtime;
            sample_reset_coverage();
            `uvm_info(get_type_name(), $sformatf("[%0t] Reset is deactive (active-high) at time %0t", $realtime, rst_end), UVM_LOW)
        end

        rst_width = rst_end - rst_start;

        tr = rstgen_transaction::type_id::create("tr");
        tr.reset_trigger_time = rst_start;
        tr.reset_width = rst_width;
        ap.write(tr);
    end

endtask: run_phase

function void rstgen_monitor::sample_reset_coverage();
    async_mode = cfg.get_rst_mode();
    reset_trig = (vif.rst_o == cfg.get_rst_polarity());
    reset_cov.sample();
endfunction: sample_reset_coverage

`endif //__RSTGEN_MONITOR_SV__
