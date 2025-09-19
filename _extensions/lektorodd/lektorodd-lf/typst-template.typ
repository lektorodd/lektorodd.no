// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#let lf(
  title: "Løysingsforslag",
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1in, y: 1in),
  paper: "a4",
  lang: "no",
  region: "NO",
  font: "Inter",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "Inter",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  pagenumbering: "1/1",
  toc: false,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
    background: place(top)[
      #box(
        fill: rgb("#3D5A80"),
        width: 100%,
        height: 6%,
      )
    ],
    header: [
      #set text(font: "JetBrains Mono", size: 10pt) 
      #align(right + horizon)[
        #text(fill: white)[Torodd F. Ottestad] \ #link("https://lektorodd.no/lf.html")[#text(fill: rgb("#EE6C4D"))[\@lektorodd]]
      ]
    ],
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)

  show heading.where(level:1): it => {
    if "1" not in repr(it.body) {
      pagebreak()
    }
    set text(font: "JetBrains Mono", weight: "bold", size: 1.4em)
    it
  }

  show heading.where(level:2): it => {
    if "1" not in repr(it.body) {
      pagebreak()
    }
    set text(weight: "bold", size: 1.25em)
    it
  }

  if title != none {
    align(center)[#block(inset: 2em)[
      #set par(leading: heading-line-height)
      #if (heading-family != none or heading-weight != "bold" or heading-style != "normal"
           or heading-color != black or heading-decoration == "underline"
           or heading-background-color != none) {
        set text(font: heading-family, weight: heading-weight, style: heading-style, fill: heading-color)
        text(size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(size: subtitle-size)[#subtitle]
        }
      } else {
        text(weight: "bold", size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(weight: "bold", size: subtitle-size)[#subtitle]
        }
      }
    ]]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)
