(uiop:define-package #:button
  (:use #:cl
        #:button/app)
  (:export #:start))
(in-package #:button)

(defun start (&rest args)
  (main args))
