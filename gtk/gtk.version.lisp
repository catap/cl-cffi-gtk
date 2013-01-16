;;; ----------------------------------------------------------------------------
;;; gtk.version.lisp
;;;
;;; This file contains code from a fork of cl-gtk2.
;;; See http://common-lisp.net/project/cl-gtk2/
;;;
;;; The documentation has been copied from the GTK+ 3 Reference Manual
;;; Version 3.4.3. See http://www.gtk.org.
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
;;;
;;; Version Information
;;;
;;; Variables and functions to check the GTK+ version
;;;
;;; Synopsis
;;;
;;;     gtk_get_major_version
;;;     gtk_get_minor_version
;;;     gtk_get_micro_version
;;;     gtk_get_binary_age
;;;     gtk_get_interface_age
;;;     gtk_check_version
;;;
;;;     GTK_MAJOR_VERSION
;;;     GTK_MINOR_VERSION
;;;     GTK_MICRO_VERSION
;;;     GTK_BINARY_AGE
;;;     GTK_INTERFACE_AGE
;;;     GTK_CHECK_VERSION
;;;
;;; Description
;;;
;;; GTK+ provides version information, primarily useful in configure checks for
;;; builds that have a configure script. Applications will not typically use the
;;; features described here.
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; gtk_get_major_version ()
;;;
;;; guint gtk_get_major_version (void);
;;;
;;; Returns the major version number of the GTK+ library. (e.g. in GTK+ version
;;; 3.1.5 this is 3.)
;;;
;;; This function is in the library, so it represents the GTK+ library your code
;;; is running against. Contrast with the GTK_MAJOR_VERSION macro, which
;;; represents the major version of the GTK+ headers you have included when
;;; compiling your code.
;;;
;;; Returns :
;;;     the major version number of the GTK+ library
;;;
;;; Since 3.0
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_get_major_version" gtk-get-major-version) :int)

(export 'gtk-get-major-version)

;;; ----------------------------------------------------------------------------
;;; gtk_get_minor_version ()
;;;
;;; guint gtk_get_minor_version (void);
;;;
;;; Returns the minor version number of the GTK+ library. (e.g. in GTK+ version
;;; 3.1.5 this is 1.)
;;;
;;; This function is in the library, so it represents the GTK+ library your code
;;; is are running against. Contrast with the GTK_MINOR_VERSION macro, which
;;; represents the minor version of the GTK+ headers you have included when
;;; compiling your code.
;;;
;;; Returns :
;;;     the minor version number of the GTK+ library
;;;
;;; Since 3.0
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_get_minor_version" gtk-get-minor-version) :int)

(export 'gtk-get-minor-version)

;;; ----------------------------------------------------------------------------
;;; gtk_get_micro_version ()
;;;
;;; guint gtk_get_micro_version (void);
;;;
;;; Returns the micro version number of the GTK+ library. (e.g. in GTK+ version
;;; 3.1.5 this is 5.)
;;;
;;; This function is in the library, so it represents the GTK+ library your code
;;; is are running against. Contrast with the GTK_MICRO_VERSION macro, which
;;; represents the micro version of the GTK+ headers you have included when
;;; compiling your code.
;;;
;;; Returns :
;;;     the micro version number of the GTK+ library
;;;
;;; Since 3.0
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_get_micro_version" gtk-get-micro-version) :int)

(export 'gtk-get-micro-version)

;;; ----------------------------------------------------------------------------
;;; gtk_get_binary_age ()
;;;
;;; guint gtk_get_binary_age (void);
;;;
;;; Returns the binary age as passed to libtool when building the GTK+ library
;;; the process is running against. If libtool means nothing to you, don't worry
;;; about it.
;;;
;;; Returns :
;;;     the binary age of the GTK+ library
;;;
;;; Since 3.0
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_get_binary_age" gtk-get-binary-age) :int)

(export 'gtk-get-binary-age)

;;; ----------------------------------------------------------------------------
;;; gtk_get_interface_age ()
;;;
;;; guint gtk_get_interface_age (void);
;;;
;;; Returns the interface age as passed to libtool when building the GTK+
;;; library the process is running against. If libtool means nothing to you,
;;; don't worry about it.
;;;
;;; Returns :
;;;     the interface age of the GTK+ library
;;;
;;; Since 3.0
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_get_interface_age" gtk-get-interface-age) :int)

(export 'gtk-get-interface-age)

;;; ----------------------------------------------------------------------------
;;; gtk_check_version ()
;;;
;;; const gchar * gtk_check_version (guint required_major,
;;;                                  guint required_minor,
;;;                                  guint required_micro);
;;;
;;; Checks that the GTK+ library in use is compatible with the given version.
;;; Generally you would pass in the constants GTK_MAJOR_VERSION,
;;; GTK_MINOR_VERSION, GTK_MICRO_VERSION as the three arguments to this
;;; function; that produces a check that the library in use is compatible with
;;; the version of GTK+ the application or module was compiled against.
;;;
;;; Compatibility is defined by two things: first the version of the running
;;; library is newer than the version
;;; required_major.required_minor.required_micro. Second the running library
;;; must be binary compatible with the version
;;; required_major.required_minor.required_micro (same major version.)
;;;
;;; This function is primarily for GTK+ modules; the module can call this
;;; function to check that it wasn't loaded into an incompatible version of
;;; GTK+. However, such a check isn't completely reliable, since the module may
;;; be linked against an old version of GTK+ and calling the old version of
;;; gtk_check_version(), but still get loaded into an application using a newer
;;; version of GTK+.
;;;
;;; required_major :
;;;     the required major version
;;;
;;; required_minor :
;;;     the required minor version
;;;
;;; required_micro :
;;;     the required micro version
;;;
;;; Returns :
;;;     NULL if the GTK+ library is compatible with the given version, or a
;;;     string describing the version mismatch. The returned string is owned by
;;;     GTK+ and should not be modified or freed.
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_check_version" gtk-check-version) :string
  (required-major :uint)
  (required-minor :uint)
  (required-micro :uint))

;;; ----------------------------------------------------------------------------
;;; GTK_MAJOR_VERSION
;;;
;;; #define GTK_MAJOR_VERSION (3)
;;;
;;; Like gtk_get_major_version(), but from the headers used at application
;;; compile time, rather than from the library linked against at application run
;;; time.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; GTK_MINOR_VERSION
;;;
;;; #define GTK_MINOR_VERSION (4)
;;;
;;; Like gtk_get_minor_version(), but from the headers used at application
;;; compile time, rather than from the library linked against at application run
;;; time.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; GTK_MICRO_VERSION
;;;
;;; #define GTK_MICRO_VERSION (3)
;;;
;;; Like gtk_get_micro_version(), but from the headers used at application
;;; compile time, rather than from the library linked against at application run
;;; time.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; GTK_BINARY_AGE
;;;
;;; #define GTK_BINARY_AGE    (403)
;;;
;;; Like gtk_get_binary_age(), but from the headers used at application compile
;;; time, rather than from the library linked against at application run time.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; GTK_INTERFACE_AGE
;;;
;;; #define GTK_INTERFACE_AGE (3)
;;;
;;; Like gtk_get_interface_age(), but from the headers used at application
;;; compile time, rather than from the library linked against at application run
;;; time.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------
;;; GTK_CHECK_VERSION()
;;;
;;; #define GTK_CHECK_VERSION(major,minor,micro)
;;;
;;; major :
;;;     major version (e.g. 1 for version 1.2.5)
;;;
;;; minor :
;;;     minor version (e.g. 2 for version 1.2.5)
;;;
;;; micro :
;;;     micro version (e.g. 5 for version 1.2.5)
;;;
;;; Returns :
;;;     TRUE if the version of the GTK+ header files is the same as or newer
;;;     than the passed-in version.
;;; ----------------------------------------------------------------------------

;;; ----------------------------------------------------------------------------

;;; Lisp functions

(defun cl-cffi-gtk-build-info ()
  (format t "~%cl-cffi-gtk version: ~a~%" *cl-cffi-gtk-version*)
  (format t "cl-cffi-gtk build date: ~a:~a ~a/~a/~a~%"
          (third cl-user:*cl-cffi-gtk-build-time*)
          (second cl-user:*cl-cffi-gtk-build-time*)
          (fifth cl-user:*cl-cffi-gtk-build-time*)
          (fourth cl-user:*cl-cffi-gtk-build-time*)
          (sixth cl-user:*cl-cffi-gtk-build-time*))
  (format t "GTK+ version: ~a.~a.~a~%"
          (gtk-get-major-version)
          (gtk-get-minor-version)
          (gtk-get-micro-version))
  (format t "GLIB version: ~a.~a.~a~%"
          glib-major-version
          glib-minor-version
          glib-micro-version)
  (format t "GDK-Pixbuf version: ~a~%" *gdk-pixbuf-version*)
  (format t "Pango version: ~a~%" (pango-version-string))
  (format t "Cairo version: ~a~%" (cairo-version-string))
  (format t "Machine type: ~a~%" (machine-type))
  (format t "Machine version: ~a~%" (machine-version))
  (format t "Software type: ~a~%" (software-type))
  (format t "Software version: ~A~%" (software-version))
  (format t "Lisp implementation type: ~a~%" (lisp-implementation-type))
  (format t "Lisp implementation version: ~a~%~%" (lisp-implementation-version))
  nil)

;;; ----------------------------------------------------------------------------

(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew :gtk *features*))

(glib::push-library-version-features gtk
                                    (gtk-get-major-version)
                                    (gtk-get-minor-version)
                                    3 0
                                    3 2
                                    3 4)

(glib::require-library-version "GTK+" 3 4
                              (gtk-get-major-version)
                              (gtk-get-minor-version))

;;; --- End of file gtk.version.lisp -------------------------------------------
