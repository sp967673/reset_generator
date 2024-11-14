
`ifndef __RSTGEN_ENV_SVH__
`define __RSTGEN_ENV_SVH__

class rstgen_env extends uvm_env;

    `uvm_component_utils(rstgen_env)

    rstgen_pkg::rstgen_config cfg;
    rstgen_pkg::rstgen_agent  magt;
    rstgen_pkg::rstgen_agent  sagt;

    function new(string name="rstgen_env", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass: rstgen_env

`endif //__RSTGEN_ENV_SVH__
