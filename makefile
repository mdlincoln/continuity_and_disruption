PDF = _book/_main.pdf
WORD = _book/_main.docx
INPUT = mlincoln_print_network.Rmd

all: $(PDF) $(WORD)

$(PDF): $(INPUT)
	Rscript --vanilla -e "bookdown::render_book('$<', 'bookdown::tufte_handout2')"

$(WORD): $(INPUT)
	Rscript --vanilla -e "bookdown::render_book('$<', 'bookdown::word_document2')"

.PHONY: clean
clean:
	rm -rf _bookdown_files
	rm -f $(PDF) $(WORD)
