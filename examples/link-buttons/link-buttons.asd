(defsystem "link-buttons"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("cl-cffi-gtk"
               "link-buttons/boot"
               "cl-syntax-annot"))

(register-system-packages "link-buttons/boot" '(#:link-buttons))
