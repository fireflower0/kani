(defsystem "packing-boxes"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("cl-cffi-gtk"
               "packing-boxes/boot"
               "cl-syntax-annot"))

(register-system-packages "packing-boxes/boot" '(#:packing-boxes))
