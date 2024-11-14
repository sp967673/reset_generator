
`ifndef __RSTGEN_VIF_SV__
`define __RSTGEN_VIF_SV__

interface rstgen_vif (
    input clk_i
);

    logic rst_o;

    clocking cb @(posedge clk_i);
        output rst_o;
    endclocking: cb

endinterface: rstgen_vif

`endif //__RSTGEN_VIF_SV__
