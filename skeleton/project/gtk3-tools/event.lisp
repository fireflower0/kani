(uiop:define-package #:<% @var name %>/gtk3-tools/event
  (:use #:cl)
  (:export #:destroy-window
           #:click-button
           #:delete-window))
(in-package #:<% @var name %>/gtk3-tools/event)

(defun destroy-window (window)
  (gobject:g-signal-connect window "destroy"
                            (lambda (widget)
                              (declare (ignore widget))
                              (gtk:leave-gtk-main))))

(defmacro click-button (window button process)
  `(gobject:g-signal-connect ,button "clicked"
                             (lambda (widget)
                               (declare (ignore widget))
                               ,process
                               (gtk:gtk-widget-destroy ,window))))

(defmacro delete-window (window process)
  `(gobject:g-signal-connect ,window "delete-event"
                             (lambda (widget event)
                               (declare (ignore widget event))
                               ,process
                               gdk:+gdk-event-stop+)))
