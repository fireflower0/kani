(uiop:define-package #:packing-boxes
  (:use #:cl
        #:packing-boxes/app)
  (:export #:start))
(in-package #:packing-boxes)

(defun start (&rest args)
  (main :spacing 1))
