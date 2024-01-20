#import "../template.typ": *

#datedItem(
  item: "MIPS CPU",
  subitem: "FPGA, CHISEL",
  url: "https://github.com/tianyaochou/mips32-chisel"
)[
  5-stages multi-cycle MIPS CPU on FPGA
  - Support basic subset of MIPS
  - Memory-mapped VGA video output
  - Paint program that draw with up/down/left/right buttons with color selection
]
#datedItem(
  item: "Pipelined RISC-V CPU",
  subitem: "FPGA, Verilog",
)[
  5-stage Pipelined RV32I CPU on FPGA
  - Level 1 cache
  - 2-bit branch prediction
]
#project(
  name: "NixOS on OrangePi 5 Plus",
  url: "https://github.com/tianyaochou/orangepi-5-plus-nixos",
  tech: "Linux, Embeded, Nix",
)[
  Ported NixOS to OrangePi 5 Plus with
  - mainline u-boot
  - armbian kernel
]
