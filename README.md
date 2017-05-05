# Pipelined LC-3b Processor

# Features
* 5 stage pipelined processor (IF, ID, EX, MEM, WB)
* Supports the full [LC-3b ISA](https://courses.engr.illinois.edu/ece411/mp/LC3b_ISA.pdf)
* Physical memory
* Split L1 cache (instruction cache and data cache)
* Unified L2 cache with cache arbiter
* Eviction write buffer
* Memory-mapped I/O
* MEM stage instruction leapfrogging
* Instruction prefetching in hardware

# Technical Specifications
* Theoretical maximum frequency: 115.07 MHz
* Slack: 0.00 ns