.PHONY: all
all: pdf

.PHONY: pdf
pdf:
	pandoc README.md -o damianzaremba.pdf
