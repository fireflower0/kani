(defpackage #:db-browser/widget
  (:use #:cl)
  (:export #:create-main-window
           #:create-table
           #:*main-window-width*
           #:*main-window-height*))
(in-package #:db-browser/widget)

(defparameter *main-window-title*  "Hello, world!")
(defparameter *main-window-width*  300)
(defparameter *main-window-height* 200)
(defparameter *main-window-border-width* 12)

(defun create-main-window ()
  (make-instance 'gtk:gtk-window
                 :title          *main-window-title*
                 :type           :toplevel
                 :border-width   *main-window-border-width*
                 :default-width  *main-window-width*
                 :default-height *main-window-height*))

(defun create-table ()
  (make-instance 'gtk:gtk-table
                 :n-columns 2
                 :n-rows 3
                 :homogeneous t))
