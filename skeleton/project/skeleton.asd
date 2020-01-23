(defsystem "<% @var name %>"
  :class :package-inferred-system
  :version "0.1.0"
  :author "<% @var author %>"
  :license "<% @var license %>"
  :description "<% @var description %>"
  :depends-on ("envy"
               "mito"
               "sxql"
               "cl-cffi-gtk"
               "cl-syntax-annot"
               "<% @var name %>/boot"))

(register-system-packages "<% @var name %>/boot" '(#:<% @var name %>))
