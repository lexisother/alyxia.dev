(in-package #:alyxia.dev)

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
