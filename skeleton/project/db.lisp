(uiop:define-package #:<% @var name %>/db
  (:use #:cl
        #:db-test/config)
  (:import-from #:mito)
  (:export #:db
           #:with-connection))
(in-package #:<% @var name %>/db)

(defun conn-settings (&optional (db :maindb))
  (cdr (assoc db (config :databases))))

(defun db (&optional (db :maindb))
  (apply #'mito:connect-toplevel (conn-settings db)))

(defmacro with-connection (conn &body body)
  `(let ((mito:*connection* ,conn))
     ,@body))
