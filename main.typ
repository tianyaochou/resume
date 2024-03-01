#import "template.typ": *

#show: resume.with(
  name: "Tianyao Zhou",
  email: "hi@tianyao.ch",
  phone: "+4555224841",
  github: "tianyaochou",
  linkedin: "tianyaochou"
)

#section(icon: "icons/user-solid.svg")[About Me]
#grid(
  columns: (1fr, 7fr),
  rows: (auto),
  gutter: 10pt,
  image("image.jpeg", height: auto),
  align(horizon)[I am a fast learner with a passion for staying at the forefront of new technologies especially related to programming languages. Continuously rethinking about status quo, I actively seek solutions of improvement with an analytical mindset and structured approach. In addition to my commitment to innovation, I also pay attention to details. Moreover, I am collaborative and eager to contribute my skills and adaptability to a team that values innovation and embraces positive change.]
)

#section(icon: "icons/graduation-cap-solid.svg")[Education]
#education(
  institute: "Aarhus University",
  degree: "MSc. Computer Science",
  start: "Sep, 2021",
  end: "Jul, 2023"
)[
  GPA: 9.33/12 \
  Specialization:
  - Logic, Semantics and Verification
  - Programming Languages and Software Security
$if(research)$
  Thesis: Contextual Refinement and Nondeterminism
$endif$
]
#education(
  institute: "University of Science and Technology of China(USTC)",
  degree: "BEng. Computer Science and Technology",
  start: "Sep, 2017",
  end: "Jul, 2021"
)[
$if(research)$
  GPA: 3.33/4.3\
  Thesis: A Parser Test Framework Based on ANTLR
$endif$
]

#section(icon: "icons/user-group-solid.svg")[Experiences]
#experience(
  role: "Compiler Engineer",
  place: "Huawei, Hangzhou",
  start: "Mar, 2021",
  end: "Jul, 2021"
)[
  Internship working on an in-house programming language
  - Found and fixed various about 5 bugs in the parser as a by-product of bachelor's thesis
  - Optimized AST traversing algorithm reducing CI pipeline by 10 minutes
  - Automated the release of language specification using Pandoc
]
#experience(
  role: "Compiler Engineer",
  place: "Huawei, Hangzhou",
  start: "Jul, 2020",
  end: "Aug, 2020"
)[
  Internship working on an in-house programming language
  - Fixed many bugs(10+) in various parts of the compiler including parser, type checking, code generation and so on
  - Implemented algorithm for checking mutability of variables
]

#section(icon: "icons/folder-open-solid.svg")[Projects]

$if(devops)$
#include "projects/devops.typ"
$endif$
$if(research)$
#include "projects/research.typ"
$endif$
$if(web)$
#include "projects/web.typ"
$endif$
$if(software)$
#include "projects/software.typ"
$endif$
$if(hardware)$
#include "projects/hardware.typ"
$endif$

#section(icon: "icons/screwdriver-wrench-solid.svg")[Skills]
#strong("Programming Languages") \
Advanced: C, C++, Python, Coq \
Proficient: Haskell, Rust, Javascript, Assembly \
Familiar: OCaml, Lisp, Java, Scala, Raku, F\#

#strong("Frameworks")\
Ruby on Rails, Vue.js

#strong("Tools")\
Linux, Nix, Coq, Pandoc, Latex, Typst, LLVM, Git, SQL Databases, Docker, Redis, Make, Bash, CMake

#section(icon: "icons/language-solid.svg")[Languages]
English: Fluent(TOEFL 98) \
Chinese: Native \
Danish: Beginner(DU3 Modul 4)
