;;;; pscompile.lisp

(in-package #:pscompile)

;;; "pscompile" goes here. Hacks and glory await!

(defun main ()
  #+:SBCL
  (progn
    (sbcl-main)
    (sb-ext:exit :code 0))
  (format t "[!] implementation not supported.~%"))

(defun sbcl-main ()
  (let ((argv (subseq sb-ext:*posix-argv* 1)))
    (dolist (target argv)
      (compile-ps-file target))))

(defun compile-ps (filename)
  (let ((javascript (ps:ps-compile-file filename))
        (js-filename (ppcre:regex-replace "\\.[^.]+$" filename ".js")))
    (when (or (probe-file (make-pathname :name js-filename))
              (probe-file (make-pathname :directory '(:absolute "") :name js-filename)))
      (delete-file js-filename))
    (with-open-file (in filename
                        :direction :input)
      (with-standard-io-syntax
        (do ((form (read in) (read in nil :eof)))
            ((eql :eof form) nil)
          (append-js-form form js-filename))))
    (format t "[+] ~A -> ~A complete~%" filename js-filename)))

(defun compile-ps-file (filename)
  (handler-case
      (compile-ps filename)
    (error (e) (report-error e filename))))

(defun report-error (e filename)
  (format t "~&    ~A~%" e)
  (format t "[!] error compiling ~A~%" filename))

(defun append-js-form (form js-filename)
  (with-open-file (out js-filename
                      :direction :output
                      :if-does-not-exist :create
                      :if-exists :append)
    (with-standard-io-syntax
      (princ (ps:ps* form) out)
      (format out "~%"))))
