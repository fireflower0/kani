(uiop:define-package #:tree-view/app
  (:use #:cl)
  (:export #:main))
(in-package #:tree-view/app)

(defun create-and-fill-model ()
  (let ((model (make-instance 'gtk:gtk-list-store
                              :column-types '("gchararray" "guint"))))
    (gtk:gtk-list-store-set model (gtk:gtk-list-store-append model)
                            "FORTRAN" 1957)
    (gtk:gtk-list-store-set model (gtk:gtk-list-store-append model)
                            "LISP" 1958)
    (gtk:gtk-list-store-set model (gtk:gtk-list-store-append model)
                            "COBOL" 1959)
    model))

(defun create-view-and-model ()
  (let* ((model (create-and-fill-model))
         (view  (make-instance 'gtk:gtk-tree-view :model model)))
    ;; セルのレンダラーを作成
    (let* ((renderer (gtk:gtk-cell-renderer-text-new))
           (column   (gtk:gtk-tree-view-column-new-with-attributes "Language"
                                                                   renderer
                                                                   "text"
                                                                   0)))
      (gtk:gtk-tree-view-append-column view column))
    (let* ((renderer (gtk:gtk-cell-renderer-text-new))
           (column   (gtk:gtk-tree-view-column-new-with-attributes "Year"
                                                                   renderer
                                                                   "text"
                                                                   1)))
      (gtk:gtk-tree-view-append-column view column))
    view))

(defun main (&rest args)
  (gtk:within-main-loop
   (let ((window (make-instance 'gtk:gtk-window
                                :title "Simple Tree View"
                                :type :toplevel
                                :border-width 12
                                :default-width 300
                                :default-height 200))
         (view   (create-view-and-model)))
     (gobject:g-signal-connect window "destroy"
                               (lambda (widget)
                                 (declare (ignore widget))
                                 (gtk:leave-gtk-main)))
     (gtk:gtk-container-add window view)
     (gtk:gtk-widget-show-all window))))
