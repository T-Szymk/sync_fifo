# Synchronous FIFO
Basic Synchronous FIFO implemented in VHDL under `./src/sync_fifo.vhd`. 

Empty, Almost Empty, Full and Almost Full signals have been implemented.

The sync_fifo module has the following generic parameters:
* `FIFO_WIDTH` - Width of each FIFO in bits. _Default: 36_
* `FIFO_DEPTH` - Number of rows in FIFO. _Default: 10_

A basic testbench written in SystemVerilog is provided under `./tb/sync_fifo.tb`. 

A Makefile is provided **_to be used with Mentor Modelsim/Questa_**. Main recipes are as follows: 

* To **only** compile the design and TB:
```shell
make compile_fifo
```
* To run simulation in CLI:
```shell
make sim_fifo
```
* To run the simulation in GUI:
```shell
make sim_fifo_gui VSIM_DOFILE=<insert custom .do file path, default is fifo.do>
```
* To clean directory of build artefacts:
```shell
make clean
``` 





