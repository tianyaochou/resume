#import "template.typ": *

#show: resume.with(
  name: "Tianyao Zhou",
  email: "hi@tianyao.ch",
  phone: "+4555224841",
  github: "tianyaochou",
  linkedin: "tianyaochou"
)

#section(icon: "icons/user-solid.svg")[About Me]
I am a software engineer with good analytical and problem-solving skills. Besides, I excel in a collaborative team environment. I am also enthusiastic about continuous learning and always ready for challenges and satisfying the needs of the end users. Security is also a basic concern of mine to consider when developing software.

#section(icon: "icons/graduation-cap-solid.svg")[Education]
#datedItem(
  item: "Aarhus University",
  start: "Sep, 2021",
  end: "Jul, 2023"
)[
  MSc. Computer Science \
  GPA: 9.33/12 \
  Specialization:
  - Logic, Semantics and Verification
  - Programming Languages and Software Security
[% IF research || all %]
  Thesis: Contextual Refinement and Nondeterminism
[% END %]
]
#datedItem(
  item: "University of Science and Technology of China(USTC)",
  start: "Sep, 2017",
  end: "Jul, 2021"
)[
  BEng. Computer Science and Technology\
[% IF research || all %]
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
  - Found and fixed various bugs in the parser as a by-product of bachelor's thesis
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
  - Fixed many bugs in various parts of the compiler
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

[% IF devops || all %]
#include "projects/devops.typ"
[% END %]
[% IF research || all %]
#include "projects/research.typ"
[% END %]
[% IF web || all %]
#include "projects/web.typ"
[% END %]
[% IF software || all %]
#include "projects/software.typ"
[% END %]
[% IF hardware || all %]
#include "projects/hardware.typ"
[% END %]

#section(icon: "icons/screwdriver-wrench-solid.svg")[Skills]
#strong("Programming Languages")\
Advanced: C, C++, Python, Coq \
Proficient: Haskell, Rust, Javascript, Ruby, Assembly \
Familiar: OCaml, Lisp, Java, Scala

#strong("Frameworks")\
Ruby on Rails, Vue.js

#strong("Tools")\
Linux, Nix, Coq, Pandoc, LLVM, Git, SQL Databases, Docker, Redis, Make, Bash, CMake

#section(icon: "icons/language-solid.svg")[Languages]
English: Fluent(TOEFL 98) \
Chinese: Native \
Danish: Beginner \