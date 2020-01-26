(uiop:define-package #:db-browser
  (:use #:cl
        #:db-browser/app
        #:db-browser/config)
  (:export #:start))
(in-package #:db-browser)

(defun start (&rest args)
  (main args))
