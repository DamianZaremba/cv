all: pdf html epub latex

pdf:
	pandoc -V geometry:margin=0.5in README.md -o damianzaremba.pdf

html:
	pandoc README.md -o damianzaremba.html

epub:
	pandoc README.md -o damianzaremba.epub

latex:
	pandoc README.md -o damianzaremba.tex
