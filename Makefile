VSIM_DOFILE = $(PWD)/fifo.do
SRC_DIR     = $(PWD)/src
TB_DIR      = $(PWD)/tb
BUILD_DIR   = $(PWD)/build


.PHONY: lib
lib:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR) && \
	vlib fifo_lib && \
	vmap work fifo_lib

.PHONY: compile_fifo
compile_fifo: lib
	cd $(BUILD_DIR) && \
	vcom -pedanticerrors -check_synthesis -2008 $(SRC_DIR)/sync_fifo.vhd && \
	vlog -sv -pedanticerrors $(TB_DIR)/sync_fifo_tb.sv

.PHONY: sim_fifo
sim_fifo: compile_fifo
	cd $(BUILD_DIR) && \
	vsim -voptargs="+acc" -c -onfinish exit sync_fifo_tb -do "run -all;quit"

.PHONY: sim_fifo_gui
sim_fifo_gui: compile_fifo
	cd $(BUILD_DIR) && \
	vsim -voptargs="+acc" -onfinish stop sync_fifo_tb -do "$(VSIM_DOFILE)"

.PHONY: clean
clean:
	@rm -rf ./build
