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

; {[define-filter test (owner name)
;   (if (not (eq owner "lexisother"))
;       (concatenate 'string owner "/" name)
;       (format nil "~A" name))]}

;; TODO: Move these primitives to a separate file

;; author: Mishoo
(defun fetch-projects (path)
  (loop for filename in (list-directory path)
        collecting (with-open-file (stream filename)
                     (let ((json:*json-identifier-name-to-lisp* #'identity))
                       (json:with-decoder-simple-list-semantics
                         (json:decode-json stream))))))

(sytes:def-syte-primitive *syte* "docker-running"
                          (lambda ()
                            (uiop:getenv "DOCKER_RUNNING")))

(sytes:def-syte-primitive *syte* "fetch-projects"
                          (lambda (path)
                            (fetch-projects path)))

(sytes:def-syte-primitive *syte* "sort-projects-by-date"
                          (lambda (projs)
                            (sort projs (lambda (a b)
                                          (defparameter ua (local-time:parse-timestring (cdr (assoc :|updated| a))))
                                          (defparameter ub (local-time:parse-timestring (cdr (assoc :|updated| b))))
                                          (local-time:timestamp> ua ub)))))

(sytes:def-syte-primitive *syte* "string" #'string)
(sytes:def-syte-primitive *syte* "concatenate"
                          (lambda (&rest args)
                            (apply #'concatenate 'string args)))

(defun main (&optional args)
  (declare (ignore args))
  (print "Starting web server...")
  (sytes:start-server))
