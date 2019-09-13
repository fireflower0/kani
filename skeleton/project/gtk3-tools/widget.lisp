(uiop:define-package #:<% @var name %>/gtk3-tools/widget
  (:use #:cl)
  (:export #:create-window
           #:create-button))
(in-package #:<% @var name %>/gtk3-tools/widget)

(defun create-window (&key
                        (type :toplevel)
                        (accept-focus t)
                        (application nil)
                        (attached-to nil)
                        (decorated t)
                        (default-height -1)
                        (default-width -1)
                        (deletable t)
                        (destroy-with-parent nil)
                        (focus-on-map t)
                        (focus-visible t)
                        (gravity :north-west)
                        (has-resize-grip nil)
                        (has-toplevel-focus nil)
                        (hide-titlebar-when-maximized nil)
                        (icon nil)
                        (icon-name "")
                        (is-active nil)
                        (is-maximized nil)
                        (mnemonics-visible t)
                        (modal nil)
                        (opacity 1)
                        (resizable t)
                        (resize-grip-visible nil)
                        (role "")
                        (screen nil)
                        (skip-pager-hint nil)
                        (skip-taskbar-hint nil)
                        (startup-id "")
                        (title "")
                        (transient-for nil)
                        (type-hint :normal)
                        (urgency-hint nil)
                        (window-position :none))
  (make-instance 'gtk:gtk-window
                 :type type
                 :accept-focus accept-focus
                 :application application
                 :attached-to attached-to
                 :decorated decorated
                 :default-height default-height
                 :default-width default-width
                 :deletable deletable
                 :destroy-with-parent destroy-with-parent
                 :focus-on-map focus-on-map
                 :focus-visible focus-visible
                 :gravity gravity
                 :has-resize-grip has-resize-grip
                 :has-toplevel-focus has-toplevel-focus
                 :hide-titlebar-when-maximized hide-titlebar-when-maximized
                 :icon icon
                 :icon-name icon-name
                 :is-active is-active
                 :is-maximized is-maximized
                 :mnemonics-visible mnemonics-visible
                 :modal modal
                 :opacity opacity
                 :resizable resizable
                 :resize-grip-visible resize-grip-visible
                 :role role
                 :screen screen
                 :skip-pager-hint skip-pager-hint
                 :skip-taskbar-hint skip-taskbar-hint
                 :startup-id startup-id
                 :title title
                 :transient-for transient-for
                 :type-hint type-hint
                 :urgency-hint urgency-hint
                 :window-position window-position))

(defun create-button (&key
                        ;; always-show-image
                        ;; focus-on-click
                        ;; image
                        ;; image-position
                        label
                        ;; relief
                        ;; use-stock
                        ;; use-underline
                        ;; xalign
                        ;; yalign
                        )
  (make-instance 'gtk:gtk-button
                 ;; :always-show-image always-show-image 
                 ;; :focus-on-click focus-on-click
                 ;; :image image
                 ;; :image-position image-position
                 :label label
                 ;; :relief relief
                 ;; :use-stock use-stock
                 ;; :use-underline use-underline
                 ;; :xalign xalign
                 ;; :yalign yalign
                 ))
