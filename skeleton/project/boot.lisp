(uiop:define-package #:<% @var name %>
  (:use #:cl
        #:<% @var name %>/app
        #:<% @var name %>/config)
  (:export #:start))
(in-package #:<% @var name %>)

(defun start (&rest args)
  (main args))
