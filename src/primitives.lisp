(in-package #:alyxia.dev)

(sytes:def-url-handler (*syte* "^/blog/(.*)$" id)
                       (defparameter *projs* (fetch-posts "/usr/src/app/blog"))
                       (let ((entry (find-if
                                      (lambda (x)
                                        (string= (gethash "id" (car x)) id)) *projs*)))
                         `(:template "blog/index.syt"
                           :variables ("metadata" ,(car entry)
                                       "content" ,(cdr entry)))))

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

(sytes:def-syte-primitive *syte* "fetch-posts"
                          (lambda (path)
                            (fetch-posts path)))

(sytes:def-syte-primitive *syte* "sort-posts-by-date"
                          (lambda (posts)
                            (sort posts (lambda (a b)
                                          (defun get-date (proj) (gethash "date" (car proj)))
                                          (defparameter ua (local-time:parse-timestring (get-date a)))
                                          (defparameter ub (local-time:parse-timestring (get-date b)))
                                          (local-time:timestamp> ua ub)))))

(sytes:def-syte-primitive *syte* "md"
                          (lambda (text)
                            (setf 3bmd-code-blocks:*code-blocks* t)
                            (setf 3bmd-code-blocks:*renderer* :chroma)
                            (setf 3bmd:*generate-header-ids* t)
                            (setf streame (with-output-to-string (str)
                                            ;; Blegh.
                                            (3bmd:parse-string-and-print-to-stream (car text) str)))
                            (string streame)))

(sytes:def-syte-primitive *syte* "nth"    #'nth)
(sytes:def-syte-primitive *syte* "random" #'random)
(sytes:def-syte-primitive *syte* "length" #'length)
(sytes:def-syte-primitive *syte* "string" #'string)
(sytes:def-syte-primitive *syte* "concatenate"
                          (lambda (&rest args)
                            (apply #'concatenate 'string args)))
