This contains my LaTeX packages.

These packages can live if you don't want to include the relative path in the latex doc
$TEXMFHOME/tex/latex/*.sty

TEXMFHOME can be set by editing $(kpsewhich texmf.cnf) ( = /usr/local/texlive/2012/texmf.cnf)
# Then run >> kpsewhich texmf.cnf

If this repo gets updated to pull the changes into projects that have this repo as a submodule you must run following

    git pull
    git submodule update

