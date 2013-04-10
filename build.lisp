#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(ql:quickload :pscompile)
(format t "[+] compiling to 'pscompile'...~%")
(sb-ext:save-lisp-and-die "pscompile" :executable t :toplevel #'pscompile:main)
