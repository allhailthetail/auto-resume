/*
BEGIN THE USER-CONFIGURABLE SECTION OF THE DOCUMENT

Normally, these should be the only things you need to change.
*/

// Set the document-wide font:
//   Note that you may need to install this in order for it to work.
//   Generally, 10-12pt font is appropriate for body text.
//   The other font sizes pivot based off this number:
//   headings +4pts, name +20pts
#let font_pts = 10pt
#set text(font: "Fira Sans", weight: "light", size: font_pts)

// Read the YAML file:
// NOTE:
//   There's no reason you can't have several for different targeted resumes.
//   Simply toggle this value to the YAML you've created for the position you're 
//   currently applying for. 
#let cmdline_data = sys.inputs.at("data", default: "yaml/data.yaml")
#let resume_data = yaml(cmdline_data)

/*
END THE USER-CONFIGURABLE SECTION OF THE DOCUMENT
*/

// BEGIN Document
// Formatting for the header name and contact info:
#let prettyName(body) = align(left, text(weight: "bold", size: (font_pts + 20pt), body))
#let contact(body) = align(center, body)

// Amount to inset each level
// Headings are level 0, then *1, *2, etc.
#let inset_level = 1em

// Date last updated for footer:
#let last_updated = {
  align(center)[
    #text(gray, style: "italic", size: (font_pts - 2pt))[
      Last updated: 
      #datetime.today(offset: auto).display(
        "[month repr:short] [day], [year]")
    ]
]
} 

// Page setup
#set page(paper: "us-letter", 
          margin: (top: 3em, bottom: 3em, left: 3em, right: 3em),
          footer: last_updated)

// Control size of heading font:
#show heading: set text(size: (font_pts + 4pt))

// Subtle horizontal separator underneath each top-level heading
#show heading.where(level: 1): it => [
  #it
  #v(-.8em) // Adjust vertical spacing
  #line(length: 100%, stroke: 0.75pt + rgb("#D3D3D3"))
  #v(0.5em)  // Add space after the line
]

// Define array of contact fields:
#let contact_fields = (
  resume_data.contact.city_and_state,
  resume_data.contact.telephone,
  link("mailto:" + resume_data.contact.email)[#resume_data.contact.email]
)

// Name and Contact info:
#grid(columns: 1fr, gutter: 1.5em,
  prettyName[#resume_data.contact.name],
  align(left)[#contact_fields.join([ #sym.bar ])]
)

// Summon your inner Shakespeare:
= Summary
#resume_data.summary

// Your fancy education goes here:
= Education
#list(tight: false, spacing: 2em, marker: none,
  ..resume_data.education.map(e => 
    [*#e.institute* \ _#e.description _])
)

// Of course, tons of experience will be necessary:
= Experience
#for entry in resume_data.experience {
  block(below: 0.5em,
    grid(columns: (60%, auto), rows: auto, column-gutter: 2em, row-gutter: 0em,
        text(weight: "extrabold")[#entry.job],
        text(weight: "bold")[
          #entry.date-start #sym.dash.em #entry.date-end
        ]
    )
  )
  pad(top: 2pt, left: inset_level * 1)[
    #list(tight: true, ..entry.accomplishments)
  ]
}

// Alphabet soup of accolades goes here:
= Certifications
#pad(left: inset_level * 1)[
  #list(tight: true,
    ..resume_data.certifications.map(c => [#c.description, #c.date])
  )
]

// Underwater basketweaving, chainsaw juggling...
= Skills
#pad(left: inset_level * 1)[
  #list(tight: true, ..resume_data.skills)
]
//END Document