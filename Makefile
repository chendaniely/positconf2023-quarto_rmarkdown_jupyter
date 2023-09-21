commands:
	@grep -E '^##' Makefile | sed -e 's/## //g'

.PHONY: all
## all:            Render all the example documents
all:
	make clean

	Rscript -e "rmarkdown::render('example-analysis.Rmd')"
	Rscript -e "rmarkdown::render(\
    input = 'example-analysis.Rmd',\
    output_file = 'output/010-example-analysis-rmd.html')"

	# make quarto render with output work
	touch _quarto.yml
	quarto render example-analysis.Rmd
	quarto render example-analysis.Rmd \
		--toc \
		--output-dir output \
		--output 020-example-analysis-rmd-qmd.html

	# creates example-analysis.html in root
	quarto render example-analysis.qmd
	# creates example-analysis-qmd.html in output dir
	quarto render example-analysis.qmd \
		--toc \
		--output-dir output \
		--output 030-example-analysis-qmd.html

	jupyter nbconvert \
		--to html \
		--output output/040-example-analysis-python-jupyter.html \
		--execute \
		example-analysis-python.ipynb

	jupyter nbconvert \
		--to html \
		--output output/050-example-analysis-r-jupyter.html \
		--execute \
		example-analysis-r.ipynb 

	quarto render example-analysis-python.ipynb --execute
	quarto render example-analysis-r.ipynb --execute

	quarto render example-analysis-python.ipynb \
		--to html \
		--execute \
		--toc \
		--output-dir output \
		--output 060-example-analysis-python-ipynb.html

	quarto render example-analysis-r.ipynb \
		--to html \
		--execute \
		--toc \
		--output-dir output \
		--output 070-example-analysis-r-ipynb.html

	# render notebook to use in quarto document
	jupyter nbconvert \
		--to notebook \
		--execute \
		--inplace \
		example-analysis-python-qmd_meta.ipynb
	# render the quarto document with ipynb embedding
	quarto render example-analysis-python-qmd_meta.qmd \
		--to html \
		--output-dir output \
		--output 080-example-analysis-python-qmd_meta.html

	# convert files
	jupytext \
		--to qmd \
		--output output/090-convert-rmd_qmd.qmd \
		example-analysis.Rmd
	jupytext \
		--to qmd \
		--output output/100-convert-ipynb_qmd.qmd \
		example-analysis-python.ipynb
	
	quarto convert example-analysis-python.ipynb \
		--output output/120-convert-ipynb_qmd.qmd

## clean:          Remove all rendered documents
.PHONY: clean
clean:
	rm -f *.html
	rm -rf output/*
	rm -f _quarto.yml

	jupyter nbconvert --clear-output --inplace example-analysis-python.ipynb
	jupyter nbconvert --clear-output --inplace example-analysis-r.ipynb 

.PHONY: publish
publish:
	quarto publish talk.qmd

.PHONY: slides
slides:
	quarto render talk.qmd \
		--to html
