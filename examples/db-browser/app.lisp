(uiop:define-package #:db-browser/app
    (:use #:cl
          #:mito
          #:db-browser/widget
          #:db-browser/models)
  (:export #:main))
(in-package #:db-browser/app)

(defun create-and-fill-model ()
  (let ((model   (make-instance 'gtk:gtk-list-store
                                :column-types '("guint" "gchararray" "guint")))
        (pg-lang (select-dao 'pg-lang)))
    (dolist (n pg-lang)
      (gtk:gtk-list-store-set model (gtk:gtk-list-store-append model)
                              (object-id n)
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
    (create-header view "ID" 0)
    (create-header view "Name" 1)
    (create-header view "Year" 2)
    view))

(defun main (&rest args)
  (create-pg-lang-table)
  (gtk:within-main-loop
    (let ((window (create-main-window))
          (table  (create-table))
          (view   (create-view-and-model))
          (quit   (make-instance 'gtk:gtk-button :label "Quit")))

      (gobject:g-signal-connect window "destroy"
                                (lambda (widget)
                                  (declare (ignore widget))
                                  (gtk:leave-gtk-main)))

      (gobject:g-signal-connect quit "clicked"
                                (lambda (widget)
                                  (declare (ignore widget))
                                  (gtk:gtk-widget-destroy window)))

      ;; パッキングテーブル
      ;;  0          1          2
      ;; 0+----------+----------+
      ;;  |          |          |
      ;; 1+----------+----------+
      ;;  |          |          |
      ;; 2+----------+----------+
      ;;  |          |          |
      ;; 3+----------+----------+
      (gtk:gtk-table-attach table view 0 2 0 2)
      (gtk:gtk-table-attach table quit 0 2 2 3)

      (gtk:gtk-container-add window table)

      (gtk:gtk-widget-show-all window))))
