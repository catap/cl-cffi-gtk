;;;; gtk-example.asd

(asdf:defsystem :gtk-example
  :author "Dieter Kaiser"
  :license "LLGPL"
  :serial t
  :depends-on (:cl-cffi-gtk :split-sequence)
  :components ((:file "gtk-example")
               (:file "application-inhibit")
               (:file "application-simple")
               (:file "bloat-pad")
               (:file "clipboard")
               (:file "combo-box")
               (:file "combo-box-text")
               (:file "custom-window")
               (:file "dialog")
               (:file "drag-and-drop")
               (:file "drag-and-drop-simple")
               (:file "drawing-area")
               (:file "event-handler")
               (:file "grab")
               (:file "grid-packing")
               (:file "image-button-press")
               (:file "image-menu-item")
               (:file "info-bar")
               (:file "level-bar")
;               (:file "list-store")
               (:file "menu-builder")
               (:file "message-dialog-new")
               (:file "page-setup-dialog")
               (:file "pointer-device")
               (:file "print-dialog")
               (:file "print-operation")
               (:file "radio-button")
               (:file "scrolled-window")
               (:file "show-about-dialog")
               (:file "tool-palette")
               (:file "widget-pointer")
              ))

;;; 2021-3-26
