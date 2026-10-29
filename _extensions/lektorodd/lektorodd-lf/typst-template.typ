// Lektorodd-lf Typst template
// Design system: Crimson Pro (all headings + title), Source Sans Pro (body)
// JetBrains Mono: code only
// Colors: ink-dark #111827, blue #2B6CB0, gold #E7BC73

#let lf(
  title: "Løysingsforslag",
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1.1in, y: 1in),
  paper: "a4",
  lang: "no",
  region: "NO",
  font: ("Source Sans Pro", "Source Sans 3", "Helvetica Neue", "Arial"),
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.2em,
  heading-family: "Crimson Pro",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: rgb("#111827"),
  heading-line-height: 0.65em,
  codefont: ("JetBrains Mono NL", "JetBrains Mono", "Courier New"),
  sectionnumbering: none,
  pagenumbering: "1 / 1",
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  let heading-font = if heading-family == none { font } else { heading-family }

  set page(
    paper: paper,
    margin: margin,
    numbering: pagenumbering,
    number-align: center,
    background: place(top)[
      #box(fill: rgb("#111827"), width: 100%, height: 5.5%)
    ],
    header: [
      #set text(font: codefont, size: 9pt)
      #align(right + horizon)[
        #text(fill: white)[Torodd F. Ottestad]
        #h(4pt)
        #link("https://lektorodd.no/lf.html")[
          #text(fill: rgb("#E7BC73"))[\@lektorodd]
        ]
      ]
    ],
    footer: context [
      #set text(font: font, size: 9pt, fill: rgb("#CBD2E0"))
      #line(length: 100%, stroke: 0.5pt + rgb("#E5E7EB"))
      #v(2pt)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align(left)[#text(fill: rgb("#9CBEE3"))[lektorodd.no]],
        align(center)[#counter(page).display() #h(2pt) / #h(2pt) #counter(page).final().at(0)],
        align(right)[#title],
      )
    ],
  )

  set par(justify: true, leading: 0.75em)
  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize,
    fill: rgb("#111827"),
  )

  // ── Headings ──────────────────────────────────────────────
  show heading.where(level: 1): it => {
    v(0.6em)
    block[
      #set text(
        font: heading-font,
        weight: heading-weight,
        style: heading-style,
        size: 1.7em,
        fill: heading-color,
      )
      #it.body
      #v(0.15em)
      #line(length: 100%, stroke: 1.5pt + rgb("#2B6CB0"))
    ]
    v(0.5em)
  }

  show heading.where(level: 2): it => {
    v(0.8em)
    block[
      #set text(
        font: heading-font,
        weight: heading-weight,
        style: heading-style,
        size: 1.25em,
        fill: heading-color,
      )
      #it.body
    ]
    v(0.2em)
  }

  show heading.where(level: 3): it => {
    v(0.5em)
    block[
      #set text(
        font: font,
        weight: 700,
        size: 0.95em,
        fill: rgb("#1E4B7B"),
      )
      #upper(it.body)
    ]
    v(0.1em)
  }

  // ── Code blocks ───────────────────────────────────────────
  show raw: set text(font: codefont) if codefont != none
  show raw.where(block: true): set block(
    fill: rgb("#F0F2F5"),
    stroke: none,
    radius: 4pt,
    inset: (x: 14pt, y: 12pt),
    width: 100%,
  )
  show raw.where(block: true): set text(size: 0.85em, fill: rgb("#1F2933"))
  show raw.where(block: false): set text(size: 0.88em, fill: rgb("#1F2933"))

  // ── Links ─────────────────────────────────────────────────
  show link: it => {
    set text(fill: rgb("#2B6CB0"))
    underline(it)
  }

  // ── Title block ───────────────────────────────────────────
  if title != none {
    v(1em)
    block[
      #set par(leading: 0.4em)
      #text(
        font: heading-font,
        weight: heading-weight,
        style: heading-style,
        size: title-size,
        fill: heading-color,
      )[#title]
      #if subtitle != none {
        parbreak()
        text(
          font: heading-font,
          style: "italic",
          weight: 400,
          size: subtitle-size,
          fill: rgb("#2B6CB0"),
        )[#subtitle]
      }
    ]
    v(0.4em)
    line(length: 100%, stroke: 2pt + rgb("#E7BC73"))
    v(1em)
  }

  if toc {
    let title = if toc_title == none { auto } else { toc_title }
    block(above: 0em, below: 2em)[
      #outline(
        title: title,
        depth: toc_depth,
        indent: toc_indent,
      )
    ]
  }

  if cols == 1 { doc } else { columns(cols, doc) }
}

// ── Table defaults ────────────────────────────────────────
#set table(
  inset: 7pt,
  stroke: (x, y) => (
    bottom: if y == 0 { 1.5pt + rgb("#2B6CB0") } else { 0.5pt + rgb("#E5E7EB") },
  ),
)
