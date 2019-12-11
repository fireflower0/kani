(uiop:define-package #:creating-menus-by-hand/app
  (:use #:cl)
  (:export #:main))
(in-package #:creating-menus-by-hand/app)

(defun main (&rest args)
  (gtk:within-main-loop
   ;; "gtk-shell-shows-menubar"プロパティをNILに設定すると、
   ;; デスクトップ環境ではなく、アプリケーション自体によって
   ;; メニューバーが表示されます。
   ;; (setf (gtk:gtk-settings-gtk-shell-shows-menubar (gtk:gtk-settings-get-default)) nil)

   (let ((window (make-instance 'gtk:gtk-window
                                :type :toplevel
                                :default-width  425
                                :default-height 250
                                :title "Menus by Hand"))
         ;; メニューとボタンに入れるvbox
         (vbox   (gtk:gtk-box-new :vertical 0)))

     ;; メニューバーとメニューバーのメニュー項目を作成する
     (let ((menu-bar   (gtk:gtk-menu-bar-new))
           (file-item  (gtk:gtk-menu-item-new-with-label "File"))
           (view-item  (gtk:gtk-menu-item-new-with-label "View"))
           (tools-item (gtk:gtk-menu-item-new-with-label "Tools"))
           (help-item  (gtk:gtk-menu-item-new-with-label "Help")))

       ;; メニューバーをメインコンテナに追加する
       (gtk:gtk-container-add vbox menu-bar)

       ;; メニューバーにメニュー項目を追加する
       (gtk:gtk-menu-shell-append menu-bar file-item)
       (gtk:gtk-menu-shell-append menu-bar view-item)
       (gtk:gtk-menu-shell-append menu-bar tools-item)
       (gtk:gtk-menu-shell-append menu-bar help-item)

       ;; メニューバーのメニュー項目のメニューを作成する
       (let ((file-menu  (gtk:gtk-menu-new))
             (view-menu  (gtk:gtk-menu-new))
             (tools-menu (gtk:gtk-menu-new))
             (help-menu  (gtk:gtk-menu-new)))

         ;; サブメニューをメニューバーの項目にアタッチする
         (setf (gtk:gtk-menu-item-submenu file-item)  file-menu)
         (setf (gtk:gtk-menu-item-submenu view-item)  view-menu)
         (setf (gtk:gtk-menu-item-submenu tools-item) tools-menu)
         (setf (gtk:gtk-menu-item-submenu help-item)  help-menu)

         ;; ファイルメニューに入れるアイテムを作成する
         (let ((open-item  (gtk:gtk-menu-item-new-with-label "Open"))
               (close-item (gtk:gtk-menu-item-new-with-label "Close"))
               (exit-item  (gtk:gtk-menu-item-new-with-label "Exit")))

           ;;ファイルメニューに項目を追加する
           (gtk:gtk-menu-shell-append file-menu open-item)
           (gtk:gtk-menu-shell-append file-menu close-item)
           (gtk:gtk-menu-shell-append file-menu (gtk:gtk-separator-menu-item-new))
           (gtk:gtk-menu-shell-append file-menu exit-item)

           ;; exit-itemのシグナルハンドラを追加する
           (gobject:g-signal-connect exit-item "activate"
                                     (lambda (widget)
                                       (declare (ignore widget))
                                       (gtk:gtk-widget-destroy window))))

         ;; ビューとツールのメニューは現在空になります

         ;; ヘルプメニューに入れるアイテムを作成する
         (let ((query-item      (gtk:gtk-menu-item-new-with-label "What's this?"))
               (about-help-item (gtk:gtk-menu-item-new-with-label "Info")))

           ;; About Helpメニューにアイテムを追加する
           (gtk:gtk-menu-shell-append help-menu query-item)
           (gtk:gtk-menu-shell-append help-menu (gtk:gtk-separator-menu-item-new))
           (gtk:gtk-menu-shell-append help-menu about-help-item)

           ;; サブメニューとabout-help-itemの項目を作成する
           (let ((about-help-menu (gtk:gtk-menu-new))
                 (about-tool-item (gtk:gtk-menu-item-new-with-label "About This"))
                 (about-more-item (gtk:gtk-menu-item-new-with-label "About That")))

             ;; about-help-itemにサブメニューを添付します。
             (setf (gtk:gtk-menu-item-submenu about-help-item) about-help-menu)

             ;; about-help-menuに項目を追加する
             (gtk:gtk-menu-shell-append about-help-menu about-tool-item)
             (gtk:gtk-menu-shell-append about-help-menu about-more-item)))))

     ;; destroy シグナルをラムダ関数と結びつける
     (gobject:g-signal-connect window "destroy"
                               (lambda (widget)
                                 (declare (ignore widget))
                                 (gtk:leave-gtk-main)))

     ;; ボックスをウィンドウに入れる
     (gtk:gtk-container-add window vbox)

     ;; ウィジェット表示
     (gtk:gtk-widget-show-all window))))
