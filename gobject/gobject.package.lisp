;;; ----------------------------------------------------------------------------
;;; gobject.package.lisp
;;;
;;; This file contains code from a fork of cl-gtk2.
;;; See http://common-lisp.net/project/cl-gtk2/
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2012 Dieter Kaiser
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Lesser General Public License for Lisp
;;; as published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version and with a preamble to
;;; the GNU Lesser General Public License that clarifies the terms for use
;;; with Lisp programs and is referred as the LLGPL.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.
;;;
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this program and the preamble to the Gnu Lesser
;;; General Public License.  If not, see <http://www.gnu.org/licenses/>
;;; and <http://opensource.franz.com/preamble.html>.
;;; ----------------------------------------------------------------------------

(declaim #+sbcl(sb-ext:muffle-conditions style-warning))

(defpackage :gobject
  (:nicknames :g)
  (:use :c2cl :glib :cffi :tg :bordeaux-threads :iter :closer-mop)
  (:export
    #:*lisp-name-exceptions*

    #:using*

    #:parse-g-value
    #:parse-g-param-spec
    #:set-g-value

    #:gtype
    #:gtype-id
    #:gtype-from-id
    #:gtype-name
    #:gtype-from-name

    #:create-fn-ref

    #:param-spec-name
    #:param-spec-readable
    #:param-spec-type
    #:param-spec-writable

    #:boxed-related-symbols
    #:copy-boxed-slots-to-foreign
    #:define-cb-methods
    #:define-g-boxed-cstruct
    #:define-g-boxed-opaque
    #:define-g-boxed-variant-cstruct
    #:define-g-enum
    #:define-g-flags
    #:define-g-interface
    #:define-g-object-class
    #:define-boxed-opaque-accessor
    #:define-vtable
    #:get-g-type-definition
    #:register-object-type
    #:register-object-type-implementation
    #:registered-object-type-by-name
    #:with-foreign-boxed-array

    ;; Symbols from gobject.signals.lisp
    #:list-signals
    #:signal-info
        ))

;;; --- End of file gobject.package.lisp ---------------------------------------
