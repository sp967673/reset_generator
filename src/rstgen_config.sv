
`ifndef __RSTGEN_CONFIG_SV__
`define __RSTGEN_CONFIG_SV__

class rstgen_config extends uvm_object;

    // This bit is used to configure the rstgen as async reset or sync reset. Default is async.
    bit ASYNC_MODE;

    // This bit is used to configure the rstgen as active-low or active-high. Default is active-low.
    bit RESET_POLARITY;

    `uvm_object_utils_begin(rstgen_config)
        `uvm_field_int (ASYNC_MODE,      UVM_DEFAULT)
        `uvm_field_int (RESET_POLARITY,  UVM_DEFAULT)
    `uvm_object_utils_end

    function new(string name="rstgen_config");
        super.new(name);
    endfunction: new

    function bit get_rst_mode();
        return ASYNC_MODE;
    endfunction: get_rst_mode

    function bit get_rst_polarity();
        return RESET_POLARITY;
    endfunction: get_rst_polarity
    
endclass: rstgen_config

`endif //__RSTGEN_CONFIG_SV__
