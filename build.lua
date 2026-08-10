-- Build configuration for nehgs-register
-- l3build.pdf for full documentation

module = "nehgs-register"

sourcefiledir = "source"
sourcefiles   = {"*.dtx", "*.ins"}
installfiles  = {"*.sty"}
unpackfiles   = {"*.ins"}

typesetfiles  = {"*.dtx"}
typesetsourcefiles = {"*.dtx"}

checkengines  = {"pdftex"}
stdengine     = "pdftex"

testfiledir   = "testfiles"

packtdszip    = true
flattentds    = false

-- Ship the examples as documentation while keeping the regression suite
-- repository-only.  l3build flattens CTAN documentation files by default,
-- so copyctan() is extended below to restore the examples/ directory.
examplefiles = {
  "examples/getting-started.tex",
  "examples/minimal-register.tex",
  "examples/multi-marriage.tex",
  "examples/stuart-register.tex",
}
demofiles = examplefiles

ctanpkg       = "nehgs-register"
ctanzip       = ctanpkg .. "-" .. "1.1"

uploadconfig = {
  author      = "James P. Howard, II",
  ctanPath    = "/macros/latex/contrib/nehgs-register",
  description = "NEHGS-style genealogical register typesetting",
  license     = "lppl1.3c",
  pkg         = ctanpkg,
  summary     = "Typeset genealogical registers in the style of the New England Historic Genealogical Society",
  topic       = {"genealogy", "humanities"},
  version     = "1.1",
}

local l3build_copyctan = copyctan
function copyctan()
  l3build_copyctan()

  local pkgdir = ctandir .. "/" .. ctanpkg
  local exampledir = pkgdir .. "/examples"
  mkdir(exampledir)

  for _, file in ipairs(examplefiles) do
    cp(file, ".", exampledir)
    local basename = file:match("([^/]+)$")
    rm(pkgdir, basename)
  end
end
