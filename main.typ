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
  align(horizon)[I am a fast learner with a passion for exploring new technologies and evaluating them in practice. Continuously rethinking about the status quo, I actively seek solutions of improvement with an analytical mindset, and I am ready to tackle unknown technological difficulties with structured approach and deliver results. In addition, I also pay attention to details. Moreover, I am collaborative and a team player, valuing diverse perspectives.]
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
Multilingual, able to adapt to any language including C\#, but mainly:

#let pls = skills.at("programming")
#for (level, pls_) in pls {
  level + ": "
  pls_.join(", ")
  linebreak()
}

#strong("Tools and Frameworks") \
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
    if not p.at("hide", default: false) {
      project(
        name: p.at("name"),
        tech: p.at("keywords", default: ""),
        url: p.at("url", default: ""),
        eval(p.at("description"), mode: "markup")
      )
    }
  }
}
#let projects = data.at("projects")
#let software = projects.at("software")
#renderProjects(software)
#let research = projects.at("research")
#renderProjects(research)
#let hardware = projects.at("hardware")
#renderProjects(hardware)
