(uiop:define-package #:link-buttons/app
  (:use #:cl)
  (:export #:main))
(in-package #:link-buttons/app)

(defun main (&rest args)
  (gtk:within-main-loop
   (let ((window (make-instance 'gtk:gtk-window
                                :type  :toplevel
                                :title "Link Button"
                                :default-width  270
                                :border-width 12))
         (grid   (make-instance 'gtk:gtk-grid
                                :orientation :vertical
                                :row-spacing 6
                                :column-homogeneous t)))
     
     ;; destroy シグナルをラムダ関数と結びつける
     (gobject:g-signal-connect window "destroy"
                               ;; 終了処理 leave-gtk-main を呼び出す。
                               (lambda (widget)
                                 (declare (ignore widget))
                                 (gtk:leave-gtk-main)))

     (gtk:gtk-container-add grid (make-instance 'gtk:gtk-label
                                                :use-markup t
                                                :label "<b>Link Button with url</b>"))

     (gtk:gtk-container-add grid (gtk:gtk-link-button-new "https://www.gtk.org/"))

     (gtk:gtk-container-add grid (make-instance 'gtk:gtk-label
                                                :use-markup t
                                                :label "<b>Link Button with Label</b>"))

     (gtk:gtk-container-add grid (gtk:gtk-link-button-new-with-label "https://www.gtk.org/"
                                                                     "Project WebSite"))

     ;; グリッドををウインドウウィジェットに入れる
     (gtk:gtk-container-add window grid)

     ;; ウィジェット表示
     (gtk:gtk-widget-show-all window))))
