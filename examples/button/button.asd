(defsystem "button"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("cl-cffi-gtk"
               "button/boot"
               "cl-syntax-annot"))

(register-system-packages "button/boot" '(#:button))
