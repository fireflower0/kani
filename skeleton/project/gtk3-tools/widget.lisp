(uiop:define-package #:<% @var name %>/gtk3-tools/widget
  (:use #:cl)
  (:export #:create-window
           #:create-button))
(in-package #:<% @var name %>/gtk3-tools/widget)

(defun create-window (&key
                        type
                        ;; accept-focus
                        ;; application
                        ;; attached-to
                        ;; decorated
                        default-height
                        default-width
                        ;; deletable
                        ;; destroy-with-parent
                        ;; focus-on-map
                        ;; focus-visible
                        ;; gravity
                        ;; has-resize-grip
                        ;; has-toplevel-focus
                        ;; hide-titlebar-when-maximized
                        ;; icon
                        ;; icon-name
                        ;; is-active
                        ;; is-maximized
                        ;; mnemonics-visible
                        ;; modal
                        ;; opacity
                        ;; resizable
                        ;; resize-grip-visible
                        ;; role
                        ;; screen
                        ;; skip-pager-hint
                        ;; skip-taskbar-hint
                        ;; startup-id
                        title
                        ;; transient-for
                        ;; type-hint
                        ;; urgency-hint
                        ;; window-position
                        )
  (make-instance 'gtk:gtk-window
                 :type type
                 ;; :accept-focus accept-focus
                 ;; :application application
                 ;; :attached-to attached-to
                 ;; :decorated decorated
                 :default-height default-height
                 :default-width default-width
                 ;; :deletable deletable
                 ;; :destroy-with-parent destroy-with-parent
                 ;; :focus-on-map focus-on-map
                 ;; :focus-visible focus-visible
                 ;; :gravity gravity
                 ;; :has-resize-grip has-resize-grip
                 ;; :has-toplevel-focus has-toplevel-focus
                 ;; :hide-titlebar-when-maximized hide-titlebar-when-maximized
                 ;; :icon icon
                 ;; :icon-name icon-name
                 ;; :is-active is-active
                 ;; :is-maximized is-maximized
                 ;; :mnemonics-visible mnemonics-visible
                 ;; :modal modal
                 ;; :opacity opacity
                 ;; :resizable resizable
                 ;; :resize-grip-visible resize-grip-visible
                 ;; :role role
                 ;; :screen screen
                 ;; :skip-pager-hint skip-pager-hint
                 ;; :skip-taskbar-hint skip-taskbar-hint
                 ;; :startup-id startup-id
                 :title title
                 ;; :transient-for transient-for
                 ;; :type-hint type-hint
                 ;; :urgency-hint urgency-hint
                 ;; :window-position window-position
                 ))

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
