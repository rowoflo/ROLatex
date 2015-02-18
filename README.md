This contains my LaTeX packages.

These packages can live if you don't want to include the relative path in the latex doc
$TEXMFHOME/tex/latex/*.sty

TEXMFHOME can be set by editing $(kpsewhich texmf.cnf) ( = /usr/local/texlive/2012/texmf.cnf)
# Then run >> kpsewhich texmf.cnf

This folder should be added to .gitignore that way it can be updated with "git pull" on its own and not affect the outer repo.

