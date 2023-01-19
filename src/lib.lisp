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

;; author: Mishoo
(defun fetch-projects (path)
  (loop for filename in (list-directory path)
        collecting (with-open-file (stream filename)
                     (let ((json:*json-identifier-name-to-lisp* #'identity))
                       (json:with-decoder-simple-list-semantics
                         (json:decode-json stream))))))

;; frontmatter extraction stuff
(defparameter +front-matter-regex+
  (ppcre:create-scanner "---[\\n|\\r](.*)[\\n|\\r]---(.*)"
                        :single-line-mode t))
(defun parse-md (string)
  (ppcre:register-groups-bind (frontmatter content) (+front-matter-regex+ string)
    (list frontmatter (string-trim
                       '(#\Space #\Newline #\Backspace #\Tab
                         #\Linefeed #\Page #\Return #\Rubout)
                       content))))

(defun fetch-posts (path)
  (loop for filename in (list-directory path)
        collecting (with-open-file (stream filename)
                     (let* ((contents (make-string (file-length stream))))
                       (read-sequence contents stream)
                       (defparameter *parsed* (parse-md contents))
                       (setf yaml (yaml:parse (first *parsed*)))
                       (setf post (last *parsed*))
                       (list yaml post)))))
