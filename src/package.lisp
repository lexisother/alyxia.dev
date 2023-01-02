(defpackage #:alyxia.dev
  (:use #:cl #:sytes #:cl-json)
  (:shadowing-import-from #:local-time
                          #:format-timestring
                          #:now)
  (:shadowing-import-from #:osicat
                          #:list-directory))
