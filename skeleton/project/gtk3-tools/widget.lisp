(uiop:define-package #:<% @var name %>/gtk3-tools/widget
  (:use #:cl)
  (:export #:create-window
           #:create-button))
(in-package #:<% @var name %>/gtk3-tools/widget)

(defun create-window (title width height)
  (make-instance 'gtk:gtk-window
                 :type  :toplevel
                 :title title
                 :default-width  width
                 :default-height height))

(defun create-button (label)
  (make-instance 'gtk:gtk-button :label label))
