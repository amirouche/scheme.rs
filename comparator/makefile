all:
	cat data/*.scm code.scm > main.scm
	chicken-spock -debug -runtime main.scm > main.js
	cd .. && python3 -m http.server

available-filters:
	fgrep --after=2 filter data/01-comparator.scm
