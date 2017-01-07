OUTPUT = _book/_main.pdf
INPUT = mlincoln_print_network.Rmd

all: $(OUTPUT)

$(OUTPUT): $(INPUT)
	Rscript --vanilla -e "bookdown::render_book('$(INPUT)')"

.PHONY: clean
clean:
	rm -rf _bookdown_files
	rm -f _book/_main.pdf
