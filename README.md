# ML4D 2027 LaTeX Template

Author template for the **Machine Learning for Defence (ML4D)**,
taking place **March 12, 2027** at the Fraunhofer Forum in Berlin, held jointly with
the 11th Machine Learning for Cyber-Physical Systems (ML4CPS) workshop (March 11, 2027).

## Contents

```
ml4d-template/
├── main.tex           # Paper skeleton — start here
├── ml4d.cls           # Workshop document class
├── references.bib     # Bibliography (BibTeX)
├── figures/
│   └── example-plot.pdf
└── .gitignore          # Ignores LaTeX build artifacts
```

## Getting started

1. Copy this template into your own project (or use it as a GitHub template repo).
2. Edit `main.tex`: replace the placeholder title, author blocks, and the `\lipsum`
   filler text with your paper's content.
3. Add references to `references.bib` and cite them as usual.
4. Build the PDF


## Class options

Set in `\documentclass[...]{ml4d}`:

| Option     | Effect                                                        |
|------------|----------------------------------------------------------------|
| `review`   | Double-blind: authors hidden, line numbers, page numbers      |
| `final`    | Camera-ready version                                          |
| `preprint` | Named authors + banner, for arXiv/internal circulation        |
| `a4paper`  | A4 page size instead of US Letter                              |

## Submission guidelines

- **Process:** Single-blind peer review. First register your title and abstract via
  the submission portal; the full paper is due one week later.
- **Length:** Max. 8 pages + up to 2 additional pages for references.
- **Clearance:** All submissions must be unclassified and cleared for public release
  by the authors' organisation(s) — obtaining this clearance is the authors'
  responsibility.
- **Proceedings:** Accepted papers are invited for publication in the workshop
  proceedings by Helmut Schmidt University Press (openHSU) and receive a DOI.
- **Submission portal:** EasyChair (ML4D 2026)
- **Full CFP & details:** https://www.hsu-hh.de/imb/en/organized-events/ml4d
- **Contact:** imb-bw@hsu.hamburg