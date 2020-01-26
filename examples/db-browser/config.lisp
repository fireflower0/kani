(uiop:define-package #:db-browser/config
  (:use #:cl)
  (:import-from :envy
                :config-env-var
                :defconfig)
  (:export :config))
(in-package #:db-browser/config)

(setf (config-env-var) "APP_ENV")

;;;
;; File & Directory Path

(defparameter *app-root*
  (asdf:system-source-directory :db-browser))

;;;
;; DB Config

(defparameter *db-name*
  (merge-pathnames
   (format nil "db/~A.db" "db-browser")
   *app-root*))

(defconfig :common
    `(:databases ((:maindb :sqlite3 :database-name ,*db-name*))))

;;;
;; Config Function

(defun config (&optional key)
  (envy:config #.(package-name *package*) key))
