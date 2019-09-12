(uiop:define-package #:<% @var name %>/app
  (:use #:cl
        #:<% @var name %>/gtk3-tools/widget
        #:<% @var name %>/gtk3-tools/event)
  (:export #:main))
(in-package #:<% @var name %>/app)

(defun main (&rest args)
  (let (;; Create widget
        (window (create-window :type :toplevel
                               :title "Hello, world!"
                               :default-width 640
                               :default-height 480)))
    (gtk:within-main-loop
     ;; Event
     (destroy-window window)
     ;; Show widget
     (gtk:gtk-widget-show-all window))))
