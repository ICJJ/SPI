INCDIR = +incdir+../src

default:run

cmp:
	vcs -full64 -sverilog -ntb_opts uvm-1.2 ../src/spi_top_testbench.sv -l cmp.log -o simv -debug_access+all -kdb -lca -timescale=1ns/1ps -P ${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab ${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a $(INCDIR)

run:cmp
	./simv +UVM_TESTNAME=spi_test -l sim.log +UVM_VERDI_TRACE=UVM_AWARE+HIER+RAL+COMPWAVE -gui=verdi
	
clean:
	rm -rf cmp.log
	rm -rf ./csrc
	rm -rf novas*
	rm -rf simv*
	rm -rf *.log
	rm -rf *.h
	rm -rf *.key
	rm -rf *.fsdb
	rm -rf verdiLog
