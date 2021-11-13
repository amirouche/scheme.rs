all: html
	poetry install
	poetry run python maji.py https://localhost:8000/
	python3 -m http.server

html:
	cat index.md discourse/index.md tutorial/index.md $(shell find scheme/ -name "index.md") > scheme.rs.md
	pandoc scheme.rs.md -o scheme.rs.html

serve:
	python3 -m http.server
