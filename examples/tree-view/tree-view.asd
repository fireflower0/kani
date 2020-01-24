(defsystem "tree-view"
  :class :package-inferred-system
  :version "0.1.0"
  :author "fireflower0"
  :license "MIT"
  :description ""
  :depends-on ("envy"
               "mito"
               "sxql"
               "cl-cffi-gtk"
               "cl-syntax-annot"
               "tree-view/boot"))

(register-system-packages "tree-view/boot" '(#:tree-view))
