
`ifndef __RSTGEN_SEQUENCE_SV__
`define __RSTGEN_SEQUENCE_SV__

class rstgen_base_sequence extends uvm_sequence;

    `uvm_object_utils(rstgen_base_sequence)

    function new(string name="rstgen_base_sequence");
        super.new(name);
    endfunction: new

    virtual task body();
    endtask: body

endclass: rstgen_base_sequence

class rstgen_initial_reset_sequence extends rstgen_base_sequence;

    `uvm_object_utils(rstgen_initial_reset_sequence)

    rstgen_transaction trans;

    function new(string name="rstgen_initial_reset_sequence");
        super.new(name);
    endfunction: new

    task body();

        `uvm_do_with(trans, {
            reset_width_max    == 50;
            reset_width_min    == 10;
            reset_trigger_time == 0;
        });

    endtask: body

endclass: rstgen_initial_reset_sequence

`endif //__RSTGEN_SEQUENCE_SV__
