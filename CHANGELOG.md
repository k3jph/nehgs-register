# Changelog

All notable changes to the `nehgs-register` package will be documented
in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/),
and this project adheres to
[Semantic Versioning](https://semver.org/).

## [1.1] - 2026-08-10

### Added
- The four example documents are now included in the CTAN archive under
  `examples/`.

### Changed
- Release metadata and package documentation updated for version 1.1.

## [1.0.2] - 2026-07-29

### Changed
- Renamed package from `registerstyle` to `nehgs-register` per CTAN
  reviewer feedback (avoids confusion with TeX register terminology).
- All source files, internal LaTeX3 module names, and metadata updated
  to reflect the new name.
- GitHub repository URLs updated to `k3jph/nehgs-register`.

### Removed
- Duplicate `testfiles/stuart-four-generations.tex` (identical to
  `examples/stuart-register.tex`).

## [1.0.1] - 2026-07-29

### Fixed
- CI compatibility with TeX Live 2026: added missing TeX Live packages
  (`tools`, `l3packages`, `hypdoc`, `ec`, `makeindex`).
- Test files updated to standard l3build pattern (`\begin{document}`
  before `\START`, `\OMIT` before `\end{document}`).
- Removed conflicting root-level `registerstyle.ins` (canonical copy
  lives in `source/`).
- Upgraded `install-texlive` action to v4 for Node 24 support and
  CTAN mirror fallback.

## [1.0] - 2026-07-27

First public release.

### Added
- Person registry with `\defineperson` and `\definepersonkv`.
- Generation computation from parent links with cycle detection.
- Main register entries via `\mainperson`.
- Child-list environments: `children`, `childrenof`, `\child`.
- Continuation markers: `\childref` command prints a "+" prefix for
  children who will appear later as main entries.
- Vital-record storage and retrieval (birth, death, baptism, burial
  dates and places; occupation).
- Marriage support: `marriage-date`, `marriage-place` keys and
  `\getmarriagedate`, `\getmarriageplace`, `\getmarriagespouse`
  accessors.
- Multiple marriages via `\addmarriage{id}{key=value}`.
- Approximate date qualifiers: `\circa`, `\before`, `\after`,
  `\between`, `\aboutdate`, `\probably`, `\say`.
- Gender-aware pronoun helpers: `\heshethey`, `\himherthem`,
  `\hishertheirargs`, `\HeSheThey`, `\HimHerThem`, `\HisHerTheir`,
  `\himselfherselfthemself`, keyed to the `sex` field.
- Source/note support: `\registersource`, `\registerendnote`.
- NGSQ (Modified Register) numbering via `ngsq` option.
- Automatic generation headings via `\generationheading{id}`.
- Date formatting through `datetime2` with ISO-8601 validation.
- Index support via `imakeidx`.
- Cross-references with `\xrefperson`.
- Validation with `\checkperson` and `\checkregister`.
- Shorthand macros: `\born`, `\died`, `\married`, `\baptized`,
  `\buried`, `\place`, `\dated`.
- LPPL 1.3c license.
- `l3build` test suite with regression tests.
- `build.lua` for building, testing, and CTAN packaging.
- Comprehensive `.dtx` documentation with user guide and
  implementation notes.
- Examples: minimal register, Stuart dynasty, multi-marriage,
  getting started.
