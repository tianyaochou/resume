// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let resume(name: "Your Name", email: "hi@example.com", phone: "", github: "", body) = {
  // Set the document's basic properties.
  set document(author: name, title: name)
  set page(margin: (top: 4em, bottom: 4em, left: 4em, right: 4em))
  set text(font: "Iosevka", lang: "en")

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, name))
  ]

  // Author information.
  pad(
    grid(
      columns: (1fr,),
      gutter: 1em,
      align(center)[
        #box(image("icons/envelope-solid.svg", width: 0.9em), baseline: 0.1em) #link("mailto:" + email)[#email] $dot$
        #box(image("icons/phone-solid.svg", width: 0.9em), baseline: 0.1em) #phone $dot$
        #box(image("icons/github.svg", width: 0.9em), baseline: 0.1em) #link("https://github.com/" + github)[#github]
      ],
    ),
  )

  // Main body.
  set par(justify: true)

  body
}

#let section(icon: "", body) = {
  stack(
    if icon == "" {
      smallcaps(body)
    } else {
      [#box(image(icon, height: 1em, width: 1.2em, fit: "contain"), baseline: 0.15em) #smallcaps(body)]
    },
    v(0.5em),
    line(length: 100%)
  )
}

#let datedItem(item: "", subitem: "", start: "", end: "", body) = {
  let itemElement = if subitem == "" {
    [#strong(item)]
  } else {
    [#strong(item), #subitem]
  }
  let period = if end == "" {
    start
  } else {
    [#start --- #end]    
  }
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
