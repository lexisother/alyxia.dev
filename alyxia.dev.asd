(asdf:defsystem #:alyxia.dev
  :description "Personal website"
  :author "Alyxia Sother <alyxia@riseup.net>"
  :license  "MIT"
  :version "0.0.1"
  :build-operation "program-op"
  :build-pathname "website"
  :entry-point "alyxia.dev::main"
  :serial t
  :depends-on (#:sytes)
  :components ((:module "src"
                        :components
                        ((:file "package")
                         (:file "alyxia.dev")))))
