;;; webkit2.web-resource.lisp --- bindings for WebKitWebResource

;; This file is part of cl-webkit.
;;
;; cl-webkit is free software; you can redistribute it and/or modify
;; it under the terms of the MIT license.
;; See `COPYING' in the source distribution for details.

;;; Code:

(in-package #:webkit2)

(define-webkit-class "WebKitWebResource" ()
  (("response" "WebKitURIResponse")
   ("uri" "gchararray")))

(defcfun "webkit_web_resource_get_data" :void
  (webkit-web-resource (g-object webkit-web-resource))
  (cancellable :pointer)
  (callback g-async-ready-callback)
  (user-data :pointer))
(export 'webkit-web-resource-get-data)

(defcfun "webkit_web_resource_get_data_finish" :void
  (webkit-web-resource (g-object webkit-web-resource))
  (result g-async-result)
  (length :long)
  (g-error :pointer))
(export 'webkit-web-resource-get-data-finish)

(defun webkit-web-view-get-html (web-view call-back)
  "Get the HTML of the web-view."
  (incf callback-counter)
  (push (make-callback :id callback-counter
                       :web-view web-view
                       :function call-back)
        callbacks)
  (let ((main-resource (webkit-web-view-get-main-resource web-view)))
    (when main-resource
      (webkit-web-resource-get-data
       main-resource
       (cffi:null-pointer)
       (cffi:callback web-resource-data-retrieved)
       (cffi:make-pointer callback-counter)))))
(export 'webkit-web-view-get-html)

(cffi:defcallback web-resource-data-retrieved :void
    ((source-object :pointer)
     (result :pointer)
     (user-data :pointer))
  (declare (ignore source-object result user-data))
  (print "Callback Invoked."))
