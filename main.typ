#import "template.typ": *

#let data = json("resume.json")
#let me = data.at("profile")

#show: resume.with(
  name: me.at("name"),
  email: me.at("email"),
  phone: me.at("telephone"),
  github: me.at("github"),
  linkedin: me.at("linkedin")
)

#section(icon: "icons/user-solid.svg")[About Me]
#grid(
  columns: 2,
  gutter: 1em,
  image("image.jpeg", height: 8em),
  align(horizon)[I am a fast learner with a passion for staying at the forefront of new technologies. Continuously rethinking about status quo, I actively seek solutions of improvement with an analytical mindset and structured approach. In addition to my commitment to innovation, I also pay attention to details. Moreover, I am collaborative and eager to contribute my skills and adaptability to a team that values innovation and embraces positive change.]
)

#section(icon: "icons/graduation-cap-solid.svg")[Education]
#let educations = data.at("educations")
#for edu in educations {
  education(
    institute: edu.at("institute"),
    degree: edu.at("program"),
    start: edu.at("start"),
    end: edu.at("end"),
    eval(edu.at("description"), mode: "markup")
  )
}

#section(icon: "icons/user-group-solid.svg")[Experiences]
#let experiences = data.at("experiences")
#for exp in experiences {
  experience(
    role: exp.at("role"),
    place: exp.at("organization") + ", " + exp.at("location"),
    start: exp.at("start"),
    end: exp.at("end"),
    eval(exp.at("description"), mode: "markup")
  )
}

#section(icon: "icons/screwdriver-wrench-solid.svg")[Skills]
#let skills = data.at("skills")
#strong("Programming Languages") \
#let pls = skills.at("programming")
#for (level, pls_) in pls {
  level + ": "
  pls_.join(", ")
  linebreak()
}

#strong("Tools") \
#let tools = skills.at("tools")
#tools.join(", ")

#section(icon: "icons/language-solid.svg")[Languages]
English: Fluent(TOEFL 98) \
Chinese: Native \
Danish: Beginner(DU3 Modul 4)

#pagebreak()

#section(icon: "icons/folder-open-solid.svg")[Projects]
#let renderProjects(projects) = {
  for p in projects {
    project(
      name: p.at("name"),
      tech: p.at("keywords", default: ""),
      url: p.at("url", default: ""),
      eval(p.at("description"), mode: "markup")
    )
  }
}
#let projects = data.at("projects")
$if(software)$
#let software = projects.at("software")
#renderProjects(software)
$endif$
$if(research)$
#let research = projects.at("research")
#renderProjects(research)
$endif$
$if(hardware)$
#let hardware = projects.at("hardware")
#renderProjects(hardware)
$endif$

