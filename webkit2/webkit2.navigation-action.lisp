;;; webkit2.navigation-action.lisp --- bindings for WebKitNavigationAction

;; This file is part of cl-webkit.
;;
;; cl-webkit is free software; you can redistribute it and/or modify
;; it under the terms of the MIT license.
;; See `COPYING' in the source distribution for details.

;;; Code:

(in-package #:webkit2)

(define-webkit-class "WebKitNavigationAction" () ())

(defcfun "webkit_navigation_action_get_navigation_type" webkit-navigation-type
  (navigation (g-object webkit-navigation-action)))
(export 'webkit-navigation-action-get-navigation-type)

(defcfun "webkit_navigation_action_get_mouse_button" :int
  (navigation (g-object webkit-navigation-action)))
(export 'webkit-navigation-action-get-mouse-button)

(defcfun "webkit_navigation_action_get_modifiers" :int ;; XXX GdkModifierType bitmask
  (navigation (g-object webkit-navigation-action)))
(export 'webkit-navigation-action-get-modifiers)

(defcfun "webkit_navigation_action_get_request" (g-object webkit-uri-request)
  (navigation (g-object webkit-navigation-action)))
(export 'webkit-navigation-action-get-request)

(defcfun "webkit_navigation_action_is_user_gesture" :boolean
  (navigation (g-object webkit-navigation-action)))
(export 'webkit-navigation-action-is-user-gesture)
