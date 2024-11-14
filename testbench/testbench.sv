
`include "rstgen_vif.sv"
`include "rstgen_pkg.sv"
`include "rstgen_env.sv"

module testbench;

  `include "uvm_macros.svh"

  import uvm_pkg::*;
  import rstgen_pkg::*;

  reg  clk;

  `include "rstgen_test.sv"

  rstgen_vif mvif(.clk_i(clk));
  rstgen_vif svif(.clk_i(clk));

  assign svif.rst_o = mvif.rst_o;

  initial begin
      clk = 0;
  end

  always #5 clk = ~clk;

  initial begin
      run_test();
  end

  initial begin
      uvm_config_db#(virtual rstgen_vif)::set(uvm_root::get(), "*env.magt*", "vif", mvif);
      uvm_config_db#(virtual rstgen_vif)::set(uvm_root::get(), "*env.sagt*", "vif", svif);
  end

endmodule: testbench

