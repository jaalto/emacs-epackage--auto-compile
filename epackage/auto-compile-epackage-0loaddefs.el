
;;;### (autoloads (auto-compile-mode) "../auto-compile" "auto-compile.el"
;;;;;;  (20228 16418))
;;; Generated autoloads from auto-compile.el

(defvar auto-compile-mode nil "\
Non-nil if Auto-Compile mode is enabled.
See the command `auto-compile-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `auto-compile-mode'.")

(custom-autoload 'auto-compile-mode "../auto-compile" nil)

(autoload 'auto-compile-mode "auto-compile" "\
Automatically compile Emacs Lisp files.

A file might be compiled every time it is saved or only when it's buffer
is destroyed.  This is controlled through the option `auto-compile-when'.

A file might be compiled (1) automatically, (2) after the user has been
asked, (3) never.

This behavior depends on various variables described below. The function
`auto-compile-file-maybe' goes through various steps to decide what should
be done.  These steps are listed here.  After each step, if the behavior
has been unambiguously decided, all remaining steps, and therefor the
variables they depend on, don't have any effect.

0. If `auto-compile-flag' is set locally (as a buffer local value) obey
   it.

1. If `auto-compile-flag' is set globally to `ask-always' then ask the
   user.

2. If `auto-compile-consider-no-byte' is set to nil the file _might_ be
   compiles if and only if a byte file already exists. Otherwise if set
   to t file _might_ be compiled regardless if a byte file exists.

   If this is set to t you can still use command `byte-compile-file' to
   manually compile a file once and cause `auto-compile' to consider it
   in the future.

3. If the file is explicitly included or excluded then do as requested.

   The regexps in `auto-compile-include' and `auto-compile-exclude' are
   used for explicit inclusion and exclusion their values are lists of
   regular expressions.

   First the best match in each variable is determined independently.
   The best match is usually the longest matched string.  But if one or
   more of the regular expressions that are used to match at the end of
   a string (that is if it ends with $) then only the matches of such
   regular expressions are compared by size.

   Then the best match from each variable are compared.  If only one ends
   with $ then it wins.  Otherwise if both or none end with $ the longer
   one wins.

   This mechanism, while somewhat complicated, allow rather sophisticated
   rules.

4. For all others files the global value of `auto-compile-flag' decides
   what should be done.

   t                Compile file without asking.
   nil              Don't compile file.
   ask              Ask whether file should be compiled.
   compiledp        Recompile if compiled file exists; otherwise don't.
   compiledp-or-ask Recompile if compiled file exists; otherwise ask.

After the user was prompted whether to compile some file the choice can be
saved.  See option `auto-compile-remember'.

Before a file is actually compiled `check-paren' is called, which
in case of an unmatched bracket or quote positions point near the error.
When only compiling upon killing of a file-visiting buffers you can still
choose to always call `check-paren' when saving.  See option
`auto-compile-when'.

When turned on `auto-compile-mode' is in effect in all buffer visiting
Emacs Lisp files.  Though it might not have an effect in some of them as
described above.  You can also toggle automatic compilation on and off in
a given buffer using `toggle-local-auto-compile'.  This even works if
`auto-compile-mode' is not turned on.

\(fn &optional ARG)" t nil)

;;;***
