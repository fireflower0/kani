(defpackage #:kani/skeleton
  (:use #:cl)
  (:import-from #:cl-project)
  (:export #:make-project))
(in-package #:kani/skeleton)

(defvar *skeleton-directory*
  (asdf:system-relative-pathname :kani #P"skeleton/project/"))

(defun make-project (path
                     &rest params
                     &key description author license &allow-other-keys)
  (declare (ignore description author license))
  (let ((cl-project:*skeleton-directory* *skeleton-directory*))
    (apply #'cl-project:make-project path params)))
