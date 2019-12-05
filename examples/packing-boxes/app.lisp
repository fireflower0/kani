(uiop:define-package #:packing-boxes/app
  (:use #:cl)
  (:export #:main))
(in-package #:packing-boxes/app)

;; 複数のボタンを含む水平ボックスを作成
;; :expand  tの場合、ボックスは割当てられた領域を満たすように拡張される
;;          nilの場合、ボックスがウィジェットにちょうどフィットするように縮む
;; :fill    tの場合、ウィジェットが拡張領域を確保する
;;          nilの場合、ウィジェットの周りのボックスの中に拡張パッドを詰める
;; :padding ウィジェットの両サイドに入れるスペース
(defun make-box (homogeneous spacing expand fill padding)
  (let (;; ウィジェットをパックするための水平ボックスを作成
        (box (make-instance 'gtk:gtk-box
                            :orientation :horizontal
                            :homogeneous homogeneous  ; 各オブジェクトが同じサイズをとるかどうか
                            :spacing spacing)))       ; ウィジェット同士の間に入れるスペース
    (gtk:gtk-box-pack-start box
                            (gtk:gtk-button-new-with-label "gtk-box-pack")
                            :expand expand
                            :fill fill
                            :padding padding)
    (gtk:gtk-box-pack-start box
                            (gtk:gtk-button-new-with-label "box")
                            :expand expand
                            :fill fill
                            :padding padding)
    (gtk:gtk-box-pack-start box
                            (gtk:gtk-button-new-with-label "button")
                            :expand expand
                            :fill fill
                            :padding padding)
    (gtk:gtk-box-pack-start box
                            (if expand
                                (gtk:gtk-button-new-with-label "T")
                                (gtk:gtk-button-new-with-label "NIL"))
                            :expand expand
                            :fill fill
                            :padding padding)
    (gtk:gtk-box-pack-start box
                            (if fill
                                (gtk:gtk-button-new-with-label "T")
                                (gtk:gtk-button-new-with-label "NILL"))
                            :expand expand
                            :padding padding)
    (gtk:gtk-box-pack-start box
                            (gtk:gtk-button-new-with-label (format nil "~A" padding))
                            :expand expand
                            :fill fill
                            :padding padding)
    box))

;; メイン関数
;; 引数 spacing はボタンの間隔、デフォルトは 0
(defun main (&key (spacing 0))
  (gtk:within-main-loop
    (let (;; トップレベルウィンドウを作成
          (window  (make-instance 'gtk:gtk-window
                                  :title "Box Packing"
                                  :type :toplevel
                                  :border-width 12))
          ;; ウィジェットをパックするためのボックスを作成
          (vbox    (make-instance 'gtk:gtk-box
                                  :orientation :vertical
                                  :spacing 6))
          ;; ボランを作成
          (button  (make-instance 'gtk:gtk-button
                                  :label "Quit"))
          ;; 終了ボタンをパックするためのボックスを作成
          (quitbox (make-instance 'gtk:gtk-box
                                  :orientation :horizontal)))

      ;; ボタンの clicked シグナルを処理するシグナルハンドラ
      (gobject:g-signal-connect button "clicked"
                                (lambda (widget)
                                  (declare (ignore widget))
                                  (gtk:gtk-widget-destroy window)))

      ;; destroy シグナルをラムダ関数と結びつける
      (gobject:g-signal-connect window "destroy"
                                (lambda (widget)
                                  (declare (ignore widget))
                                  (gtk:leave-gtk-main)))

      ;; ラベルをボックスにパッキングする
      (gtk:gtk-box-pack-start vbox
                              (make-instance 'gtk:gtk-label
                                             :label (format nil
                                                            "GtkBox   ~
                                                             :orientation :horizontal   ~
                                                             :homogeneous nil   ~
                                                             :spacing ~A"
                                                            spacing)
                                             :xalign 0)
                              :expand nil)

      (gtk:gtk-box-pack-start vbox
                              (make-box nil spacing nil nil 0)
                              :expand nil)

      (gtk:gtk-box-pack-start vbox
                              (make-box nil spacing t nil 0)
                              :expand nil)

      (gtk:gtk-box-pack-start vbox
                              (make-box nil spacing t t 0)
                              :expand nil)

      ;; ラベルをボックスにパッキングする
      (gtk:gtk-box-pack-start vbox
                              (make-instance 'gtk:gtk-label
                                             :label (format nil
                                                            "GtkBox   ~
                                                             :orientation :horizontal   ~
                                                             :homogeneous t   ~
                                                             :spacing ~A"
                                                            spacing)
                                             :xalign 0)
                              :expand nil
                              :padding 6)

      (gtk:gtk-box-pack-start vbox
                              (make-box t spacing t nil 0)
                              :expand nil)

      (gtk:gtk-box-pack-start vbox
                              (make-box t spacing t t 0)
                              :expand nil)

      (gtk:gtk-box-pack-start vbox
                              (gtk:gtk-separator-new :horizontal)
                              :expand nil
                              :padding 6)

      ;; 右側の終了ボタンを調整する
      (gtk:gtk-box-pack-end quitbox button :expand nil)
      (gtk:gtk-box-pack-start vbox quitbox :expand nil)

      ;; ウィジェットをウィンドウに配置
      (gtk:gtk-container-add window vbox)

      ;; 全てのウィジェット表示
      (gtk:gtk-widget-show-all window))))
