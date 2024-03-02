// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let resume(name: "Your Name", email: "hi@example.com", phone: "", github: "", linkedin: "", body) = {
  // Set the document's basic properties.
  set document(author: name, title: name)
  set page(margin: (top: 4em, bottom: 4em, left: 4em, right: 4em))
  set text(font: "Iosevka", weight: "light", size: 10pt, lang: "en")
  show strong: set text(font: "Iosevka Slab")
  set underline(offset: 1pt)
  show link: it => {
    set text (fill: blue)
    underline(offset: 2pt, stroke: blue, it)
  }

  // Title row.
  align(center)[
    #block(strong(text(font: "Iosevka Etoile", weight: "light", 1.75em, name)))
  ]

  // Author information.
  pad(
    grid(
      columns: (1fr,),
      gutter: 1em,
      align(center)[
        #box(image("icons/envelope-solid.svg", fit: "contain"), height: 1em, baseline: 0.2em) #link("mailto:" + email)[#email] $dot$
        #box(image("icons/phone-solid.svg", fit: "contain"), height: 1em, baseline: 0.1em) #phone $dot$
        #box(image("icons/github.svg", fit: "contain"), height: 1em, baseline: 0.15em) #link("https://github.com/" + github)[#github] $dot$
        #box(image("icons/linkedin.svg", fit: "contain"), height: 1em, baseline: 0.15em) #link("https://www.linkedin.com/in/" + linkedin)[#linkedin]
      ],
    ),
  )

  // Main body.
  set par(justify: true, leading: 0.5em)

  body
}

#let section(icon: "", body) = {
  set text(font: "Iosevka Etoile", size: 12pt)
  stack(
    if icon == "" {
      strong(body)
    } else {
      [#box(image(icon, fit: "contain"), height: 1em, baseline: 0.1em) #strong(body)]
    },
    v(0.5em),
    line(length: 100%)
  )
}

#let datedItem(item: "", subitem: "", start: "", end: "", url: "", body) = {
  let mainItem = if url == "" {
    [#strong(item)]
  } else {
    [#link(url)[#strong(item)]]
  }
  let itemElement = if subitem == "" {
    mainItem
  } else {
    [#mainItem, #subitem]
  }
  let period = if end == "" {
    start
  } else {
    [#start --- #end]    
  }
  block(
    breakable: false,
    {
      style(styles =>
        grid(
          columns: (100% - measure(period, styles).width, auto),
          column-gutter: auto,
          itemElement,
          period
        )
      )
      body
    }
  )
}

#let education(institute: none, degree: none, start: none, end: none, finished: true, description) = {
  let end = if finished {end} else {end + "(Expected)"};
  datedItem(item: institute, start: start, end: end)[
    #degree\
    #description
  ]
}

#let experience(role: none, place: none, start: none, end: none, description) = {
  let end = if end != none { end } else { "Present" };
  datedItem(item: role, subitem: place, start: start, end: end, description)
}

#let project(name: none, tech: none, url: none, description) = {
  datedItem(item: name, subitem: tech, url: url, description)
}
