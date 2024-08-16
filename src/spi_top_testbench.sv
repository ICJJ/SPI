

//SPI_DUT
`include "spi_master.v"
`include "spi_slave.v"
`include "spi_top_dut.v"

//SPI Top TB

 import uvm_pkg::*;
`include "uvm_macros.svh"
`include "spi_sequence_item.sv"
`include "spi_sequence.sv"
`include "spi_sequencer.sv"
`include "spi_driver.sv"
`include "spi_interface.sv"
`include "spi_monitor.sv"
`include "spi_agent.sv"
`include "spi_scoreboard.sv"
`include "spi_environment.sv"
`include "spi_test.sv"


module top_tb;
  
  //---------------------------------------
  //clock and reset signal declaration
  //---------------------------------------
  bit clk;
  bit reset;
  
  //---------------------------------------
  //clock generation
  //---------------------------------------
  always #5 clk = ~clk;
  
  //---------------------------------------
  //reset Generation
  //---------------------------------------
  initial begin
    reset = 0;
    #5 reset =1;
  end
  
  //---------------------------------------
  //interface instance
  //---------------------------------------
  spi_interface intf(clk,reset);
  
  //---------------------------------------
  //DUT instance
  //---------------------------------------
  top_dut dut(intf.mclk, intf.reset,intf.load_master,intf.load_slave,intf.read_master,
  intf.read_slave,intf.start,intf.data_in_master,intf.data_in_slave,
  intf.data_out_master,intf.data_out_slave);
  
   initial begin 
     uvm_config_db#(virtual spi_interface)::set(uvm_root::get(),"*","vif",intf);
  end
  
initial
begin
  //fsdb
  $fsdbDumpfile("top_tb.fsdb");
  $fsdbDumpvars(0,top_tb,"+mda");
  $fsdbDumpMDA();
  $fsdbDumpSVA(0,top_tb);

end

  //---------------------------------------
  //calling test
  //---------------------------------------
  initial begin 
    run_test("spi_test");
  end
  
endmodule
