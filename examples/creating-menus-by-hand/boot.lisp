(uiop:define-package #:creating-menus-by-hand
  (:use #:cl
        #:creating-menus-by-hand/app)
  (:export #:start))
(in-package #:creating-menus-by-hand)

(defun start (&rest args)
  (main args))
