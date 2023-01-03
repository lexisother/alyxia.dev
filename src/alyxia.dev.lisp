(in-package #:alyxia.dev)

;; class containing data used by sytes
(defclass alyxia.dev (syte)
  ()
  (:default-initargs
    :names '("lisp.alyxia.dev" "alyxia.dev" "localhost")
    :root (asdf:system-relative-pathname 'alyxia.dev
                                         "src/root/")))

;; create the Syte instance
(defparameter *syte* (make-instance 'alyxia.dev))
;; register it with Sytes
(register-syte *syte*)

(sytes:def-syte-primitive *syte* "fetch-projects"
                          (lambda (path)
                            (loop for filename in (list-directory path)
                                  collecting (with-open-file (stream filename)
                                               (let ((json:*json-identifier-name-to-lisp* #'identity))
                                                 (json:with-decoder-simple-list-semantics
                                                   (json:decode-json stream)))))))

(defun main (&optional args)
  (declare (ignore args))
  (print "Starting web server...")
  (sytes:start-server))
