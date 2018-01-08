;;; webkit2.package.lisp --- package definition

;; This file is part of cl-webkit.
;;
;; cl-webkit is free software; you can redistribute it and/or modify
;; it under the terms of the MIT license.
;; See `COPYING' in the source distribution for details.

;;; Code:

(in-package :cl-user)

(defpackage #:cl-webkit2
  (:nicknames :webkit2 :webkit)
  (:use :cl :cffi :gtk :gobject))

(defpackage #:jscore
  (:use :cl :cffi))
