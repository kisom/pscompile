;;;; pscompile.asd

(asdf:defsystem #:pscompile
  :serial t
  :description "Parenscript to JavaScript compiler."
  :author "Kyle Isom <coder@kyleisom.net>"
  :license "ISC license"
  :depends-on (#:parenscript
               #:cl-ppcre
               #:getopt)
  :components ((:file "package")
               (:file "pscompile")))
