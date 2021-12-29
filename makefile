all:
	poetry install
	poetry run python maji.py https://localhost:8000/
	make serve

md:
	cat index.md discourse/index.md tutorial/index.md $(shell find scheme/ -name "index.md") > scheme.rs.md

html: md
	pandoc  scheme.rs.md --standalone -o scheme.rs.html

pdf: md
	pandoc --from=markdown scheme.rs.md --pdf-engine=xelatex --standalone -o scheme.rs.tex
	echo Q | xelatex scheme.rs.tex || true

serve:
	python3 -m http.server
