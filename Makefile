LISP ?= sbcl

build:
	$(LISP) --load alyxia.dev.asd \
					--eval '(ql:quickload :alyxia.dev)' \
					--eval '(asdf:make :alyxia.dev)' \
					--eval '(quit)'

run:
	$(LISP) --load alyxia.dev.asd \
					--eval '(ql:quickload :alyxia.dev)' \
					--eval '(in-package :alyxia.dev)' \
					--eval '(main)'
