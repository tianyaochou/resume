#import "template.typ": *

#show: resume.with(
  name: "Tianyao Zhou",
  email: "hi@tianyao.ch",
  phone: "+4555224841",
  github: "tianyaochou",
  linkedin: "tianyaochou"
)

#section(icon: "icons/graduation-cap-solid.svg")[Education]
#datedItem(
  item: "Aarhus University",
  start: "Sep, 2021",
  end: "Jul, 2023"
)[
  MSc. Computer Science\
  GPA: 9.33/12
  - Logic, Semantics and Verification
  - Programming Languages and Software Security
[% IF research %]
  Thesis: Contextual Refinement and Nondeterminism
[% END %]
]
#datedItem(
  item: "University of Science and Technology of China(USTC)",
  start: "Sep, 2017",
  end: "Jul, 2021"
)[
  BEng. Computer Science and Technology\
[% IF research %]
  GPA: 3.33/4.3\
  Rank: 129/253\
  Thesis: A Parser Test Framework Based on ANTLR
[% END %]
]

#section(icon: "icons/user-group-solid.svg")[Experiences]
#datedItem(
  item: "Compiler Engineer",
  subitem: "Huawei, Hangzhou",
  start: "Mar, 2021",
  end: "Jul, 2021"
)[
  Internship working on an in-house programming language
  - Found and fixed various bugs in the parser as by-product of bachelor's thesis
  - Optimized AST traversing algorithm
  - Automated the release of language specification using Pandoc
]
#datedItem(
  item: "Compiler Engineer",
  subitem: "Huawei, Hangzhou",
  start: "Jul, 2020",
  end: "Aug, 2020"
)[
  Internship working on an in-house programming language
  - Fixed many bugs in various parts in the compiler
  - Implemented algorithm for checking mutability of variables
]

#section(icon: "icons/trophy-solid.svg")[Awards]
#datedItem(
  item: "Tuition Waiver",
  start: "Jul, 2022",
)[]
#datedItem(
  item: "Excellent Student Award",
  start: "Sep, 2017 & Sep, 2019"
)[]

#section(icon: "icons/folder-open-solid.svg")[Projects]

[% IF devops %]
#include "projects/devops.typ"
[% END %]
[% IF research %]
#include "projects/research.typ"
[% END %]
[% IF web %]
#include "projects/web.typ"
[% END %]
[% IF software %]
#include "projects/software.typ"
[% END %]
[% IF hardware %]
#include "projects/hardware.typ"
[% END %]

#section(icon: "icons/screwdriver-wrench-solid.svg")[Skills]
#strong("Programming Languages")\
Proficient: C, C++, Python, Coq \
Extensive Use: Haskell, Rust, Javascript, Ruby, Assembly \
Used: OCaml, Lisp, Java, Scala

#strong("Frameworks")\
Ruby on Rails, Vue.js

#strong("Tools")\
Linux, Nix, Coq, Pandoc, LLVM, Git, SQL Databases, Docker, Redis, Make, Bash, CMake