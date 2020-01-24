(uiop:define-package #:tree-view
  (:use #:cl
        #:tree-view/app
        #:tree-view/config)
  (:export #:start))
(in-package #:tree-view)

(defun start (&rest args)
  (main args))
