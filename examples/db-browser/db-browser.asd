(defsystem "db-browser"
  :class :package-inferred-system
  :version "0.1.0"
  :author "fireflower0"
  :license "MIT"
  :description "SQLite3 DB Browser"
  :depends-on ("envy"
               "mito"
               "sxql"
               "cl-cffi-gtk"
               "cl-syntax-annot"
               "db-browser/boot"))

(register-system-packages "db-browser/boot" '(#:db-browser))
