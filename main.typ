#import "template.typ": *

#show: resume.with(
  name: "Tianyao Zhou",
  email: "hi@tianyao.ch",
  phone: "+4555224841",
  github: "tianyaochou"
)

#section(icon: "icons/graduation-cap-solid.svg")[Education]
#datedItem(
  item: "University of Science and Technology of China(USTC)",
  start: "Sep, 2017",
  end: "Jul, 2021"
)[
  BEng. Computer Science and Technology\
  GPA: 3.33/4.3\
  Rank: 129/253\
  Thesis: A Parser Test Framework Based on ANTLR
]
#datedItem(
  item: "Aarhus University",
  start: "Sep, 2021",
  end: "Jul, 2023"
)[
  MSc. Computer Science\
  GPA: 9.33/12
  - Logic, Semantics and Verification
  - Programming Languages and Software Security
  Thesis: Contextual Refinement and Nondeterminism
]

#section(icon: "icons/user-group-solid.svg")[Experiences]
#datedItem(
  item: "Compiler Engineer",
  subitem: "Huawei, Hangzhou",
  start: "Jul, 2020",
  end: "Aug, 2020"
)[]
#datedItem(
  item: "Compiler Engineer",
  subitem: "Huawei, Hangzhou",
  start: "Mar, 2021",
  end: "Jul, 2021"
)[]

#section(icon: "icons/trophy-solid.svg")[Awards]
/*#datedItem(
  item: "Excellent Student Award",
  start: "Sep, 2017"
)[]*/
/*#datedItem(
  item: "Excellent Student Award",
  start: "Sep, 2019"
)[]*/
#datedItem(
  item: "Tuition Waiver",
  start: "Jul, 2022",
)[]

#section(icon: "icons/folder-open-solid.svg")[Projects]
#datedItem(
  item: "MIPS CPU",
  subitem: "FPGA, CHISEL",
)[
  - Memory-mapped VGA Video Output
]
#datedItem(
  item: "Pipelined RISC-V CPU",
  subitem: "FPGA, Verilog",
)[
  - 1 Level Cache
  - Branch Prediction
]
#datedItem(
  item: "Search Engine",
  subitem: "Rust",
)[
  - Pipelined and Parallel Indexer
  - TF-IDF & Boolean Search
]
#datedItem(
  item: "Formalisation of Lambda Calculus with Channel",
  subitem: "Coq",
)[]

#datedItem(
  item: "Verification of Auction Smart Contract",
  subitem: "Coq"
)[
  - Joint Work with Andreas Stenbæk Larsen
]

#section(icon: "icons/screwdriver-wrench-solid.svg")[Skills]
#strong("Programming Languages")\
Coq, Haskell, C++, Rust, Python

#strong("Tools")\
Nix, Coq
