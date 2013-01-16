;;; ----------------------------------------------------------------------------
;;; atdoc-gtk.package.lisp
;;;
;;; Documentation strings for the library GTK.
;;;
;;; The documentation of this file has been copied from the
;;; GLib 2.32.3 Reference Manual. See http://www.gtk.org.
;;;
;;; Copyright (C) 2012 Dieter Kaiser
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

(in-package :gtk)

(setf (documentation (find-package :gtk) t)
 "GTK+ is a library for creating graphical user interfaces. It works on many
  UNIX-like platforms, Windows, and OS X. GTK+ is released under the GNU Library
  General Public License (GNU LGPL), which allows for flexible licensing of
  client applications. GTK+ has a C-based object-oriented architecture that
  allows for maximum flexibility. Bindings for many other languages have been
  written, including C++, Objective-C, Guile/Scheme, Perl, Python, TOM, Ada95,
  Free Pascal, and Eiffel.
  
  This is the documention of a Lisp binding to GTK+.
  @begin[GTK+ Core Reference]{section}
    @begin[Main loop and Events]{subsection}
      Library initialization, main event loop, and events.

      Before using GTK+, you need to initialize it; initialization connects to
      the window system display, and parses some standard command line
      arguments. The gtk_init() macro initializes GTK+. gtk_init() exits the
      application if errors occur; to avoid this, use gtk_init_check().
      gtk_init_check() allows you to recover from a failed GTK+ initialization -
      you might start up your application in text mode instead.

      Like all GUI toolkits, GTK+ uses an event-driven programming model. When
      the user is doing nothing, GTK+ sits in the main loop and waits for input.
      If the user performs some action - say, a mouse click - then the main loop
      \"wakes up\" and delivers an event to GTK+. GTK+ forwards the event to one
      or more widgets.

      When widgets receive an event, they frequently emit one or more signals.
      Signals notify your program that \"something interesting happened\" by
      invoking functions you've connected to the signal with g_signal_connect().
      Functions connected to a signal are often termed callbacks.

      When your callbacks are invoked, you would typically take some action -
      for example, when an Open button is clicked you might display a
      GtkFileChooserDialog. After a callback finishes, GTK+ will return to the
      main loop and await more user input.

      Example 6. Typical main() function for a GTK+ application
      @begin{pre}
 int
 main (int argc, char **argv)
 {
   /* Initialize i18n support */
   gtk_set_locale ();

   /* Initialize the widget set */
   gtk_init (&argc, &argv);

   /* Create the main window */
   mainwin = gtk_window_new (GTK_WINDOW_TOPLEVEL);

   /* Set up our GUI elements */
   ...

   /* Show the application window */
   gtk_widget_show_all (mainwin);

   /* Enter the main event loop, and wait for user interaction */
   gtk_main ();

   /* The user lost interest */
  return 0;
 @}
      @end{pre}
      It's OK to use the GLib main loop directly instead of gtk_main(), though
      it involves slightly more typing. See GMainLoop in the GLib documentation.

      @about-function{gtk-disable-setlocale}
      @about-function{gtk-get-default-language}
      @about-function{gtk-parse-args}
      @about-function{gtk-init}
      @about-function{gtk-init-check}
      @about-function{gtk-init-with-args}
      @about-function{gtk-get-option-group}
      @about-function{gtk-events-pending}
      @about-function{gtk-main}
      @about-function{gtk-main-level}
      @about-function{gtk-main-quit}
      @about-function{gtk-main-iteration}
      @about-function{gtk-main-iteration-do}
      @about-function{gtk-main-do-event}
      @about-function{gtk-true}
      @about-function{gtk-false}
      @about-function{gtk-grab-add}
      @about-function{gtk-grab-get-current}
      @about-function{gtk-grab-remove}
      @about-function{gtk-device-grab-add}
      @about-function{gtk-device-grab-remove}
      @about-function{gtk-priority-resize}
      @about-function{gtk-key-snooper-install}
      @about-function{gtk-key-snooper-remove}
      @about-function{gtk-get-current-event}
      @about-function{gtk-get-current-event-time}
      @about-function{gtk-get-current-event-state}
      @about-function{gtk-get-current-event-device}
      @about-function{gtk-get-event-widget}
      @about-function{gtk-propagate-event}
    @end{subsection}
    @begin[Version Information]{subsection}
    @end{subsection}
    @begin[Accelerator Groups]{subsection}
      Groups of global keyboard accelerators for an entire GtkWindow.

      @about-class{gtk-accel-group}
      @about-function{gtk-accel-group-new}
      @about-function{gtk-accel-group-connect}
      @about-function{gtk-accel-group-connect-by-path}
      @about-function{gtk-accel-group-disconnect}
      @about-function{gtk-accel-group-disconnect-key}
      @about-function{gtk-accel-group-query}
      @about-function{gtk-accel-group-activate}
      @about-function{gtk-accel-group-lock}
      @about-function{gtk-accel-group-unlock}
      @about-function{gtk-accel-group-get-is-locked}
      @about-function{gtk-accel-group-from-accel-closure}
      @about-function{gtk-accel-group-get-modifier-mask}
      @about-function{gtk-accel-group-activate}
      @about-function{gtk-accel-group-from-object}
      @about-function{gtk-accel-group-find}
      @about-symbol{gtk-accel-key}
      @about-function[gtk-accelerator-valid}
      @about-function[gtk-accelerator-parse}
      @about-function[gtk-accelerator-name}
      @about-function[gtk-accelerator-get-label}
      @about-function[gtk-accelerator-parse-with-keycode}
      @about-function[gtk-accelerator-name_with-keycode}
      @about-function[gtk-accelerator-get-label-with-keycode}
      @about-function[gtk-accelerator-set-default-mod-mask}
      @about-function[gtk-accelerator-get-default-mod-mask}
    @end{subsection}
    @begin[Accelerator Maps]{subsection}
      Loadable keyboard accelerator specifications.

      @about{gtk-accel-map}
      @about-function{gtk-accel-map-add-entry}
      @about-function{gtk-accel-map-lookup-entry}
      @about-function{gtk-accel-map-change-entry}
      @about-function{gtk-accel-map-load}
      @about-function{gtk-accel-map-save}
      @about-function{gtk-accel-map-foreach}
      @about-function{gtk-accel-map-load-fd}
      @about-function{gtk-accel-map-save-fd}
      @about-function{gtk-accel-map-load-scanner}
      @about-function{gtk-accel-map-add-filter}
      @about-function{gtk-accel-map-foreach-unfiltered}
      @about-function{gtk-accel-map-get}
      @about-function{gtk-accel-map-lock-path}
      @about-function{gtk-accel-map-unlock-path}
    @end{subsection}
    @begin[GtkClipboard]{subsection}
    @end{subsection}
    @begin[Drag and drop handling]{subsection}
    @end{subsection}
    @begin[Stock items]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkSettings]{subsection}
    @end{subsection}
    @begin[Bindings]{subsection}
      not implemented
    @end{subsection}
    @begin[Standard Enumerations]{subsection}
      Standard Enumerations

      @about-symbol{gtk-accel-flags}
      @about-symbol{gtk-arrow-placement}
      @about-symbol{gtk-arrow-type}
      @about-symbol{GtkAttachOptions}
      @about-symbol{GtkButtonBoxStyle}
      @about-symbol{GtkCornerType}
      @about-symbol{GtkDeleteType}
      @about-symbol{GtkDirectionType}
      @about-symbol{GtkExpanderStyle}
      @about-symbol{GtkIMPreeditStyle}
      @about-symbol{GtkIMStatusStyle}
      @about-symbol{GtkJustification}
      @about-symbol{GtkMovementStep}
      @about-symbol{GtkOrientation}
      @about-symbol{GtkPackType}
      @about-symbol{GtkPathPriorityType}
      @about-symbol{GtkPathType}
      @about-symbol{GtkPolicyType}
      @about-symbol{gtk-position-type}
      @about-symbol{GtkReliefStyle}
      @about-symbol{GtkResizeMode}
      @about-symbol{GtkScrollStep}
      @about-symbol{GtkScrollType}
      @about-symbol{GtkSelectionMode}
      @about-symbol{GtkShadowType}
      @about-symbol{GtkStateType}
      @about-symbol{GtkStateFlags}
      @about-symbol{GtkToolbarStyle}
      @about-symbol{GtkWindowPosition}
      @about-symbol{gtk-window-type}
      @about-symbol{GtkSortType}
      @about-symbol{GtkDragResult}
      @about-symbol{GtkJunctionSides}
      @about-symbol{GtkBorderStyle}
      @about-symbol{GtkRegionFlags}
    @end{subsection}
    @begin[Selections]{subsection}
    @end{subsection}
    @begin[Testing]{subsection}
      not implemented
    @end{subsection}
    @begin[Filesystem utilities]{subsection}
      not implemented
    @end{subsection}
  @end{section}
  @begin[Theming in GTK+]{section}
    @begin[GtkStyleContext]{subsection}
    @end{subsection}
    @begin[GtkCssProvider]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkStyleProvider]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkStyleProperties]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkThemingEngine]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkWidgetPath]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkSymbolicColor]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkGradient]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkIconTheme]{subsection}
    @end{subsection}
    @begin[Themable Stock Images]{subsection}
    @end{subsection}
    @begin[GtkNumerableIcon]{subsection}
      not implemented
    @end{subsection}
    @begin[Resource Files]{subsection}
    @end{subsection}
    @begin[GtkStyle]{subsection}
    @end{subsection}
  @end{section}
  @begin[Windows]{section}
    @begin[GtkDialog]{subsection}
      Create popup windows.

      @about-class{gtk-dialog}
      @about-symbol{gtk-dialog-flags}
      @about-symbol{gtk-response-type}
      @about-function{gtk-dialog-new}
      @about-function{gtk-dialog-new-with-buttons}
      @about-function{gtk-dialog-run}
      @about-function{gtk-dialog-response}
      @about-function{gtk-dialog-add-button}
      @about-function{gtk-dialog-add-buttons}
      @about-function{gtk-dialog-add-action-widget}
      @about-function{gtk-dialog-set-default-response}
      @about-function{gtk-dialog-set-response-sensitive}
      @about-function{gtk-dialog-get-response-for-widget}
      @about-function{gtk-dialog-get-widget-for-response}
      @about-function{gtk-dialog-get-action-area}
      @about-function{gtk-dialog-get-content-area}
      @about-function{gtk-alternative-dialog-button-order}
      @about-function{gtk-dialog-set-alternative-button-order}
      @about-function{gtk-dialog-set-alternative-button-order-from-array}
    @end{subsection}
    @begin[GtkInvisible]{subsection}
    @end{subsection}
    @begin[GtkMessageDialog]{subsection}
    @end{subsection}
    @begin[GtkWindow]{subsection}
      Toplevel which can contain other widgets.
  
      @about-class{gtk-window}
      @about-function{gtk-window-new}
      @about-function{gtk-window-set-wmclass}
      @about-function{gtk-window-add-accel-group}
      @about-function{gtk-window-remove-accel-group}
      @about-function{gtk-window-activate-focus}
      @about-function{gtk-window-activate-default}
      @about-function{gtk-window-set-default-size}
      @about-function{gtk-window-set-default-geometry}
      @about-function{gtk-window-set-geometry-hints}
      @about-function{gtk-window-set-position}
      @about-function{gtk-window-list-toplevels}
      @about-function{gtk-window-add-mnemonic}
      @about-function{gtk-window-remove-mnemonic}
      @about-function{gtk-window-mnemonic-activate}
      @about-function{gtk-window-activate-key}
      @about-function{gtk-window-propagate-key-event}
      @about-function{gtk-window-get-focus}
      @about-function{gtk-window-set-focus}
      @about-function{gtk-window-get-default-widget}
      @about-function{gtk-window-set-default}
      @about-function{gtk-window-present}
      @about-function{gtk-window-present-with-time}
      @about-function{gtk-window-iconify}
      @about-function{gtk-window-deiconify}
      @about-function{gtk-window-stick}
      @about-function{gtk-window-unstick}
      @about-function{gtk-window-maximize}
      @about-function{gtk-window-unmaximize}
      @about-function{gtk-window-fullscreen}
      @about-function{gtk-window-unfullscreen}
      @about-function{gtk-window-set-keep-above}
      @about-function{gtk-window-set-keep-below}
      @about-function{gtk-window-begin-resize-drag}
      @about-function{gtk-window-begin-move-drag}
      @about-function{gtk-window-set-mnemonic-modifier}
      @about-function{gtk-window-get-default-icon-list}
      @about-function{gtk-window-get-default-icon-name}
      @about-function{gtk-window-get-default-size}
      @about-function{gtk-window-get-icon-list}
      @about-function{gtk-window-get-mnemonic-modifier}
      @about-function{gtk-window-get-size}
      @about-function{gtk-window-get-group}
      @about-function{gtk-window-has-group}
      @about-function{gtk-window-get-window-type}
      @about-function{gtk-window-move}
      @about-function{gtk-window-parse-geometry}
      @about-function{gtk-window-reshow-with-initial-size}
      @about-function{gtk-window-resize}
      @about-function{gtk-window-resize-to-geometry}
      @about-function{gtk-window-set-default-icon-list}
      @about-function{gtk-window-set-default-icon}
      @about-function{gtk-window-set-default-icon-from-file}
      @about-function{gtk-window-set-default-icon-name}
      @about-function{gtk-window-set-icon-list}
      @about-function{gtk-window-set-icon-from-file}
      @about-function{gtk-window-set-auto-startup-notification}
      @about-function{gtk-window-resize-grip-is-visible}
      @about-function{gtk-window-get-resize-grip-area}
      @about-function{gtk-window-set-has-user-ref-count}
    @end{subsection}
    @begin[GtkWindowGroup]{subsection}
    @end{subsection}
    @begin[GtkAboutDialog]{subsection}
      Display information about an application.

      @about-class{gtk-about-dialog}
      @about-symbol{gtk-license}
      @about-function{gtk-about-dialog-new}
      @about-function{gtk-about-dialog-add-credit-section}
      @about-function{gtk-show-about-dialog}
    @end{subsection}
    @begin[GtkAssistant]{subsection}
    @end{subsection}
    @begin[GtkOffscreenWindow]{subsection}
    @end{subsection}
  @end{section}
  @begin[Display Widgets]{section}
    @begin[GtkAccelLabel]{subsection}
      A label which displays an accelerator key on the right of the text.
  
      @about-class{gtk-accel-label}
      @about-function{gtk-accel-label-new}
      @about-function{gtk-accel-label-refetch}
    @end{subsection}
    @begin[GtkImage]{subsection}
    @end{subsection}
    @begin[GtkLabel]{subsection}
    @end{subsection}
    @begin[GtkProgressBar]{subsection}
    @end{subsection}
    @begin[GtkStatusbar]{subsection}
    @end{subsection}
    @begin[GtkInfoBar]{subsection}
    @end{subsection}
    @begin[GtkStatusIcon]{subsection}
    @end{subsection}
    @begin[GtkSpinner]{subsection}
    @end{subsection}
  @end{section}
  @begin[Buttons and Toggles]{section}
    @begin[GtkButton]{subsection}
    @end{subsection}
    @begin[GtkCheckButton]{subsection}
    @end{subsection}
    @begin[GtkRadioButton]{subsection}
    @end{subsection}
    @begin[GtkToggleButton]{subsection}
    @end{subsection}
    @begin[GtkLinkButton]{subsection}
    @end{subsection}
    @begin[GtkScaleButton]{subsection}
    @end{subsection}
    @begin[GtkVolumeButton]{subsection}
    @end{subsection}
    @begin[GtkSwitch]{subsection}
    @end{subsection}
    @begin[GtkLockButton]{subsection}
      not implemented
    @end{subsection}
  @end{section}
  @begin[Numeric/Text Data Entry]{section}
    @begin[GtkEntry]{subsection}
    @end{subsection}
    @begin[GtkEntryBuffer]{subsection}
    @end{subsection}
    @begin[GtkEntryCompletion]{subsection}
    @end{subsection}
    @begin[GtkScale]{subsection}
    @end{subsection}
    @begin[GtkSpinButton]{subsection}
    @end{subsection}
    @begin[GtkEditable]{subsection}
    @end{subsection}
  @end{section}
  @begin[Multiline Text Editor]{section}
    @begin[GtkTextIter]{subsection}
    @end{subsection}
    @begin[GtkTextMark]{subsection}
    @end{subsection}
    @begin[GtkTextBuffer]{subsection}
    @end{subsection}
    @begin[GtkTextTag]{subsection}
    @end{subsection}
    @begin[GtkTextTagTable]{subsection}
    @end{subsection}
    @begin[GtkTextView]{subsection}
    @end{subsection}
  @end{section}
  @begin[Tree, List and Icon Grid Widgets]{section}
    @begin[GtkTreeModel]{subsection}
    @end{subsection}
    @begin[GtkTreeSelection]{subsection}
    @end{subsection}
    @begin[GtkTreeViewColumn]{subsection}
    @end{subsection}
    @begin[GtkTreeView]{subsection}
    @end{subsection}
    @begin[GtkTreeView drag and drop]{subsection}
    @end{subsection}
    @begin[GtkCellView]{subsection}
    @end{subsection}
    @begin[GtkIconView]{subsection}
    @end{subsection}
    @begin[GtkTreeSortable]{subsection}
    @end{subsection}
    @begin[GtkTreeModelSort]{subsection}
    @end{subsection}
    @begin[GtkModelFilter]{subsection}
    @end{subsection}
    @begin[GtkCellLayout]{subsection}
    @end{subsection}
    @begin[GtkCellArea]{subsection}
    @end{subsection}
    @begin[GtkCellAreaBox]{subsection}
    @end{subsection}
    @begin[GtkcellAreaContext]{subsection}
    @end{subsection}
    @begin[GtkCellRenderer]{subsection}
    @end{subsection}
    @begin[GtkCellEditable]{subsection}
    @end{subsection}
    @begin[GtkCellRendererAccel]{subsection}
    @end{subsection}
    @begin[GtkCellRendererComo]{subsection}
    @end{subsection}    
    @begin[GtkCellRendererPixbuf]{subsection}
    @end{subsection}
    @begin[GtkCellRendererProgress]{subsection}
    @end{subsection}
    @begin[GtkCellRendererSpin]{subsection}
    @end{subsection}
    @begin[GtkCellRendererText]{subsection}
    @end{subsection}
    @begin[GtkCellRendererToggle]{subsection}
    @end{subsection}
    @begin[GtkCellRendererSpinner]{subsection}
    @end{subsection}
    @begin[GtkListStore]{subsection}
    @end{subsection}
    @begin[GtkTreeStore]{subsection}
    @end{subsection}
  @end{section}
  @begin[Menus, Combo Box, Toolbar]{section}
    @begin[GtkComboBox]{subsection}
    @end{subsection}
    @begin[GtkComboBoxText]{subsection}
    @end{subsection}
    @begin[GtkMenu]{subsection}
    @end{subsection}
    @begin[GtkMenuBar]{subsection}
    @end{subsection}
    @begin[GtkMenuItem]{subsection}
    @end{subsection}
    @begin[GtkImageMenuItem]{subsection}
    @end{subsection}
    @begin[GtkRadioMenuItem]{subsection}
    @end{subsection}
    @begin[GtkCheckMenuItem]{subsection}
    @end{subsection}
    @begin[GtkSeparatorMenuItem]{subsection}
    @end{subsection}
    @begin[GtkTearoffMenuItem]{subsection}
    @end{subsection}
    @begin[GtkToolShell]{subsection}
    @end{subsection}
    @begin[GtkTollbar]{subsection}
    @end{subsection}
    @begin[GtkToolItem]{subsection}
    @end{subsection}
    @begin[GtkToolPalette]{subsection}
    @end{subsection}
    @begin[GtkToolItemGroup]{subsection}
    @end{subsection}
    @begin[GtkSeparatorToolItem]{subsection}
    @end{subsection}
    @begin[GtkToolButton]{subsection}
    @end{subsection}
    @begin[GtkMenuToolButton]{subsection}
    @end{subsection}
    @begin[GtkToogleToolButton]{subsection}
    @end{subsection}
    @begin[GtkRadioToolButton]{subsection}
    @end{subsection}
  @end{section}
  @begin[Action-based menus and toolbars]{section}
    @begin[GtkUIManager]{subsection}
    @end{subsection}
    @begin[GtkActionGroup]{subsection}
    @end{subsection}
    @begin[GtkAction]{subsection}
    @end{subsection}
    @begin[GtkToogleAction]{subsection}
    @end{subsection}
    @begin[GtkRadioAction]{subsection}
    @end{subsection}
    @begin[GtkRecentAction]{subsection}
    @end{subsection}
    @begin[GtkActivatable]{subsection}
    @end{subsection}
  @end{section}
  @begin[Selectors (Color/File/Font)]{section}
    @begin[GtkColorChooser]{subsection}
    @end{subsection}
    @begin[GtkColorButton]{subsection}
    @end{subsection}
    @begin[GtkColorChooserWidget]{subsection}
    @end{subsection}
    @begin[GtkColorChooserDialog]{subsection}
    @end{subsection}
    @begin[GtkColorSelection]{subsection}
    @end{subsection}
    @begin[GtkColorSelectionDialog]{subsection}
    @end{subsection}
    @begin[GtkHSV]{subsection}
    @end{subsection}
    @begin[GtkFileChooser]{subsection}
    @end{subsection}
    @begin[GtkFileChooserButton]{subsection}
    @end{subsection}
    @begin[GtkFileChooserDialog]{subsection}
    @end{subsection}
    @begin[GtkFileChooserWidget]{subsection}
    @end{subsection}
    @begin[GtkFileFilter]{subsection}
    @end{subsection}
    @begin[GtkFontChooser]{subsection}
    @end{subsection}
    @begin[GtkFontButton]{subsection}
    @end{subsection}
    @begin[GtkFontChooserWidget]{subsection}
    @end{subsection}
    @begin[GtkFontChooserDialog]{subsection}
    @end{subsection}
    @begin[GtkSelection]{subsection}
    @end{subsection}
    @begin[GtkFonSelectionDialog]{subsection}
    @end{subsection}
  @end{section}
  @begin[Layout Containers]{section}
    @begin[GtkGrid]{subsection}
      Pack widgets in a rows and columns.

      @about-class{gtk-grid}
      @about-function{gtk-grid-new}
      @about-function{gtk-grid-attach}
      @about-function{gtk-grid-attach-next-to}
      @about-function{gtk-grid-get-child-at}
      @about-function{gtk-grid-insert-row}
      @about-function{gtk-grid-insert-column}
      @about-function{gtk-grid-insert-next-to}
    @end{subsection}
    @begin[GtkAlignment]{subsection}
    @end{subsection}
    @begin[GtkAspectFrame]{subsection}
    @end{subsection}
    @begin[GtkBox]{subsection}
    @end{subsection}
    @begin[GtkButtonBox]{subsection}
    @end{subsection}
    @begin[GtkFixed]{subsection}
    @end{subsection}
    @begin[GtkPaned]{subsection}
    @end{subsection}
    @begin[GtkLayout]{subsection}
    @end{subsection}
    @begin[GtkNotebook]{subsection}
    @end{subsection}
    @begin[GtkTable]{subsection}
    @end{subsection}
    @begin[GtkExpander]{subsection}
    @end{subsection}
    @begin[GtkOverlay]{subsection}
    @end{subsection}
    @begin[GtkOrientable]{subsection}
    @end{subsection}  
  @end{section}
  @begin[Ornaments]{section}
    @begin[GtkFrame]{subsection}
    @end{subsection}
    @begin[GtkSeparator]{subsection}
    @end{subsection}
  @end{section}
  @begin[Scrolling]{section}
    @begin[GtkScrollbar]{subsection}
    @end{subsection} 
    @begin[GtkScrolledWindow]{subsection}
    @end{subsection} 
    @begin[GtkScrollable]{subsection}
    @end{subsection}
  @end{section}
  @begin[Printing]{section}
    @begin[GtkPrintOperation]{subsection}
    @end{subsection}
    @begin[GtkPrintContext]{subsection}
    @end{subsection}
    @begin[GtkPrintSettings]{subsection}
    @end{subsection}
    @begin[GtkPageSetup]{subsection}
    @end{subsection}
    @begin[GtkPaperSize]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkPrinter]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkPrintJob]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkPrintUnixDialog]{subsection}
    @end{subsection}
    @begin[GtkPageSetupUnixDialog]{subsection}
    @end{subsection}
  @end{section}
  @begin[Miscellaneous]{section}
    @begin[GtkAdjustment]{subsection}
    @end{subsection}
    @begin[GtkArrow]{subsection}
    @end{subsection}
    @begin[GtkCalendar]{subsection}
    @end{subsection}
    @begin[GtkDrawingArea]{subsection}
    @end{subsection}
    @begin[GtkEventBox]{subsection}
    @end{subsection}
    @begin[GtkHandleBox]{subsection}
    @end{subsection}
    @begin[GtkIMContexSimple]{subsection}
    @end{subsection}
    @begin[GtkIMMulticontex]{subsection}
    @end{subsection}
    @begin[GtkSizeGroup]{subsection}
    @end{subsection}
    @begin[GtkTooltip]{subsection}
      Add tips to your widgets.

      @about-class{gtk-tooltip}
      @about-function{gtk-tooltip-set-markup}
      @about-function{gtk-tooltip-set-text}
      @about-function{gtk-tooltip-set-icon}
      @about-function{gtk-tooltip-set-icon-from-stock}
      @about-function{gtk-tooltip-set-icon-from-icon-name}
      @about-function{gtk-tooltip-set-icon-from-gicon}
      @about-function{gtk-tooltip-set-custom}
      @about-function{gtk-tooltip-trigger-tooltip-query}
      @about-function{gtk-tooltip-set-tip-area}
    @end{subsection}
    @begin[GtkViewport]{subsection}
    @end{subsection}
    @begin[GtkAccessible]{subsection}
      not implemented
    @end{subsection}
  @end{section}
  @begin[Abstract Base Classes]{section}
    @begin[GtkWidget]{subsection}
      Base class for all widgets.

      @about-class{gtk-widget}
      @about-class{gtk-widget-class}
      @about-struct{gtk-requisition}
      @about-struct{gtk-allocation}
      @about-symbol{gtk-align}
      @about-symbol{gtk-widget-aux-info}
      @about-symbol{gtk-widget-help-type}
      @about-symbol{gtk-text-direction}
      @about-function{gtk-widget-new}
      @about-function{gtk-widget-destroy}
      @about-function{gtk-widget-in-destruction}
      @about-function{gtk-widget-destroyed}
      @about-function{gtk-widget-unparent}
      @about-function{gtk-widget-show}
      @about-function{gtk-widget-show-now}
      @about-function{gtk-widget-hide}
      @about-function{gtk-widget-show-all}
      @about-function{gtk-widget-map}
      @about-function{gtk-widget-unmap}
      @about-function{gtk-widget-realize}
      @about-function{gtk-widget-unrealize}
      @about-function{gtk-widget-draw}
      @about-function{gtk-widget-queue-draw}
      @about-function{gtk-widget-queue-resize}
      @about-function{gtk-widget-queue-resize-no-redraw}
      @about-function{gtk-widget-size-request}
      @about-function{gtk-widget-get-child-requisition}
      @about-function{gtk-widget-size-allocate}
      @about-function{gtk-widget-add-accelerator}
      @about-function{gtk-widget-remove-accelerator}
      @about-function{gtk-widget-set-accel-path}
      @about-function{gtk-widget-list-accel-closures}
      @about-function{gtk-widget-can-activate-accel}
      @about-function{gtk-widget-event}
      @about-function{gtk-widget-activate}
      @about-function{gtk-widget-reparent}
      @about-function{gtk-widget-intersect}
      @about-function{gtk-widget-grab-focus}
      @about-function{gtk-widget-grab-default}
      @about-function{gtk-widget-set-state}
      @about-function{gtk-widget-get-parent-window}
      @about-function{gtk-widget-set-parent-window}
      @about-function{gtk-widget-add-events}
      @about-function{gtk-widget-set-device-events}
      @about-function{gtk-widget-get-device-events}
      @about-function{gtk-widget-add-device-events}
      @about-function{gtk-widget-set-device-enabled}
      @about-function{gtk-widget-get-device-enabled}
      @about-function{gtk-widget-get-toplevel}
      @about-function{gtk-widget-get-ancestor}
      @about-function{gtk-widget-get-visual}
      @about-function{gtk-widget-set-visual}
      @about-function{gtk-widget-get-pointer}
      @about-function{gtk-widget-is-ancestor}
      @about-function{gtk-widget-translate-coordinates}
      @about-function{gtk-widget-hide-on-delete}
      @about-function{gtk-widget-ensure-style}
      @about-function{gtk-widget-reset-rc-styles}
      @about-function{gtk-widget-get-default-style}
      @about-function{gtk-widget-get-direction}
      @about-function{gtk-widget-set-direction}
      @about-function{gtk-widget-get-default-direction}
      @about-function{gtk-widget-set-default-direction}
      @about-function{gtk-widget-shape-combine-region}
      @about-function{gtk-widget-input-shape-combine-region}
      @about-function{gtk-widget-path}
      @about-function{gtk-widget-class-path}
      @about-function{gtk-widget-get-composite-name}
      @about-function{gtk-widget-set-composite-name}
      @about-function{gtk-widget-override-background-color}
      @about-function{gtk-widget-override-color}
      @about-function{gtk-widget-override-font}
      @about-function{gtk-widget-override-symbolic-color}
      @about-function{gtk-widget-override-cursor}
      @about-function{gtk-widget-modify-style}
      @about-function{gtk-widget-get-modifier-style}
      @about-function{gtk-widget-modify-fg}
      @about-function{gtk-widget-modify-bg}
      @about-function{gtk-widget-modify-text}
      @about-function{gtk-widget-modify-base}
      @about-function{gtk-widget-modify-font}
      @about-function{gtk-widget-modify-cursor}
      @about-function{gtk-widget-create-pango-context}
      @about-function{gtk-widget-get-pango-context}
      @about-function{gtk-widget-create-pango-layout}
      @about-function{gtk-widget-render-icon}
      @about-function{gtk-widget-render-icon-pixbuf}
      @about-function{gtk-widget-pop-composite-child}
      @about-function{gtk-widget-push-composite-child}
      @about-function{gtk-widget-queue-draw-area}
      @about-function{gtk-widget-queue-draw-region}
      @about-function{gtk-widget-set-redraw-on-allocate}
      @about-function{gtk-widget-mnemonic-activate}
      @about-function{gtk-widget-class-install-style-property}
      @about-function{gtk-widget-class-install-style-property-parser}
      @about-function{gtk-widget-class-find-style-property}
      @about-function{gtk-widget-class-list-style-properties}
      @about-function{gtk-widget-region-intersect}
      @about-function{gtk-widget-send-expose}
      @about-function{gtk-widget-send-focus-change}
      @about-function{gtk-widget-style-get}
      @about-function{gtk-widget-style-get-property}
      @about-function{gtk-widget-style-get-valist}
      @about-function{gtk-widget-style-attach}
      @about-function{gtk-widget-class-set-accessible-type}
      @about-function{gtk-widget-class-set-accessible-role}
      @about-function{gtk-widget-get-accessible}
      @about-function{gtk-widget-child-focus}
      @about-function{gtk-widget-child-notify}
      @about-function{gtk-widget-freeze-child-notify}
      @about-function{gtk-widget-get-child-visible}
      @about-function{gtk-widget-set-child-visible}
      @about-function{gtk-widget-get-settings}
      @about-function{gtk-widget-get-clipboard}
      @about-function{gtk-widget-get-display}
      @about-function{gtk-widget-get-root-window}
      @about-function{gtk-widget-get-screen}
      @about-function{gtk-widget-has-screen}
      @about-function{gtk-widget-get-size-request}
      @about-function{gtk-widget-set-size-request}
      @about-function{gtk-widget-thaw-child-notify}
      @about-function{gtk-widget-list-mnemonic-labels}
      @about-function{gtk-widget-add-mnemonic-label}
      @about-function{gtk-widget-remove-mnemonic-label}
      @about-function{gtk-widget-is-composited}
      @about-function{gtk-widget-error-bell}
      @about-function{gtk-widget-keynav-failed}
      @about-function{gtk-widget-get-tooltip-window}
      @about-function{gtk-widget-set-tooltip-window}
      @about-function{gtk-widget-trigger-tooltip-query}
      @about-function{gtk-cairo-should-draw-window}
      @about-function{gtk-cairo-transform-to-window}
      @about-function{gtk-widget-get-allocated-width}
      @about-function{gtk-widget-get-allocated-height}
      @about-function{gtk-widget-get-allocation}
      @about-function{gtk-widget-set-allocation}
      @about-function{gtk-widget-get-has-window}
      @about-function{gtk-widget-set-has-window}
      @about-function{gtk-widget-is-sensitive}
      @about-function{gtk-widget-get-state}
      @about-function{gtk-widget-set-state-flags}
      @about-function{gtk-widget-unset-state-flags}
      @about-function{gtk-widget-get-state-flags}
      @about-function{gtk-widget-has-visible-focus}
      @about-function{gtk-widget-has-grab}
      @about-function{gtk-widget-has-rc-style}
      @about-function{gtk-widget-is-drawable}
      @about-function{gtk-widget-is-toplevel}
      @about-function{gtk-widget-set-support-multidevice}
      @about-function{gtk-widget-get-support-multidevice}
      @about-function{gtk-widget-set-realized}
      @about-function{gtk-widget-get-realized}
      @about-function{gtk-widget-set-mapped}
      @about-function{gtk-widget-get-mapped}
      @about-function{gtk-widget-get-requisition}
      @about-function{gtk-widget-device-is-shadowed}
      @about-function{gtk-widget-get-modifier-mask}
      @about-function{gtk-widget-get-path}
      @about-function{gtk-widget-get-style-context}
      @about-function{gtk-widget-reset-style}
      @about-function{gtk-requisition-new}
      @about-function{gtk-requisition-copy}
      @about-function{gtk-requisition-free}
      @about-symbol{gtk-size-request-mode}
      @about-symbol{gtk-requested-size}
      @about-function{gtk-widget-get-preferred-height}
      @about-function{gtk-widget-get-preferred-width}
      @about-function{gtk-widget-get-preferred-height-for-width}
      @about-function{gtk-widget-get-preferred-width-for-height}
      @about-function{gtk-widget-get-request-mode}
      @about-function{gtk-widget-get-preferred-size}
      @about-function{gtk-distribute-natural-allocation}
      @about-function{gtk-widget-queue-compute-expand}
      @about-function{gtk-widget-compute-expand}
    @end{subsection}
    @begin[GtkContainer]{subsection}
      Base class for widgets which contain other widgets.

      @about-class{gtk-container}
      @about-function{GTK_IS_RESIZE_CONTAINER}
      @about-function{GTK_CONTAINER_WARN_INVALID_CHILD_PROPERTY_ID}
      @about-function{gtk-container-add}
      @about-function{gtk-container-remove}
      @about-function{gtk_container_add_with_properties}
      @about-function{gtk-container-check-resize}
      @about-function{gtk-container-foreach}
      @about-function{gtk-container-get-children}
      @about-function{gtk_container_get_path_for_child}
      @about-function{gtk-container-set-reallocate-redraws}
      @about-function{gtk-container-get-focus-child}
      @about-function{gtk-container-set-focus-child}
      @about-function{gtk-container-get-focus-vadjustment}
      @about-function{gtk-container-set-focus-vadjustment}
      @about-function{gtk-container-get-focus-hadjustment}
      @about-function{gtk-container-set-focus-hadjustment}
      @about-function{gtk-container-resize-children}
      @about-function{gtk-container-child-type}
      @about-function{gtk_container_child_get}
      @about-function{gtk_container_child_set}
      @about-function{gtk_container_child_get_property}
      @about-function{gtk_container_child_set_property}
      @about-function{gtk_container_child_get_valist}
      @about-function{gtk_container_child_set_valist}
      @about-function{gtk_container_child_notify}
      @about-function{gtk-container-forall}
      @about-function{gtk_container_propagate_draw}
      @about-function{gtk_container_get_focus_chain}
      @about-function{gtk_container_set_focus_chain}
      @about-function{gtk_container_unset_focus_chain}
      @about-function{gtk_container_class_find_child_property}
      @about-function{gtk_container_class_install_child_property}
      @about-function{gtk_container_class_list_child_properties}
      @about-function{gtk_container_class_handle_border_width}
    @end{subsection}
    @begin[GtkBin]{subsection}
      A container with just one child.

      @about-class{gtk-bin}
      @about-function{gtk-bin-get-child}
    @end{subsection}
    @begin[GtkMenuShell]{subsection}
    @end{subsection}
    @begin[GtkMisc]{subsection}
      Base class for widgets with alignments and padding.

      @about-class{gtk-misc}
    @end{subsection}
    @begin[GtkRange]{subsection}
    @end{subsection}
    @begin[GtkIMContext]{subsection}
    @end{subsection}
  @end{section}
  @begin[Cross-process Embedding]{section}
    @begin[GtkPlug]{subsection}
    @end{subsection}
    @begin[GtkSocket]{subsection}
    @end{subsection}
  @end{section} 
  @begin[Recently Used Documents]{section}
    @begin[GtkRecentManager]{subsection}
    @end{subsection}
    @begin[GtkRecentChooser]{subsection}
    @end{subsection}
    @begin[GtkRecentChooserDialog]{subsection}
    @end{subsection}
    @begin[GtkRecentChooserMenu]{subsection}
    @end{subsection}
    @begin[GtkRecentChooserWidget]{subsection}
    @end{subsection}
    @begin[GtkRecentFilter]{subsection}
    @end{subsection}
  @end{section}
  @begin[Choosing from installed applications]{section}
    @begin[GtkAppChooser]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkAppChooserButton]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkAppChooserDialog]{subsection}
      not implemented
    @end{subsection}
    @begin[GtkAppChooserWidget]{subsection}
      not implemented
    @end{subsection}
  @end{section}
  @begin[Interface builder]{section}
    @begin[GtkBuildable]{subsection}
    @end{subsection}
    @begin[GtkBuilder]{subsection}
    @end{subsection}
  @end{section}
  @begin[Application support]{section}
    @begin[GtkApplication]{subsection}
    @end{subsection}
    @begin[GtkApplicationWindow]{subsection}
    @end{subsection}
    @begin[GtkActionable]{subsection}
    @end{subsection}
  @end{section}
")

;;; --- atdoc-gtk.package.lisp -------------------------------------------------