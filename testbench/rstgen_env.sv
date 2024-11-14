
`ifndef __RSTGEN_ENV_SV__
`define __RSTGEN_ENV_SV__

`include "rstgen_env.svh"

function void rstgen_env::build_phase(uvm_phase phase);
    super.build_phase(phase);

    cfg = rstgen_pkg::rstgen_config::type_id::create("cfg", this);
    cfg.ASYNC_MODE = 1;
    cfg.RESET_POLARITY = 0;
    cfg.randomize();

    magt = rstgen_pkg::rstgen_agent::type_id::create("magt", this);
    sagt = rstgen_pkg::rstgen_agent::type_id::create("sagt", this);

    set_config_int("sagt", "is_active", UVM_PASSIVE);

    uvm_config_db#(rstgen_pkg::rstgen_config)::set(this, "*magt", "cfg", cfg);
    uvm_config_db#(rstgen_pkg::rstgen_config)::set(this, "*sagt", "cfg", cfg);

endfunction: build_phase

function void rstgen_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction: connect_phase

`endif //__RSTGEN_ENV_SV__
