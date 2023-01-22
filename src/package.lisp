(defpackage #:alyxia.dev
  ;; Boo hoo! `:use` is bad! Look, I'm aware. It brings all package symbols
  ;; straight into a package and "might conflict with one of your own".
  ;; Counter-argument: I barely have any symbols of my own.
  ;; `:shadowing-import-from` is nice when you use like one or two packages and
  ;; only a couple symbols from them, however, I prefer to just explicitly
  ;; denote `package:symbol` everywhere.
  (:use #:cl #:sytes #:cl-json #:cl-yaml #:local-time #:3bmd)
  (:shadowing-import-from #:osicat
                          #:list-directory))
