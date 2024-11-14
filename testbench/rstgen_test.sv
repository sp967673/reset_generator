
`ifndef __RSTGEN_TEST_SV__
`define __RSTGEN_TEST_SV__

`include "rstgen_test.svh"

function void rstgen_test::build_phase(uvm_phase phase);
    super.build_phase(phase);

    env = rstgen_env::type_id::create("env", this);

endfunction: build_phase

function void rstgen_test::report_phase(uvm_phase phase);
    real cov;
    cov = env.magt.mon.reset_cov.get_coverage();
    super.report_phase(phase);

    `uvm_info(get_type_name(), $sformatf("Coverage is %0d", cov), UVM_LOW)
endfunction: report_phase

task rstgen_test::reset_phase(uvm_phase phase);
    rstgen_initial_reset_sequence rst_seq;

    phase.raise_objection(this);

    rst_seq = rstgen_initial_reset_sequence::type_id::create("rst_seq");
    rst_seq.start(env.magt.seqr);
    phase.drop_objection(this);

endtask: reset_phase

task rstgen_test::main_phase(uvm_phase phase);
    phase.raise_objection(this);
    phase.phase_done.set_drain_time(this, 200);
    phase.drop_objection(this);
endtask: main_phase

`endif //__RSTGEN_TEST_SV__
