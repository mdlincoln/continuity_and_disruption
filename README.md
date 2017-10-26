Supplementary data and code for Matthew D. Lincoln, "Continuity and Disruption in European Networks of Print Production, 1550-1750", _Artl@s_ (2017).

`supplementary_figure.pdf` contains a figure not published in the final version of the article.

`mlincoln_print_network.Rmd` contains the full prose and figure generation code for the accepted version of this article (before copyediting), including the code to generate `supplementary_figure.pdf`.
This [rmarkdown] file depends on the versioned R pacakges saved via [packrat].
To re-compile this document, ensure R is installed on your system, and then run `make` within this directory.
This should install packrat and the versioned packages, then attempt compile the rmarkdown file.

Most of the code in `mlincoln_print_network.Rmd` is for visualization only, as processing from the raw data is computation-intensive.
The raw data and pre-processing scripts are contained within the `lincolndissdata` package found in `packrat/src/lincolndissdata.tar.gz`.
Readers interested in the network statistics code may consult the scripts in the `data-raw` directory of that package.

`assets` contains the non-generated figures used for this paper.

[rmarkdown]: http://rmarkdown.rstudio.com

[packrat]: http://rstudio.github.io/packrat/
