(defsystem "creating-menus-by-hand"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("cl-cffi-gtk"
               "creating-menus-by-hand/boot"
               "cl-syntax-annot"))

(register-system-packages "creating-menus-by-hand/boot" '(#:creating-menus-by-hand))
