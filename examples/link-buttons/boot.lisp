(uiop:define-package #:link-buttons
  (:use #:cl
        #:link-buttons/app)
  (:export #:start))
(in-package #:link-buttons)

(defun start (&rest args)
  (main args))
