(uiop:define-package #:button/app
  (:use #:cl)
  (:export #:main))
(in-package #:button/app)

(defun main (&rest args)
  (gtk:within-main-loop
    (let (;; トップレベルのウィンドウを作成し、ボーダーの幅を設定
          (window (make-instance 'gtk:gtk-window
                                 :type  :toplevel
                                 :title "Hello, world!"
                                 :default-width  250
                                 :default-height 12))
          ;; ラベル付きのボタンを作成
          (button (make-instance 'gtk:gtk-button
                                 :label "Hello, world!")))
      ;; clicked シグナルを処理するシグナルハンドラ
      (gobject:g-signal-connect button "clicked"
                                ;; クリック時の処理 (標準出力し、ウィンドウを閉じる)
                                (lambda (widget)
                                  (declare (ignore widget))
                                  (format t "Hello, world!~%")
                                  (gtk:gtk-widget-destroy window)))
      ;; destroy シグナルを処理するシグナルハンドラ
      (gobject:g-signal-connect window "destroy"
                                ;; 終了処理 leave-gtk-main を呼び出す。
                                (lambda (widget)
                                  (declare (ignore widget))
                                  (gtk:leave-gtk-main)))
      ;; delete-event シグナルを処理するシグナルハンドラ
      ;; ※ ユーザー又は、ウィンドウマネージャがウィンドウを閉じることを試みると発生するシグナル
      (gobject:g-signal-connect window "delete-event"
                                ;; シグナル処理を停止し、アップリケーションの実行を継続する
                                (lambda (widget event)
                                  (declare (ignore widget event))
                                  (format t "Delete Event Occured.~%")
                                  gdk:+gdk-event-stop+))
      ;; ボタンをウィンドウに配置
      (gtk:gtk-container-add window button)
      ;; 全てのウィジェット表示
      (gtk:gtk-widget-show-all window))))
