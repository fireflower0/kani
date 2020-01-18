(uiop:define-package #:<% @var name %>/config
  (:use #:cl
        #:envy))
(in-package #:<% @var name %>/config)

(setf (config-env-var) "APP_ENV")

(defparameter *app-root*
  (asdf:system-source-directory :<% @var name %>))

(defparameter *db-name*
  (merge-pathnames
   (format nil "db/~A.db" "<% @var name %>")
   *app-root*))

(defconfig :common
    `(:databases ((:maindb :sqlite3 :database-name ,*db-name*))))
