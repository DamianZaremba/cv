all: pdf html epub latex

pdf:
	pandoc README.md -o damianzaremba.pdf

html:
	pandoc README.md -o damianzaremba.html

epub:
	pandoc README.md -o damianzaremba.epub

latex:
	pandoc README.md -o damianzaremba.tex
