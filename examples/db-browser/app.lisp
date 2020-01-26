(uiop:define-package #:db-browser/app
    (:use #:cl
          #:mito
          #:db-browser/widget
          #:db-browser/models)
  (:export #:main))
(in-package #:db-browser/app)

(defun create-and-fill-model ()
  (let ((model   (make-instance 'gtk:gtk-list-store
                                :column-types '("gchararray" "guint")))
        (pg-lang (select-dao 'pg-lang)))
    (dolist (n pg-lang)
      (gtk:gtk-list-store-set model (gtk:gtk-list-store-append model)
                              (pg-lang-name n)
                              (pg-lang-year n)))
    model))

(defun create-header (view text column)
  (let* ((renderer (gtk:gtk-cell-renderer-text-new))
         (column   (gtk:gtk-tree-view-column-new-with-attributes text renderer "text" column)))
    (gtk:gtk-tree-view-append-column view column)))

(defun create-view-and-model ()
  (let* ((model (create-and-fill-model))
         (view  (make-instance 'gtk:gtk-tree-view :model model)))
    ;; セルのレンダラーを作成
    (create-header view "Name" 0)
    (create-header view "Year" 1)
    view))

(defun main (&rest args)
  (create-pg-lang-table)
  (gtk:within-main-loop
    (let ((window (create-main-window))
          (view   (create-view-and-model)))
      (gobject:g-signal-connect window "destroy"
                                (lambda (widget)
                                  (declare (ignore widget))
                                  (gtk:leave-gtk-main)))
      (gtk:gtk-container-add window view)
      (gtk:gtk-widget-show-all window))))
