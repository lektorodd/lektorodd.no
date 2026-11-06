// Lektorodd-lf: PDF-mal for løysingsforslag på lektorodd.no
// Dempa Lektorodd-stil: kvit side, stilen berre i toppbandet.
// Space Grotesk (titlar), Source Sans 3 (tekst), JetBrains Mono (kode og meta).
// Fontane ligg i fonts/, logoen (B, understrek) er lagd rett inn under.

#let lo = (
  cream: rgb("#F6F1E6"),
  surface: rgb("#FCFAF4"),
  border: rgb("#E8E1D2"),
  border-strong: rgb("#D8D2C4"),
  ink: rgb("#1F2933"),
  ink-strong: rgb("#15202B"),
  muted: rgb("#5B6573"),
  blue: rgb("#2B6CB0"),
  mint: rgb("#98D3B4"),
  tavle: rgb("#15202B"),
  on-dark: rgb("#F7F5EF"),
  grid: rgb(31, 41, 51, 18),
)

#let lo-logo = bytes("<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 927 200\" width=\"927\" height=\"200\"><defs></defs><rect x=\"4\" y=\"120.0\" width=\"919.2\" height=\"44.0\" fill=\"#98D3B4\"></rect><path d=\"M22.6 160.0V20.0H45.6V160.0ZM116.0 162.8Q101.2 162.8 89.9 156.5Q78.60000000000001 150.2 72.30000000000001 138.7Q66.0 127.19999999999999 66.0 111.8V109.4Q66.0 93.8 72.2 82.4Q78.4 71.0 89.60000000000001 64.69999999999999Q100.80000000000001 58.39999999999999 115.4 58.39999999999999Q129.8 58.39999999999999 140.60000000000002 64.69999999999999Q151.4 71.0 157.4 82.4Q163.4 93.8 163.4 109.0V117.19999999999999H89.2Q89.6 128.8 97.4 135.8Q105.2 142.8 116.60000000000001 142.8Q127.80000000000001 142.8 133.20000000000002 137.9Q138.60000000000002 133.0 141.4 126.8L160.4 136.6Q157.60000000000002 142.0 152.3 148.1Q147.0 154.2 138.2 158.5Q129.4 162.8 116.0 162.8ZM89.4 99.8H140.0Q139.2 90.0 132.5 84.19999999999999Q125.80000000000001 78.39999999999999 115.2 78.39999999999999Q104.2 78.39999999999999 97.6 84.19999999999999Q91.0 90.0 89.4 99.8ZM183.0 160.0V20.0H206.0V98.6H209.4L245.0 61.19999999999999H275.20000000000005L227.4 109.0L276.8 160.0H247.0L209.4 119.8H206.0V160.0ZM328.2 160.0Q318.6 160.0 312.9 154.3Q307.2 148.6 307.2 138.8V80.19999999999999H281.4V61.19999999999999H307.2V29.400000000000006H330.2V61.19999999999999H358.6V80.19999999999999H330.2V135.0Q330.2 141.0 335.8 141.0H355.6V160.0ZM421.20000000000005 162.8Q406.40000000000003 162.8 394.70000000000005 156.7Q383.0 150.6 376.3 139.3Q369.6 128.0 369.6 112.19999999999999V109.0Q369.6 93.2 376.3 81.8Q383.0 70.39999999999999 394.70000000000005 64.39999999999999Q406.40000000000003 58.39999999999999 421.20000000000005 58.39999999999999Q436.0 58.39999999999999 447.6 64.39999999999999Q459.20000000000005 70.39999999999999 465.90000000000003 81.8Q472.6 93.2 472.6 109.0V112.19999999999999Q472.6 128.0 465.90000000000003 139.3Q459.20000000000005 150.6 447.6 156.7Q436.0 162.8 421.20000000000005 162.8ZM421.20000000000005 142.4Q433.8 142.4 441.8 134.3Q449.8 126.19999999999999 449.8 111.6V109.6Q449.8 95.0 441.8 86.9Q433.8 78.8 421.20000000000005 78.8Q408.6 78.8 400.6 86.9Q392.6 95.0 392.6 109.6V111.6Q392.6 126.19999999999999 400.6 134.3Q408.6 142.4 421.20000000000005 142.4ZM493.00000000000006 160.0V61.19999999999999H515.6V72.6H519.0Q521.2 66.39999999999999 526.4000000000001 63.599999999999994Q531.6 60.8 538.8000000000001 60.8H550.8000000000001V81.19999999999999H538.4000000000001Q528.4000000000001 81.19999999999999 522.2 86.5Q516.0 91.8 516.0 102.8V160.0ZM610.4 162.8Q595.6 162.8 583.9000000000001 156.7Q572.2 150.6 565.5 139.3Q558.8 128.0 558.8 112.19999999999999V109.0Q558.8 93.2 565.5 81.8Q572.2 70.39999999999999 583.9000000000001 64.39999999999999Q595.6 58.39999999999999 610.4 58.39999999999999Q625.2 58.39999999999999 636.8 64.39999999999999Q648.4 70.39999999999999 655.0999999999999 81.8Q661.8 93.2 661.8 109.0V112.19999999999999Q661.8 128.0 655.0999999999999 139.3Q648.4 150.6 636.8 156.7Q625.2 162.8 610.4 162.8ZM610.4 142.4Q623.0 142.4 631.0 134.3Q639.0 126.19999999999999 639.0 111.6V109.6Q639.0 95.0 631.0 86.9Q623.0 78.8 610.4 78.8Q597.8 78.8 589.8 86.9Q581.8 95.0 581.8 109.6V111.6Q581.8 126.19999999999999 589.8 134.3Q597.8 142.4 610.4 142.4ZM722.6 162.8Q710.6 162.8 700.2 156.9Q689.8000000000001 151.0 683.6 139.6Q677.4 128.2 677.4 112.19999999999999V109.0Q677.4 93.0 683.6 81.6Q689.8000000000001 70.19999999999999 700.1 64.29999999999998Q710.4 58.39999999999999 722.6 58.39999999999999Q731.8000000000001 58.39999999999999 738.2 60.599999999999994Q744.6 62.8 748.5 66.19999999999999Q752.4000000000001 69.6 754.6 73.6H758.0V20.0H780.8000000000001V160.0H758.4000000000001V147.0H755.0Q751.4000000000001 153.0 744.0 157.9Q736.6 162.8 722.6 162.8ZM729.4 142.8Q741.8000000000001 142.8 750.0 134.7Q758.2 126.6 758.2 111.6V109.6Q758.2 94.39999999999999 750.1 86.39999999999999Q742.0 78.39999999999999 729.4 78.39999999999999Q717.0 78.39999999999999 708.7 86.39999999999999Q700.4 94.39999999999999 700.4 109.6V111.6Q700.4 126.6 708.7 134.7Q717.0 142.8 729.4 142.8ZM846.4000000000001 162.8Q834.4000000000001 162.8 824.0000000000001 156.9Q813.6000000000001 151.0 807.4000000000001 139.6Q801.2 128.2 801.2 112.19999999999999V109.0Q801.2 93.0 807.4000000000001 81.6Q813.6000000000001 70.19999999999999 823.9000000000001 64.29999999999998Q834.2 58.39999999999999 846.4000000000001 58.39999999999999Q855.6000000000001 58.39999999999999 862.0000000000001 60.599999999999994Q868.4000000000001 62.8 872.3000000000001 66.19999999999999Q876.2 69.6 878.4000000000001 73.6H881.8000000000001V20.0H904.6000000000001V160.0H882.2V147.0H878.8000000000001Q875.2 153.0 867.8000000000001 157.9Q860.4000000000001 162.8 846.4000000000001 162.8ZM853.2 142.8Q865.6000000000001 142.8 873.8000000000002 134.7Q882.0000000000001 126.6 882.0000000000001 111.6V109.6Q882.0000000000001 94.39999999999999 873.9000000000001 86.39999999999999Q865.8000000000001 78.39999999999999 853.2 78.39999999999999Q840.8000000000001 78.39999999999999 832.5 86.39999999999999Q824.2 94.39999999999999 824.2 109.6V111.6Q824.2 126.6 832.5 134.7Q840.8000000000001 142.8 853.2 142.8Z\" fill=\"#15202B\"></path></svg>")

// Rutepapir: krem flate med tynne liner, 17 pt rute
#let lo-rutepapir = tiling(size: (17pt, 17pt))[
  #place(rect(width: 17pt, height: 17pt, fill: lo.cream, stroke: none))
  #place(line(start: (0pt, 0pt), end: (17pt, 0pt), stroke: 0.4pt + lo.grid))
  #place(line(start: (0pt, 0pt), end: (0pt, 17pt), stroke: 0.4pt + lo.grid))
]

// Plain tekst frå innhald (til å dele «Del 1: utan hjelpemiddel»)
#let lo-tekst(c) = {
  if type(c) == str { c }
  else if c.has("text") { c.text }
  else if c.has("children") { c.children.map(lo-tekst).join("") }
  else if c.has("body") { lo-tekst(c.body) }
  else if c == [ ] { " " }
  else { "" }
}

#let lf(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 2.2cm, top: 2cm, bottom: 2.2cm),
  paper: "a4",
  lang: "nn",
  region: "NO",
  font: ("Source Sans 3",),
  fontsize: 10.5pt,
  heading-family: ("Space Grotesk",),
  heading-weight: 600,
  heading-style: "normal",
  heading-decoration: none,
  heading-color: lo.ink-strong,
  heading-line-height: 0.65em,
  codefont: ("JetBrains Mono",),
  sectionnumbering: none,
  pagenumbering: "1 / 1",
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  let mx = if type(margin) == dictionary and "x" in margin { margin.x } else { 2.2cm }
  let mtop = if type(margin) == dictionary and "top" in margin { margin.top }
    else if type(margin) == dictionary and "y" in margin { margin.y } else { 2cm }

  set page(
    paper: paper,
    margin: margin,
    footer: context [
      #set text(font: codefont, size: 7.5pt, fill: lo.muted)
      #line(length: 100%, stroke: 0.5pt + lo.border-strong)
      #v(3pt)
      // Side 1 har logoen i toppbandet. Resten av sidene har han nedst til høgre.
      #let side = counter(page).display(pagenumbering, both: true)
      #if counter(page).get().first() == 1 {
        grid(
          columns: (1fr, auto),
          align(left + horizon)[#if title != none { title } #h(6pt) lektorodd.no/lf],
          align(right + horizon, side),
        )
      } else {
        grid(
          columns: (1fr, auto, 1fr),
          align(left + horizon)[#if title != none { title } #h(6pt) lektorodd.no/lf],
          align(center + horizon, side),
          align(right + horizon, image(lo-logo, format: "svg", height: 9pt)),
        )
      }
    ],
  )

  set par(justify: true, leading: 0.68em, spacing: 1.05em)
  set text(lang: lang, region: region, font: font, size: fontsize, fill: lo.ink, hyphenate: true)

  // ── Delskilje: «# Del 1 ...» (sjå lf.lua) ───────────────────
  show heading.where(level: 1): it => {
    let t = lo-tekst(it.body)
    let i = t.position(": ")
    let nr = if i == none { t } else { t.slice(0, i) }
    let rest = if i == none { none } else { t.slice(i + 2) }
    // Sideskiftet før Del 2 og vidare kjem frå lf.lua
    block(width: 100%, fill: lo.tavle, radius: 4pt, inset: (x: 14pt, y: 11pt),
          above: 1.6em, below: 1.2em, breakable: false)[
      #set par(justify: false)
      #text(font: heading-family, weight: 600, size: 15pt, fill: lo.mint, tracking: -0.01em)[#nr]
      #if rest != none [
        #h(8pt)
        #text(font: font, weight: 400, size: 11pt, fill: lo.on-dark)[#rest]
      ]
    ]
  }

  // ── Oppgåve ────────────────────────────────────────────────
  show heading.where(level: 2): it => block(above: 1.7em, below: 0.8em, breakable: false)[
    #set par(justify: false)
    #text(font: heading-family, weight: 600, size: 14pt, fill: lo.ink-strong, tracking: -0.02em)[#it.body]
    #v(-4pt)
    #line(length: 100%, stroke: 0.5pt + lo.border-strong)
  ]

  // ── Deloppgåve: «### a) ...» ───────────────────────────────
  show heading.where(level: 3): it => block(above: 1.3em, below: 0.6em, breakable: false)[
    #set par(justify: false)
    #text(font: heading-family, weight: 600, size: 11.5pt, fill: lo.ink-strong, tracking: -0.01em)[#it.body]
  ]

  show heading.where(level: 4): it => block(above: 1.1em, below: 0.5em)[
    #text(font: font, weight: 700, size: fontsize, fill: lo.ink)[#it.body]
  ]

  // ── Kode ───────────────────────────────────────────────────
  // Utan ligaturar, så >= og != står slik elevane skriv dei
  show raw: set text(font: codefont, features: (calt: 0), ligatures: false)
  show raw.where(block: true): set text(size: 8.5pt, fill: lo.ink)
  // Overstyrer grå boks frå Quarto: lys flate med mint venstrekant
  show raw.where(block: true): set block(
    width: 100%, fill: lo.surface, radius: 3pt, inset: (x: 10pt, y: 8pt),
    stroke: (left: 2.5pt + lo.mint, rest: 0.5pt + lo.border),
  )
  show raw.where(block: false): set text(size: 0.9em, fill: lo.ink-strong)

  show link: set text(fill: lo.blue)

  // ── Toppband: krem med rutepapir, logo og tittel ────────────
  if title != none {
    pad(x: -mx, top: -mtop)[
      #block(width: 100%, fill: lo-rutepapir, inset: (x: mx, top: 1.3cm, bottom: 0.9cm),
             stroke: (bottom: 0.6pt + lo.border-strong))[
        #place(top + right, dy: -0.35cm, image(lo-logo, format: "svg", width: 2.6cm))
        #set par(justify: false, leading: 0.45em)
        #text(font: heading-family, weight: 600, size: 26pt, fill: lo.ink-strong, tracking: -0.03em)[#title]
        #if subtitle != none {
          v(-2pt)
          text(font: font, size: 13pt, fill: lo.muted)[#subtitle]
        }
        #v(8pt)
        #rect(width: 56pt, height: 4pt, fill: lo.mint, stroke: none)
        #v(6pt)
        #set text(font: codefont, size: 8pt, fill: lo.muted)
        #let meta = ()
        #if authors != none { for a in authors { meta.push(a.name) } }
        #if date != none { meta.push(date) }
        #meta.push[lektorodd.no/lf]
        #meta.join(h(6pt) + text(fill: lo.border-strong)[|] + h(6pt))
      ]
    ]
    v(0.6cm)
  }

  if toc {
    let title = if toc_title == none { auto } else { toc_title }
    block(above: 0em, below: 2em)[#outline(title: title, depth: toc_depth, indent: toc_indent)]
  }

  if cols == 1 { doc } else { columns(cols, doc) }
}

// ── Tabellar ────────────────────────────────────────────────
#set table(
  inset: (x: 7pt, y: 6pt),
  stroke: (x, y) => (
    bottom: if y == 0 { 1pt + lo.ink-strong } else { 0.5pt + lo.border },
  ),
)
#show table.cell.where(y: 0): set text(font: "Space Grotesk", weight: 600)
