(uiop:define-package #:<% @var name %>/app
  (:use #:cl)
  (:export #:main))
(in-package #:<% @var name %>/app)

(defun main (&rest args)
  (gtk:within-main-loop
   (let ((window (make-instance 'gtk:gtk-window
                                :type  :toplevel
                                :title "Hello, world!"
                                :default-width  640
                                :default-height 480)))
     (gobject:g-signal-connect window "destroy"
                               (lambda (widget)
                                 (declare (ignore widget))
                                 (gtk:leave-gtk-main)))
     (gtk:gtk-widget-show-all window))))
