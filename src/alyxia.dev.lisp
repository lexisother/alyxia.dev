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
                            (print path)))

(defparameter *data-directory* "/home/alyxia/Documents/gitrepos/alyxia.dev-lisp/temp/projects")
(loop for f in (list-directory *data-directory*) do
      (let ((in (open f)))
        (json:with-decoder-simple-list-semantics
          (simple-json-bind (name) in
                            (format t "Name: ~A~%" name)))))

; (sytes:def-syte-primitive *syte* "fetch-projects"
;                           (lambda (path)
;                             (loop for f in (list-directory path) do
;                                   (let ((in (open f)))
;                                     (json:with-decoder-simple-list-semantics
;                                       (simple-json-bind (name) in
;                                                         (format t "Name: ~A~%" name)))))))


(defun main (&optional args)
  (declare (ignore args))
  (print "Starting web server...")
  (sytes:start-server))
