
`ifndef __RSTGEN_TRANSACTION_SV__
`define __RSTGEN_TRANSACTION_SV__

class rstgen_transaction extends uvm_sequence_item;

    // Reset pulse width in ns or clock cycle
    rand int reset_width_max;
    rand int reset_width_min;

    // Reset trigger time in ns or clock cycle
    rand real reset_trigger_time;

    // Reset width. Used for monitor
    rand real reset_width;

    constraint c_rst_width_max {
        soft reset_width_max <= 9999;
    }

    constraint c_rst_width_min {
        soft reset_width_min >= 0;
    }

    constraint c_rst_width {
        reset_width inside {[reset_width_min: reset_width_max]};
    }

    `uvm_object_utils_begin(rstgen_transaction)
        `uvm_field_int  (reset_width_max,    UVM_DEFAULT | UVM_NOPRINT)
        `uvm_field_int  (reset_width_min,    UVM_DEFAULT | UVM_NOPRINT)
        `uvm_field_real (reset_trigger_time, UVM_DEFAULT)
        `uvm_field_real (reset_width,        UVM_DEFAULT)
    `uvm_object_utils_end

    function new(string name="rstgen_transaction");
        super.new(name);
    endfunction: new

endclass: rstgen_transaction

`endif //__RSTGEN_TRANSACTION_SV__
