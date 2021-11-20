# Mighty Scheme implementations comparator

To add a scheme implementation to do the following:

```shell
% cp data/template.txt data/xy-your-favorite-scheme.scm
```

Inside `data/xy-your-favorite-scheme.scm` replace `name` with
`your-favorite-scheme` e.g.:

```scheme
(your-favorite-scheme name "Your Favorite Scheme")
```

Then run the `make` target called `available-filters`, it will give
the name of the flags with a description:

```scheme
% make available-filters
fgrep --after=2 filter data/01-comparator.scm
(r5rs type filter)
(r5rs subtype standards)
(r5rs name "R5RS")
--
(r6rs type filter)
(r6rs subtype standards)
(r6rs name "R6RS")
--
(r7rs-small type filter)
(r7rs-small subtype standards)
(r7rs-small name "R7RS-small")
--
...
```

Then adjust the `data/xy-your-favorite-scheme.scm` to include
lists such as:

```scheme
(my-favorite-scheme r5rs #t)
(my-favorite-scheme r6rs #t)
(my-favorite-scheme wos #t)
```

Send me the resulting `data/xy-your-favorite-scheme.scm` to [my public
inbox](mailto:~amirouche/public-inbox@lists.sr.ht).
