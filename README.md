# nehgs-register

[![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/k3jph/nehgs-register)
[![Homepage](https://img.shields.io/badge/homepage-jameshoward.us-0b2f5b.svg?style=for-the-badge&labelColor=f3dd78)](https://jameshoward.us)

[![CI (main)](https://github.com/k3jph/nehgs-register/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/k3jph/nehgs-register/actions/workflows/ci.yml)
[![CI (develop)](https://github.com/k3jph/nehgs-register/actions/workflows/ci.yml/badge.svg?branch=develop)](https://github.com/k3jph/nehgs-register/actions/workflows/ci.yml)
[![License: LPPL 1.3c](https://img.shields.io/badge/license-LPPL%201.3c-blue.svg)](https://github.com/k3jph/nehgs-register/blob/main/LICENSE)

A LaTeX package for typesetting genealogical registers in the style of
the *New England Historical and Genealogical Register* (NEHGS).

## Features

- **Person registry** with key-value interface (`\definepersonkv`)
  and legacy positional interface (`\defineperson`).
- **Computed generation numbers** from parent links, with cycle
  detection.
- **Numbered main entries** (`\mainperson`) with ancestor chains.
- **Child lists** (`children`, `childrenof` environments) with
  parent validation.
- **Continuation markers** (`\childref`) for children who appear later
  as main entries — a core Register convention.
- **Multiple marriage support** (`\addmarriage`) with date, place,
  and spouse tracking.
- **Vital records**: birth, death, baptism, burial dates and places;
  occupation.
- **Gender-aware pronouns** (`\HeSheThey`, `\himherthem`, etc.)
  keyed to the `sex` field.
- **Approximate date qualifiers** (`\circa`, `\before`, `\after`,
  `\between`, `\aboutdate`, `\probably`, `\say`).
- **Date formatting** through `datetime2` with ISO-8601 validation.
- **Source citations** (`\registersource`, `\registerendnote`).
- **Automatic generation headings** (`\generationheading`).
- **Cross-references** (`\xrefperson`) with hyperlinks.
- **Index generation** via `imakeidx` (optional).
- **Validation** (`\checkperson`, `\checkregister`) warns on
  missing or malformed data.
- **NGSQ numbering** option for Modified Register style.

## Installation

From the package root:

```sh
l3build unpack
```

Or manually:

```sh
latex source/nehgs-register.ins
```

This extracts `nehgs-register.sty` from `source/nehgs-register.dtx`.
Move the resulting `.sty` file to a directory searched by TeX.

To build the documentation:

```sh
l3build doc
```

To run the test suite:

```sh
l3build check
```

## Quick start

```latex
\documentclass{article}
\usepackage[en-US]{datetime2}
\usepackage[date=en-US,abbrevparents]{nehgs-register}

\definepersonkv{john-doe}{
  name      = {John Doe},
  preferred = {John},
  parents   = {},
  sex       = {M},
  birth     = {1820-03-15},
  birth-place = {Boston, Massachusetts}
}

\definepersonkv{james-doe}{
  name      = {James Doe},
  preferred = {James},
  parents   = {john-doe},
  sex       = {M},
  birth     = {1850-11-02}
}

\begin{document}
\begin{registersection}
\mainperson{john-doe} was born \getpersonbirthdate{john-doe}
in \getpersonbirthplace{john-doe}.

\begin{children}
  \childref{james-doe}{b.~\getpersonbirthdate{james-doe}.}
\end{children}

\mainperson{james-doe} was born \getpersonbirthdate{james-doe}.
\end{registersection}
\checkregister
\end{document}
```

## Package options

| Option | Description |
|--------|-------------|
| `index` (default) | Generate index entries via `imakeidx` |
| `noindex` | Suppress index generation |
| `fullparents` (default) | Full names in ancestor chains |
| `abbrevparents` | Preferred names in ancestor chains |
| `ngsq` | NGSQ (Modified Register) numbering |
| `datestyle=`*style* | Set `datetime2` date style (alias: `date=`) |

## Examples and tests

The `examples/` directory is included in the CTAN archive and contains:

- `getting-started.tex` — introductory example with all major
  features
- `minimal-register.tex` — smallest working register
- `multi-marriage.tex` — person with two marriages and children
  from each
- `stuart-register.tex` — four-generation Stuart dynasty register

The repository-only `testfiles/` directory contains `l3build` regression
tests covering each feature area. It is intentionally excluded from the
CTAN archive.

## License

Copyright 2026 James P. Howard, II.

This work may be distributed and/or modified under the conditions
of the LaTeX Project Public License, version 1.3c or later.
See the [LICENSE](LICENSE) file for details.
