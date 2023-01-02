(in-package #:alyxia.dev)

(defmacro simple-json-bind ((&rest vars) stream &body body)
  (let ((cur-dec (gensym))
        (key-handler
          `(lambda (json-string)
             (let ((lisp-string
                     (funcall json:*json-identifier-name-to-lisp*
                              json-string)))
               ;; On recognizing a variable name, the key handler sets
               ;; the value handler to be a function which,
               ;; in its turn, assigns the decoded value to the
               ;; corresponding variable.  If no variable name matches
               ;; the key, the value handler is set to skip the value.
               (json:set-custom-vars
                 :object-value
                 (cond
                   ,@(loop for var in vars
                           collect
                           `((string= lisp-string ,(symbol-name var))
                             (lambda (value)
                               (setq ,var value))))
                   (t (constantly t))))))))
    `(let ((,cur-dec (json:current-decoder))
           ,@vars)
       (json:bind-custom-vars
         (:internal-decoder ,cur-dec
                            :beginning-of-object (constantly t)
                            :object-key ,key-handler
                            :end-of-object (constantly t))
         (json:decode-json ,stream))
       ,@body)))
