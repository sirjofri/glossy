all: glossy.sty glossy.pdf

glossy.sty: glossy.ins glossy.dtx
	latex $<

glossy.pdf: glossy.dtx
	pdflatex $<
	pdflatex $<

clean:
	- rm \
	glossy.aux \
	glossy.glo \
	glossy.idx \
	glossy.log \
	glossy.pdf \
	glossy.sty
