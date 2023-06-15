all: verilog2smv NuSMV visualizer

verilog2smv:
	@echo "Downloading verilog2smv-1.1.3.tar.gz..."
	@wget https://es-static.fbk.eu/tools/verilog2smv/dload/verilog2smv-1.1.3.tar.gz
	@echo "Extracting verilog2smv-1.1.3.tar.gz..."
	@tar -xzf verilog2smv-1.1.3.tar.gz
	@echo "Compiling verilog2smv..."
	@cd verilog2smv-1.1.3 && ./build.sh
	@rm -f verilog2smv-1.1.3.tar.gz


NuSMV:
	@echo "Downloading NuSMV-2.6.0-linux64.tar.gz..."
	@wget https://nusmv.fbk.eu/distrib/NuSMV-2.6.0-linux64.tar.gz
	@echo "Extracting NuSMV-2.6.0-linux64.tar.gz..."
	@tar -xzf NuSMV-2.6.0-linux64.tar.gz
	@rm -f NuSMV-2.6.0-linux64.tar.gz


visualizer:
	git clone https://github.com/igor-buzhinsky/nusmv_counterexample_visualizer.git


clean:
	@echo "Cleaning up..."
	@rm -rf verilog2smv-1.1.3
	@rm -rf NuSMV-2.6.0-Linux
	@rm -rf nusmv_counterexample_visualizer
