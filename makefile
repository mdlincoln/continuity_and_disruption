PDF = _book/_main.pdf
WORD = _book/_main.docx
HTML = _book/introduction.html
INPUT = mlincoln_print_network.Rmd

all: $(HTML) $(WORD)

pdf: $(PDF)

$(PDF): $(INPUT)
	Rscript --vanilla -e "bookdown::render_book('$<', 'bookdown::tufte_handout2')"

$(WORD): $(INPUT)
	Rscript --vanilla -e "bookdown::render_book('$<', 'bookdown::word_document2')"

$(HTML): $(INPUT)
	Rscript --vanilla -e "bookdown::render_book('$<', 'bookdown::gitbook')"

.PHONY: clean
clean:
	rm -rf _bookdown_files
	rm -f $(PDF) $(WORD) $(HTML)
