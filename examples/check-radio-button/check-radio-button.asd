(defsystem "check-radio-button"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("cl-cffi-gtk"
               "check-radio-button/boot"
               "cl-syntax-annot"))

(register-system-packages "check-radio-button/boot" '(#:check-radio-button))
