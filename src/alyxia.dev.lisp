(in-package #:alyxia.dev)

;; register the data class with Sytes
(register-syte *syte*)

(defun main (&optional args)
  (declare (ignore args))
  (print "Starting web server...")
  (sytes:start-server))
