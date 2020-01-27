(defpackage #:db-browser/models
  (:use #:cl
        #:db-browser/config
        #:db-browser/db)
  (:import-from #:mito)
  (:export #:pg-lang
           #:pg-lang-name
           #:pg-lang-year
           #:create-pg-lang-table
           #:add-pg-lang-column
           #:delete-pg-lang-column))
(in-package #:db-browser/models)

(defclass pg-lang ()
  ((name :col-type (:varchar 128)
         :initarg  :name
         :initform ""
         :accessor pg-lang-name)
   (year :col-type :integer
         :initarg  :year
         :initform 0
         :accessor pg-lang-year))
  (:metaclass mito:dao-table-class))

(defun create-pg-lang-table ()
  (with-connection (db)
    (mito:execute-sql
     (first
      (mito:table-definition 'pg-lang :if-not-exists t)))))

(defun add-pg-lang-column (name year)
  (with-connection (db)
    (mito:create-dao 'pg-lang :name name :year year)))

(defun delete-pg-lang-column (id)
  (with-connection (db)
    (mito:delete-by-values 'pg-lang :id id)))
