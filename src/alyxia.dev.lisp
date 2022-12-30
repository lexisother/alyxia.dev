(in-package #:alyxia.dev)

(defclass alyxia.dev (syte)
  ()
  (:default-initargs
   :names '("alyxia.dev" "localhost")
   :root (asdf:system-relative-pathname 'alyxia.dev
                                        "src/root/")))

;; create the Syte instance
(defparameter *site* (make-instance 'alyxia.dev))
;; register it with Sytes
(register-syte *site*)

(defun main (&optional args)
  (declare (ignore args))
  (print "Starting web server...")
  (sytes:start-server))
