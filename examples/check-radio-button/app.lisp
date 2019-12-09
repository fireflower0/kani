(uiop:define-package #:check-radio-button/app
  (:use #:cl)
  (:export #:main))
(in-package #:check-radio-button/app)

(defun main (&rest args)
  (gtk:within-main-loop
   (let ((window (make-instance 'gtk:gtk-window
                                :type  :toplevel
                                :title "Check & Radio Buttons"))
         (vbox   (make-instance 'gtk:gtk-box
                                :orientation :vertical))
         (hbox   (make-instance 'gtk:gtk-box
                                :orientation :horizontal)))
     
     ;; destroy シグナルをラムダ関数と結びつける
     (gobject:g-signal-connect window "destroy"
                               ;; 終了処理 leave-gtk-main を呼び出す。
                               (lambda (widget)
                                 (declare (ignore widget))
                                 (gtk:leave-gtk-main)))

     ;; 3つのラジオボタンを作成し、ボタンをvboxに配置する
     (let ((vbox   (make-instance 'gtk:gtk-box
                                  :orientation :vertical
                                  :spacing 12
                                  :border-width 12))
           (button (gtk:gtk-radio-button-new-with-label nil "Radio Button 1")))
       (gtk:gtk-box-pack-start vbox button)
       (setq button (gtk:gtk-radio-button-new-with-label (gtk:gtk-radio-button-get-group button)
                                                         "Radio Button 2"))
       (setf (gtk:gtk-toggle-button-active button) t)
       (gtk:gtk-box-pack-start vbox button)
       (setq button (gtk:gtk-radio-button-new-with-mnemonic (gtk:gtk-radio-button-get-group button)
                                                            "_Radio Button 3"))
       (gtk:gtk-box-pack-start vbox button)

       ;; ラジオボタンを持つvboxをhboxに置く
       (gtk:gtk-box-pack-start hbox vbox :expand nil :fill nil))

     ;; 3つのチェックボタンを作成し、ボタンをvboxに配置する
     (let ((vbox (make-instance 'gtk:gtk-box
                                :orientation :vertical
                                :homogeneous nil
                                :spacing 12
                                :border-width 12)))
       (gtk:gtk-box-pack-start vbox (gtk:gtk-check-button-new-with-label "Check Button 1"))
       (gtk:gtk-box-pack-start vbox (gtk:gtk-check-button-new-with-label "Check Button 2"))
       (gtk:gtk-box-pack-start vbox (gtk:gtk-check-button-new-with-label "Check Button 3"))

       ;; ボタンを持つvboxをhboxに置く
       (gtk:gtk-box-pack-start hbox vbox :expand nil :fill nil))

     ;; hboxをvboxに入れる
     (gtk:gtk-box-pack-start vbox hbox :expand nil :fill nil)

     ;; vboxに区切り文字を追加する
     (gtk:gtk-box-pack-start vbox
                             (make-instance 'gtk:gtk-separator :orientation :horizontal)
                             :expand nil
                             :fill nil)

     ;; vboxに終了ボタンを追加する
     (let ((vbox-quit (make-instance 'gtk:gtk-box
                                     :orientation :vertical
                                     :spacing 12
                                     :border-width 12))
           (button    (make-instance 'gtk:gtk-button
                                     :label "Close")))
       (gtk:gtk-box-pack-start vbox-quit button :expand nil :fill nil)
       (gtk:gtk-box-pack-start vbox vbox-quit :expand nil)
       (gobject:g-signal-connect button "clicked"
                                 (lambda (button)
                                   (declare (ignore button))
                                   (gtk:gtk-widget-destroy window))))

     ;; vboxをウインドウウィジェットに入れる
     (gtk:gtk-container-add window vbox)
     
     ;; ウィジェット表示
     (gtk:gtk-widget-show-all window))))
