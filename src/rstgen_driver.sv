
`ifndef __RSTGEN_DRIVER_SV__
`define __RSTGEN_DRIVER_SV__

`include "rstgen_driver.svh"

function void rstgen_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(rstgen_config)::get(this, "", "cfg", cfg))
        `uvm_fatal("NO_CFG", {"The configuration must be set for: ",get_full_name(), ".cfg"})

    if (!uvm_config_db#(virtual rstgen_vif)::get(this, "", "vif", vif))
        `uvm_fatal("NO_VIF", {"The virtual interface must be set for: ",get_full_name(), ".vif"})

endfunction: build_phase

task rstgen_driver::run_phase(uvm_phase phase);
    rstgen_transaction trans;

    bit ASYNC_MODE = cfg.get_rst_mode();
    bit RESET_POLARITY = cfg.get_rst_polarity();

    vif.rst_o <= ~RESET_POLARITY;

    forever begin
        seq_item_port.get_next_item(trans);

        if (ASYNC_MODE) begin // asynchronize reset
            #(trans.reset_trigger_time * 1ns);
            `uvm_info(get_type_name(), $sformatf("Asynchronize reset is asserted ..."), UVM_LOW)
            vif.rst_o <= RESET_POLARITY;
            #(trans.reset_width * 1ns);
            vif.rst_o <= ~RESET_POLARITY;
            `uvm_info(get_type_name(), $sformatf("Asynchronize reset is deasserted ..."), UVM_LOW)
        end else begin // synchronize reset
            repeat (trans.reset_trigger_time) @(vif.cb);
            vif.cb.rst_o <= RESET_POLARITY;
            `uvm_info(get_type_name(), $sformatf("Synchronize reset is asserted ..."), UVM_LOW)
            repeat (trans.reset_width) @(vif.cb);
            vif.cb.rst_o <= ~RESET_POLARITY;
            `uvm_info(get_type_name(), $sformatf("Synchronize reset is deasserted..."), UVM_LOW)
        end

        seq_item_port.item_done();
    end

endtask: run_phase

`endif //__RSTGEN_DRIVER_SV__
