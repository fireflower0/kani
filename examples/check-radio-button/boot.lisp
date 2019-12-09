(uiop:define-package #:check-radio-button
  (:use #:cl
        #:check-radio-button/app)
  (:export #:start))
(in-package #:check-radio-button)

(defun start (&rest args)
  (main args))
