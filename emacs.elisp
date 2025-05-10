;;
;;
;;  Title   :  .emacs.el 
;;  Author  :  Keith Rehm
;;  Date    :  05/06/2025
;;
;;  GNU Emacs initialization file.
;;
;;  Emacs environment preferences and useful
;;  functionality cobbled together over years.
;;   
;;  
;;

;(open-dribble-file "~/emacs_dribble")
;;(open-termscript "~/emacs_termscript")




(setq load-path
      (cons
       "~/elisp"
       load-path))

(setq load-path
      (cons
       "~/elisp/090816-darkroom-mode/"
       load-path))

(setq load-path
      (cons
       "~/elisp/color-theme-6.6.0/"
       load-path))

(setq exec-path
      (cons
       "c:/msys/1.0/bin"
       exec-path))

(setq exec-path
      (cons
       "~/elisp/090816-darkroom-mode"
       exec-path))

(setq exec-path
      (cons
       "c:/cygwin/usr/bin"
       exec-path))

(setq exec-path
      (cons
       "c:/cygwin/usr/local/bin"
       exec-path))

(setq exec-path
      (cons
       "C:/Java/jdk1.6.0_06/bin"
       exec-path))

(setq exec-path
      (cons
       "C:/gnat/2008/bin"
       exec-path))

;
;
;
(setq default-frame-alist
      '((top . 5) (left . 5)
        (width . 160) (height . 67)
;        (current-frame-color-theme . "foo")
;        (cursor-color . "white")
;        (cursor-type . box)
;        (foreground-color . "yellow")
;        (background-color . "black")
        (font . "-raster-ProFontWindows-normal-r-normal-normal-11-90-96-96-c-60-iso8859-1")
;	(font . "6x10")
	))

(setq initial-frame-alist '((top . 5) (left . 5)))


;;(setq explicit-shell-file-name "bash.exe")
;; (setq inferior-lisp-program "c:/cygwin/bin/clisp.exe -ansi -q") ; your Lisp system
;; ;(setq inferior-lisp-program "c:/SBCL/1.0.22/sbcl.exe") ; your Lisp system
;; (add-to-list 'load-path "c:/slime/")  ; your SLIME directory
;; ;;(add-to-list 'load-path "~/elisp/slime-2.0")  ; your SLIME directory
;; (require 'slime)
;; (slime-setup)
;; 
;;(setq inferior-lisp-program "/cygdrive/usr/bin/clisp/clisp -K full")


;(set-variable 'inferior-lisp-program "C:/gcl.exe")
;(autoload 'fi:common-lisp "fi-site-init" "" t)




;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;; darkroom-mode

(require 'darkroom-mode)




;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;; eol unmunging

;; (defun set-buffer-file-eol-type (eol-type)
;;    "Set the file end-of-line conversion type of the current buffer to
;;  EOL-TYPE.
;;  This means that when you save the buffer, line endings will be converted
;;  according to EOL-TYPE.

;;  EOL-TYPE is one of three symbols:

;;    unix (LF)
;;    dos (CRLF)
;;    mac (CR)

;;  This function marks the buffer modified so that the succeeding
;;  \\[save-buffer]
;;  surely saves the buffer with EOL-TYPE.  From a program, if you don't want
;;  to mark the buffer modified, use coding-system-change-eol-conversion
;;  directly [weikart]."
;;    (interactive "SEOL type for visited file (unix, dos, or mac): ")
;;    (setq buffer-file-coding-system (coding-system-change-eol-conversion
;;                       buffer-file-coding-system eol-type))
;;    (set-buffer-modified-p t)
;;    (force-mode-line-update))

;; ;;  (global-set-key "\^Cu" (lambda () (interactive) (set-buffer-file-eol-type 'unix)))
;; ;;  (global-set-key "\^Cd" (lambda () (interactive) (set-buffer-file-eol-type 'dos)))
;; ;;  (global-set-key "\^Cm" (lambda () (interactive) (set-buffer-file-eol-type 'mac)))
;;  (global-set-key [C-c C-u] '(lambda () (interactive) (set-buffer-file-eol-type 'unix)))
;;  (global-set-key [C-c C-d] '(lambda () (interactive) (set-buffer-file-eol-type 'dos)))
;;  (global-set-key [C-c C-m] '(lambda () (interactive) (set-buffer-file-eol-type 'mac)))

;;  ;; Make the mode-line display the standard EOL-TYPE symbols (used above)...
;; (setq eol-mnemonic-undecided "(?)"  ;; unknown EOL type
;;        eol-mnemonic-unix  "(unix)" ;; LF
;;        eol-mnemonic-dos  "(dos)"  ;; CRLF
;;        eol-mnemonic-mac  "(mac)") ;; CR





;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;; require common lisp functionality

(require 'cl)
;(require 'cl-19)

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;; eshell stuff


(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)



;;  (setq load-path
;;        (cons
;;         "~/emacs/lisp/eshell/"
;;         load-path))
;;  
;;  (load "eshell")
(defalias 'ff 'find-file)
(defalias 'ffo 'find-file-other-window)
(defalias 'dow 'delete-other-windows)
;(defalias 'lf '(lambda () 
;                (interactive) 
;                (eshell/ls (file-expand-wildcards "*.f90"))))

(setq eshell-prefer-lisp-functions t)

(defun eshell/ffa (&rest files)
  "Invoke `find-file' on all files."
  (if (listp (car files))
      (progn
        (let ((files2 (car files)))
          (while files2
            (find-file (pop files2)))))
    (while files
      (find-file (pop files)))))


(defun eshell/op (FILE)
  "Invoke (w32-shell-execute \"Open\" FILE) and substitute slashes for backslashes"
  (w32-shell-execute "Open" (substitute ?\\ ?/ (expand-file-name FILE))))

(defun eshell/clear ()
  "04Dec2001 - sailor, to clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun eshell/nos (name1)
  (eshell-grep "grep" (list "-i" name1 (expand-file-name "~/GALContacts.csv"))))

(defun eshell/jnos (name1)
  (eshell-grep "grep" (list "-i" name1 (expand-file-name "~/assign.csv"))))



(defun eshell/ffdir ()
  (interactive)
  (find-file "./*" t))

(eval-after-load "em-ls"
  '(progn
     (defun ted-eshell-ls-find-file-at-point (point)
       "RET on Eshell's `ls' output to open files."
       (interactive "d")
       (find-file-other-window (buffer-substring-no-properties
				(previous-single-property-change point 'help-echo)
				(next-single-property-change point 'help-echo))))
     
     (defun pat-eshell-ls-find-file-at-mouse-click (event)
       "Middle click on Eshell's `ls' output to open files.
 From Patrick Anderson via the wiki."
       (interactive "e")
       (ted-eshell-ls-find-file-at-point (posn-point (event-end event))))
     
     (let ((map (make-sparse-keymap)))
       (define-key map (kbd "RET")      'ted-eshell-ls-find-file-at-point)
       (define-key map (kbd "<return>") 'ted-eshell-ls-find-file-at-point)
       (define-key map (kbd "<mouse-2>") 'pat-eshell-ls-find-file-at-mouse-click)
       (defvar ted-eshell-ls-keymap map))
     
     (defadvice eshell-ls-decorated-name (after ted-electrify-ls activate)
       "Eshell's `ls' now lets you click or RET on file names to open them."
       (add-text-properties 0 (length ad-return-value)
                              (list 'help-echo "RET, mouse-2: visit this file"
                                    'mouse-face 'highlight
                                    'keymap ted-eshell-ls-keymap)
                              ad-return-value)
         ad-return-value)))


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

;;(defun bsim ()
;;  (interactive)
;;  (start-process-shell-command 
;;   "simulation clean and build" 
;;   "*eshell*" 
;;   "msdev" 
;;   "Simulation.dsw /MAKE \"Simulation - Win32 RTX Debug\" /REBUILD"))
;;
;;(defun bsimc ()
;;  (interactive)
;;  (start-process-shell-command 
;;   "simulation build" 
;;   "*eshell*" 
;;   "msdev" 
;;   "Simulation.dsw /MAKE \"Simulation - Win32 RTX Debug\""))
;;
;;
;;(defun bsys ()
;;  (interactive)
;;  (start-process-shell-command 
;;   "systems clean and build" 
;;   "*eshell*" 
;;   "msdev" 
;;   "Systems.dsp /MAKE \"Systems - Win32 RTX Debug\" /REBUILD"))
;;
;;(defun bsysc ()
;;  (interactive)
;;  (start-process-shell-command 
;;   "sys build" 
;;   "*eshell*" 
;;   "msdev" 
;;   "Systems.dsp /MAKE \"Systems - Win32 RTX Debug\""))
;;

;;;;---------------------------------------------------------------------
;;;;---------------------------------------------------------------------
;; cdsim shell function -- use: (cdsim X)


(defun cdsim (jobNumber)
  (interactive)
  (eshell-trap-errors
   (eshell-named-command 
    "cd"
    (list 
     (concat 
      "C:/Documents and Settings/keithr/My Documents/my simulators/" 
      (number-to-string jobNumber) 
      "/systems")))))


(defun cdsim-f (jobNumber)
  (interactive)
  (eshell-trap-errors
   (eshell-named-command 
    "cd"
    (list 
     (concat 
      "c:/Documents and Settings/keithr/My Documents/my simulators/" 
      jobNumber 
      "/systems")))))



;;(setq bsys "msdev Systems.dsp /MAKE \"Systems - Win32 RTX Debug\" /REBUILD")

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(defun farex (rexp1)
  (interactive)
  (shell-command-to-string 
   (concat "find ./* -name *.f90 -print | xargs grep -i " rexp1)))

(defun farex3 (rexp1 rexp2)
  (interactive)
  (shell-command-to-string 
   (concat "c:\\cygwin\\bin\\find.exe ./* -name " rexp1 " -print | xargs c:\\cygwin\\bin\\grep -i " rexp2)))


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

;; (when (eq 'window-system 'w32)
;; (require 'gnuserv)
;; (gnuserv-start))

(server-start)   ;;emacsclientw


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;(require 'speedbar)
;;(speedbar 1)



;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(setq calc-show-banner nil)


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(defun net-message (recipient text)
   "Send a net message with Emacs.
 This needs Windows/NT, I think."
   (interactive "sEmpfaenger: \nsMessage: ")
   ;; Must have one resulting line of output so it automatically
   ;; displays the result in the echo area.  Not having ^M's in the
   ;; output is also nice.
   (shell-command (format "net send %s %s" recipient text)))


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(defun aitm ()
  (interactive)
  (net-message "harrisa-pc" "YOU ARE THE MAN!!"))

(defun jitm ()
  (interactive)
  (net-message "jimb-pc" "YOU ARE THE MAN!!"))


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(defun w32-restore-frame ()
    "Restore a minimized frame"
     (interactive)
     (w32-send-sys-command 61728))

  (defun w32-maximize-frame ()
    "Maximize the current frame"
     (interactive)
     (w32-send-sys-command 61488))





;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------


(defun slocf (rbeg rend)
  (interactive "r")
  (let ((lns 0))
    (save-excursion
      (save-restriction
        (narrow-to-region rbeg rend)
        (goto-char rbeg)
        (while (re-search-forward "^[ ]*[a-zA-Z0-9]" nil t nil)
          (setq lns (1+ lns)))
        (message "%d" lns)))))



;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------


(defun DippinLovinSkinnyHoppinEclipseFox (rbeg rend)
  (interactive "r")
  (let ((lns 0))
    (save-excursion
      (save-restriction
        (narrow-to-region rbeg rend)
	(kill-region rbeg rend)
	(insert "IF ( .NOT.(TIRESET .OR. ICLEAR) ) THEN")
	(newline)
	(yank)
	(newline)
	(insert "ENDIF")
	(newline)
	(re-search-forward "^ENDIF" nil t nil)
	(indent-region (point-min) (point-max) nil)))))




;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(defun netdir()
  (interactive)
  (require 'widget)
  (let* ((drvL))
    (with-temp-buffer
      (let ((out (shell-command "net use" (current-buffer))))
        (if (eq out 0)
            (while (re-search-forward "[A-Z]: +\\\\\\\\[^ ]+" nil t nil)
              (setq drvL (cons (split-string (match-string 0)) drvL)))
            (error "Unable to issue the NET USE command"))))
    (pop-to-buffer "*NET DIR LIST*")
    (erase-buffer)
    (widget-minor-mode 1)
    (mapcar
     (lambda (x)
       (lexical-let ((x x))
         (widget-create 'push-button
                        :notify (lambda (widget &rest ignore)
                                  (kill-buffer (current-buffer))
                                  (dired (car x)))
                        (concat (car x) "  " (cadr x))))
       (widget-insert "\n"))
     (reverse drvL))))



;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(if (load "mwheel" t)
    (mwheel-install))


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;; get all the labels ms compiler complains about (error: var needs type. [foo])
;; puts "[foo]" into buffer junk1.

(defun getMSCompilerProblemVars (rbeg rend)
  (interactive "r")
  (goto-char rbeg)
  (while (re-search-forward "[[A-Za-z0-9_]*]" nil t)
    (append-to-buffer "junk1" (match-beginning 0) (match-end 0))))

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

;;    (add-to-list 'load-path "~/elisp/emms/")
;;    (require 'emms)
;;    (require 'emms-default)
;;    ;;(emms-setup 'default "E:/ziq/")
;;    (emms-setup 'default "~/../my documents/my music/kraftwerk/")
;;    ;; Show the current track each time EMMS
;;    ;; starts to play a track with "NP : "
;;    (add-hook 'emms-player-started-hook 'emms-show)
;;    (setq emms-show-format "NP: %s")
;;    
;;    ;; When asked for emms-play-directory,
;;    ;; always start from this one 
;;    ;(setq emms-source-file-default-directory "E:/ziq/")
;;    
;;    ;; Want to use alsa with mpg321 ? 
;;    ;;(setq emms-player-mpg321-parameters '("-o" "alsa"))
;;    (require 'emms-player-simple)
;;    (require 'emms-source-file)
;;    (setq emms-player-list '(emms-player-mpg321
;;                             emms-player-ogg123))
;;    ;;                         emms-player-mplayer)
;;    ;;      emms-source-list '((emms-directory-tree "E:/ziq/")))
;;    (require 'emms-pbi)
;;    


;;(add-to-list 'load-path "~/elisp/emms/")
;;(require 'emms-setup)
;;(emms-standard)
;;(emms-default-players)


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
(require 'color-theme)
(color-theme-initialize)
;;(setq color-theme-is-global nil)
(setq color-theme-history-max-length t)
;(color-theme-emacs-21)
;(color-theme-pok-wob)
(color-theme-charcoal-black)


(defun color-theme-random ()
  (interactive)
  (random t)
  (funcall
   (let* ((themes (mapcar 'car color-themes))
          (n0 (random (length themes)))
          (themeName (car (cdr (nth n0 color-themes))))
          (ctfunc (nth n0 themes)))
     (message (format "%s is the color-theme" themeName))
     (modify-frame-parameters nil `((current-frame-color-theme . ,themeName)))
     ctfunc)))

;(defun c-t-r (frame)
;  (select-frame frame)
;  (random t)
;  (funcall
;   (let* ((themes (mapcar 'car color-themes))
;         (n0 (random (length themes)))
;         (themeName (car (cdr (nth n0 color-themes))))
;         (ctfunc (nth n0 themes)))
;     (message (format "%s is the color-theme" themeName))
;     (modify-frame-parameters frame `((current-frame-color-theme . ,themeName)))
;     ctfunc)))
;
;(setq after-make-frame-functions
;      (cons
;       'c-t-r
;       after-make-frame-functions))





;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
(global-font-lock-mode  1)
(menu-bar-mode         -1)
(scroll-bar-mode       -1)
(column-number-mode     1)
(tool-bar-mode         -1)
(blink-cursor-mode     -1)
(show-paren-mode        t)
(setq visible-bell      1)
(setq inhibit-startup-message t)
;(setq debug-on-error    t)
(setq indent-tabs-mode nil)


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
(setq
 backup-by-copying         t                         ; don't clobber symlinks
 backup-directory-alist    '(("." . "~/backups"))    ; don't litter my fs tree
 delete-old-versions       t
 kept-new-versions         6
 kept-old-versions         2
 version-control           t)                        ; use versioned backups


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
(require 'remember)

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;(require 'htmlize)

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;(setq load-path
;      (cons
;       "~/elisp/bbdb/lisp"
;       load-path))
;(require 'bbdb)
;(bbdb-initialize)

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
(require 'iswitchb)
(iswitchb-mode 1)

(add-hook 'iswitchb-mode-hook 'iswitchb-my-keys)
(defun iswitchb-my-keys ()
  "Add my keybindings for iswitchb."
  (define-key iswitchb-mode-map " " 'iswitchb-next-match))


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;     (defun google-region (rstart rend)
;;       (interactive "r")
;;       (browse-url 
;;        (concatenate 'string 
;;                     "http://www.google.com/search?q="
;;                     (buffer-substring rstart rend))))
;;     
;;     (require 'google)
;;     
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
(defun foldoc-region (rstart rend)
  (interactive "r")
  (browse-url
   (concatenate 'string
                "http://foldoc.doc.ic.ac.uk/foldoc/foldoc.cgi?query="
                (buffer-substring rstart rend)
                "&action=Search")))





;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(defun f90-align-continuations (start end)
  (interactive "r") ; function arguments are filled in automatically if called
                    ; interactively, otherwise they must be filled in explicitly
                    ; r stands for region

  (save-excursion ;;; do not generate cursor motion

    (setq _point (point) ) ; save the point var
    (setq _mark  (mark)  ) ; save the mark var
    (setq _begin 0)
    (setq _end   0)

    (if 
        (< (point) (mark))

        (progn 
               (setq _begin (point))
               (setq _end   (mark))
        )

        (progn
               (setq _begin (mark))
               (setq _end   (point))
        )
    )

    ;; assume that the code is formated as such
    ;; |--------| <- begin can be anywhere between here
    ;; var1 = ( &
    ;;          var2 &
    ;;          .or. var3 &
    ;;          .and. var_with_long_name &
    ;;          .or. var4 &
    ;;        )               
    ;; |---------------------| <- end can be anywhere between here

    ; search for the continuation character that is the furthest
    ; from the beginning of the line
    (progn 
      (setq biggest-diff 0)
      (goto-char _begin)

      (while (< (point) _end)
        (progn
               (end-of-line)          ; goto end of line
               (setq j_end (point))   ; save end point
               (beginning-of-line)    ; goto beginning of line
               (setq j_begin (point)) ; save beginning point

               (while (and
                        (not 
                             (equal "&" (buffer-substring-no-properties (point) (1+ (point)) ))
                        )
                        (<= (point) j_end)
                      )
                 (goto-char (1+ (point))) ; next character
               ) ; end while loop for finding &
               
               (if (equal "&" (buffer-substring-no-properties (point) (1+ (point))))
                   (if (> (- (point) j_begin) biggest-diff)
                       (setq biggest-diff (- (point) j_begin))
                   )
               )
               
               (next-line 1)
        )
      ) ;; end search for biggest difference between
        ;; continuation char and beginning of line

      (goto-char _begin) ;; set point to beginning of region

      (while (< (point) _end)
        (progn
               (end-of-line)
               (setq j_end (point))
               (beginning-of-line)
               (setq j_begin (point))

               (while (and
                           (not 
                                (equal "&" (buffer-substring-no-properties (point) (1+ (point))))
                           )
                           (<= (point) j_end)
                      )
                      
                      (goto-char (1+ (point)))
               )
               
               (if (equal "&" (buffer-substring-no-properties (point) (1+ (point))))
                   (progn 
                          ;; insert the correct number of spaces so that the
                          ;; current lines difference between beginning and &
                          ;; is the same as the max difference.
                          
                          (setq whitespaces (- biggest-diff (- (point) j_begin)))

                          (while (> whitespaces 0)
                            (progn 
                                   (insert " ")
                                   (setq _end (1+ _end))
                                   (setq whitespaces (1- whitespaces))
                            )
                          )
                   )
               )

               (next-line 1)

        ) ;; end progn code block
      ) ;; end aligning continuation characters while loop

    )
    
    

  ) ;; end save-excursion

) ;; end f90-align-continuations



;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(defun kill-line-and-append-to-kill-ring ()
  (interactive)
  (append-next-kill)
  (kill-line))

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
(global-set-key [f1]  'iswitchb-buffer)
(global-set-key [f2]  'yank)
(global-set-key [f3]  'save-buffer)
(global-set-key [f4]  'kill-line)
(global-set-key [f5]  'kill-line-and-append-to-kill-ring)
;(global-set-key [f6]  'itul)
;(global-set-key [f6]  'iit)
;(global-set-key [f6]  'ite)
(global-set-key [f6]  'iee)
(global-set-key [f7]  'color-theme-random)
(global-set-key [f8]  'remember)
(global-set-key [f9]  'f90-align-continuations)
(global-set-key [f10] 'rewrite)
(global-set-key [f11] 'w32-fullscreen)
(global-set-key [f12] 'other-window)

(global-set-key [C-tab] 'bs-cycle-next) 
(global-set-key "\M-g" 'goto-line)


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
(defun make-cb-card ()
  "creates the di and do labels for a cb card. 
   Cardnumber, rows, and cols are input via minibuffer."
  (interactive)
  (let ((cardNumber (string-to-number (read-from-minibuffer "card number: "))) 
        (rows (string-to-number (read-from-minibuffer "number of rows: ")))
        (cols (string-to-number (read-from-minibuffer "number of columns: "))) 
        (i 0)
        (j 0)
        (k 0)
        (w 0))
    (while (< w 2)
      (setq i 0)
      (if (= w 0) 
          (progn (newline 2))
        (progn (newline 2)))
      (while (< i rows)
        (setq j 0)
        (let ((c-row (1+ i)))
          (while (< j cols)
            (let ((c-col (1+ j)))
              (insert (format "logical cb%s%dr%02dc%02d !"  
                              (if (= w 0) "i" "o") 
                              cardNumber 
                              c-row 
                              c-col))
              (newline)
              (setq j (1+ j))))
          (setq i (1+ i))))
      (setq w (1+ w)))))



;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)



;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;; double-space-lines-region
(defun dslr (rbeg rend)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region rbeg rend)
      (let ((rend-line-beginning 
             (line-beginning-position 
              (goto-char rend))))
        (goto-char rbeg)
        (beginning-of-line)
        (while (< (point) rend-line-beginning)
          (forward-line 1)
          (open-line 1)
          (forward-line 1))))))



;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;; delete-blank-lines-region
(defun dblr (rbeg rend)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region rbeg rend)
      (goto-char rbeg)
      (flush-lines "^\\s-*$"))))


(defun isri3 (beg end)
  (interactive "r")
  (string-rectangle beg end "   "))

(defun itul ()
  (interactive)
  (re-search-forward "^IF" nil t)
  (beginning-of-line)
  (setq beg (point))
  (re-search-forward "^END" nil t)
  (beginning-of-line)  
  (isri3 beg (point))
  (next-line 1)
  (open-line 1))


(defun iit ()
  (interactive)
  (re-search-forward "^   IF$" nil t)
  (next-line 1)
  (beginning-of-line)
  (set-mark (point))
  (setq rbeg (point))
  (re-search-forward "^   THEN$" nil t)
  (next-line -1)
  (beginning-of-line)
  (string-rectangle rbeg (point) "   "))

(defun ite ()
  (interactive)
  (re-search-forward "^   THEN$" nil t)
  (next-line 1)
  (beginning-of-line)
  (set-mark (point))
  (setq rbeg (point))
  (re-search-forward "^   ELSE$" nil t)
  (next-line -1)
  (beginning-of-line)
  (string-rectangle rbeg (point) "   "))

(defun iee ()
  (interactive)
  (re-search-forward "^   ELSE$" nil t)
  (next-line 1)
  (beginning-of-line)
  (set-mark (point))
  (setq rbeg (point))
  (re-search-forward "^   END$" nil t)
  (next-line -1)
  (beginning-of-line)
  (string-rectangle rbeg (point) "   "))

(defvar *khr-colnum* 72 "* slam to column")
(defun xxxx11 (colnum)
  (interactive)
  (if (< (current-column) colnum)
      (while (< (current-column) colnum)
        (insert " "))))

(defun xxx001 () (interactive) (xxxx11 *khr-colnum*))

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;; comment in f90 style what is comment in f77 style (not 100% working)
(defun fcomm (rbeg rend)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region rbeg rend)
      (goto-char rbeg)
      (while (re-search-forward "^[^ ].*$")
        (goto-char (match-beginning 0))
        (insert "!")
        (goto-char (match-end 0))))))


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

;;     (setq load-path
;;           (cons
;;            "~/elisp/ilisp"
;;            load-path))
;;     
;;     (require 'completer)
;;     
;;     (autoload 'clisp-hs   "ilisp"
;;       "Inferior Haible/Stoll CLISP Common Lisp." t)
;;     
;;     ;(defvar clisp-dir "~/clisp-2.30/")
;;     ;(defvar clisp-dir "c:/clisp-2.30/")
;;     (defvar clisp-dir "c:/cygwin/bin")
;;     (defvar clisp-exe (concat clisp-dir "clisp.exe"))
;;     ;; (defvar clisp-hs-program (concat clisp-exe 
;;     ;;                               " -B " 
;;     ;;                               clisp-dir 
;;     ;;                               " -M " 
;;     ;;                               clisp-dir 
;;     ;;                               "lispinit.mem -ansi -q"))
;;     (defvar clisp-hs-program (concat clisp-exe "-ansi -q"))
;;     
;;     (set-default 'auto-mode-alist
;;                  (append '(("\\.lisp$" . lisp-mode)
;;                            ("\\.lsp$" . lisp-mode)
;;                            ("\\.cl$" . lisp-mode))
;;                          auto-mode-alist))
;;     
;;     (add-hook 'lisp-mode-hook '(lambda () (require 'ilisp)))
;;     
;;     (setq lisp-no-popper t)
;;     

;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;
;;(require 'info)
;;(setq Info-default-directory-list
;;  (cons (expand-file-name "~/elisp/info")
;;        Info-directory-list))
;;


(setq grep-command "c:/msys/1.0/bin/grep.exe -i")


;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------
;;;-------------------------------------------------------------------------

(add-hook 'f90-mode-hook
          ;; These are the default values.
          '(lambda () (setq f90-do-indent 3
                            f90-if-indent 3
                            f90-type-indent 3
                            f90-program-indent 2
                            f90-continuation-indent 5
                            f90-comment-region "!"
                            f90-directive-comment-re "!hpf\\$"
                            f90-indented-comment-re "!"
                            f90-break-delimiters "[-+\\*/><=,% \t]"
                            f90-break-before-delimiters t
                            f90-beginning-ampersand t
                            f90-smart-end 'blink
                            f90-auto-keyword-case nil
                            f90-leave-line-no nil
                            indent-tabs-mode nil
                            f90-font-lock-keywords f90-font-lock-keywords-2
                            )
             ;; These are not default.
             (abbrev-mode 1)             ; turn on abbreviation mode
             (f90-add-imenu-menu)        ; extra menu with functions etc.
             (if f90-auto-keyword-case   ; change case of all keywords on startup
                 (f90-change-keywords f90-auto-keyword-case))
             ))


(defun fortran-if-then ()
  (interactive)
  (set-mark (point))
  (insert "IF () THEN")
  (newline 2)
  (insert "ELSE")
  (newline 2)
  (insert "ENDIF")
  (indent-region (mark) (point) nil)
  (search-backward ")"))


(defun fortran-arinc-429-disc ()
  (interactive)
  (set-mark (point))
  (insert "i4=0")
  (newline 1)
  (insert "if () i4=i4+bit11")
  (newline 1)
  (insert "if () i4=i4+bit12")
  (newline 1)
  (insert "if () i4=i4+bit13")
  (newline 1)
  (insert "if () i4=i4+bit14")
  (newline 1)
  (insert "if () i4=i4+bit15")
  (newline 1)
  (insert "if () i4=i4+bit16")
  (newline 1)
  (insert "if () i4=i4+bit17")
  (newline 1)
  (insert "if () i4=i4+bit18")
  (newline 1)
  (insert "if () i4=i4+bit19")
  (newline 1)
  (insert "if () i4=i4+bit20")
  (newline 1)
  (insert "if () i4=i4+bit21")
  (newline 1)
  (insert "if () i4=i4+bit22")
  (newline 1)
  (insert "if () i4=i4+bit23")
  (newline 1)
  (insert "if () i4=i4+bit24")
  (newline 1)
  (insert "if () i4=i4+bit25")
  (newline 1)
  (insert "if () i4=i4+bit26")
  (newline 1)
  (insert "if () i4=i4+bit27")
  (newline 1)
  (insert "if () i4=i4+bit28")
  (newline 1)
  (insert "if () i4=i4+bit29")
  (newline 1)
  (indent-region (mark) (point) nil))


(defun fortran-line-yFx (p1x p1y p2x p2y)
  (interactive "nPoint 1 X: \nnPoint 1 Y: \nnPoint 2 X: \nnPoint 2 Y: ")
  (let* ((slope (/ (- p2y p1y) (- p2x p1x)))
	(y-intercept (- p1y (* slope p1x))))
    (if (< y-intercept 0)
	(insert (format "Y = %f * X - %f" slope (abs y-intercept)))
	(insert (format "Y = %f * X + %f" slope (abs y-intercept))))))


(defun fortran-line-xFy (p1x p1y p2x p2y)
  (interactive "nPoint 1 X: \nnPoint 1 Y: \nnPoint 2 X: \nnPoint 2 Y: ")
  (let* ((slope (/ (- p2y p1y) (- p2x p1x)))
	(y-intercept (- p1y (* slope p1x))))
    (if (< y-intercept 0)
	(insert (format "X = (Y + %f)/%f" (abs y-intercept) slope))
	(insert (format "X = (Y - %f)/%f" (abs y-intercept) slope)))))


(defun fortran-line-yFx-xFy (p1x p1y p2x p2y)
  (interactive "nPoint 1 X: \nnPoint 1 Y: \nnPoint 2 X: \nnPoint 2 Y: ")
  (fortran-line-yFx p1x p1y p2x p2y)
  (newline)
  (fortran-line-xFy p1x p1y p2x p2y)
  (newline))


(defun fact (x)
  (interactive)
  (if (>= x 0)
      (cond ((or (= x 1)
		 (= x 0)) 1) 
	    (t (* x (fact (- x 1)))))
    (error "ERROR: (fact x) requires x >= 0")))

(defun facti (n)
  (interactive)
  (let ((a 1))
    (loop
     (if (= n 1) (return))
     (setq a (* a n))
     (setq n (- n 1)))
    a))
     



(defun nCr (n r)
  "Order does not matter"
  (interactive)
  (if (<= r n)
      (/ (fact n) (* (fact r) (fact (- n r))))
    (error "ERROR: (nCr n r) requires r <= n")))

(defun nCr_o (n r)
  "Order does matter"
  (interactive)
  (if (<= r n)
      (/ (fact n) (fact (- n r)))
    (error "ERROR: (nCr_o n r) requires r <= n")))


;;
;;(defun entropy (p n)
;;  (interactive)
;;  (- (* (- (/ p (+ p n))) (/ (log (/ p (+ p n))) (log 2)))
;;     (* (- (/ n (+ p n))) (/ (log (/ n (+ p n))) (log 2)))))
;;
;;
;;

(defun c-switch-case ()
  (interactive)
  (set-mark (point))
  (insert "switch ()\n{\ncase :\n{\nbreak;\n}\n}")
  (indent-region (mark) (point))
  (search-backward ")"))

;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------

;(setq browse-url-browser-function 'browse-url-mozilla)
;(setq browse-url-mozilla-program "~/mozilla firefox/firefox.exe")



;;;;
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;


;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------

(defun mci (from to)
  (interactive "nfrom: \nnto: ")
  (let ((x from))
    (while (<= x to)
      (insert (number-to-string x))
      (setq x (+ 1 x))
      (open-line 1)
      (next-line 1))))


;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------

(defun rewrite (beg end)
  (interactive "r")
  (copy-region-as-kill beg end)
  (comment-region beg end)
  (yank))


;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------

(defun f77-ops (beg end)
  (interactive "r")

  (goto-char beg)
  (while (search-forward "==" end t)
    (replace-match ".eq." 0))

  (goto-char beg)
  (while (search-forward ">=" end t)
    (replace-match ".ge." 0))

  (goto-char beg)
  (while (search-forward "<=" end t)
    (replace-match ".le." 0))

  (goto-char beg)
  (while (search-forward "/=" end t)
    (replace-match ".ne." 0))

  (goto-char beg)
  (while (search-forward "<" end t)
    (replace-match ".lt." 0))

  (goto-char beg)
  (while (search-forward ">" end t)
    (replace-match ".gt." 0)))


(defun f90-ops (beg end)
  (interactive "r")

  (goto-char beg)
  (while (search-forward ".eq." end t)
    (replace-match "==" 0))

  (goto-char beg)
  (while (search-forward ".ge." end t)
    (replace-match ">=" 0))

  (goto-char beg)
  (while (search-forward ".le." end t)
    (replace-match "<=" 0))

  (goto-char beg)
  (while (search-forward ".ne." end t)
    (replace-match "/=" 0))

  (goto-char beg)
  (while (search-forward ".lt." end t)
    (replace-match "<" 0))

  (goto-char beg)
  (while (search-forward ".gt." end t)
    (replace-match ">" 0)))

;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------

(setq ps-lpr-command "c:\\Ghostgum\\gsview\\gsprint.exe")
;; THis line causes ghostscript to query which printer to
;; use - which you may not need if, for example, you only
;; have one printer.
(setq ps-lpr-switches '("-query"))
(setq ps-printer-name t)
(setq ps-print-header nil)
(setq ps-paper-type 'letter)



;;;;---------------------------------------------------------------------
;;;;---------------------------------------------------------------------
;; insert the current date
(defun insert-current-date ()
  (interactive)
  (insert (format-time-string "%D")))

(global-set-key (kbd "C-c i") 'insert-current-date)


(defun insert-current-time ()
  (interactive)
  (insert (format-time-string "%l:%M%p %Z")))

;;;;---------------------------------------------------------------------
;;;;---------------------------------------------------------------------
;;

(defun ctof (tc)
  (interactive "ncelcius temperature: ")
  (message (format "%f" (+ 32 (* tc 1.8)))))

(defun ftoc (tf)
  (interactive "nfahrenheit temperature: ")
  (message (format "%f" (/ (- tf 32) 1.8))))



;;;;---------------------------------------------------------------------
;;;;---------------------------------------------------------------------
;;
 
(defun cdmysim ()
  (interactive)
  (eshell-trap-errors
   (eshell-named-command "cd"
                         (list (concat "c:/Documents and Settings/keithr/My Documents/my simulators/")))))




;;;;---------------------------------------------------------------------
;;;;---------------------------------------------------------------------
;; 

(defun moveCurrentDirFilesToTargetDir (targetDir)
  (interactive "DDirectory to move files to: ")
  (dolist (fileToMove (directory-files "." t nil t))
    (if (y-or-n-p (concat "Move " fileToMove " to " targetDir))
		  (eshell/mv fileToMove targetDir))))





;;;;---------------------------------------------------------------------
;;;;---------------------------------------------------------------------
;; occur multiple buffers and/or files

;;    (require 'color-moccur)


;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------

(put 'erase-buffer 'disabled nil)
(setq message-log-max 2000)
(put 'narrow-to-region 'disabled nil)



;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;

(add-to-list 'load-path "~/elisp/org/lisp")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)








;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------

(setq capitals '(("Alabama"         . "Montgomery")
                 ("Alaska"          . "Juneau")
                 ("Arizona"         . "Phoenix")
                 ("Arkansas"        . "Little Rock")
                 ("California"      . "Sacramento")
                 ("Colorado"        . "Denver")
                 ("Connecticut"     . "Hartford")
                 ("Delaware"        . "Dover")
                 ("Florida"         . "Tallahassee")
                 ("Georgia"         . "Atlanta")
                 ("Hawaii"          . "Honolulu")
                 ("Idaho"           . "Boise")
                 ("Illinois"        . "Springfield")
                 ("Indiana"         . "Indianapolis")
                 ("Iowa"            . "Des Moines")
                 ("Kansas"          . "Topeka")
                 ("Kentucky"        . "Frankfort")
                 ("Louisiana"       . "Baton Rouge")
                 ("Maine"           . "Augusta")
                 ("Maryland"        . "Annapolis")
                 ("Massachusetts"   . "Boston")
                 ("Michigan"        . "Lansing")
                 ("Minnesota"       . "St. Paul")
                 ("Mississippi"     . "Jackson")
                 ("Missouri"        . "Jefferson City")
                 ("Montana"         . "Helena")
                 ("Nebraska"        . "Lincoln")
                 ("Nevada"          . "Carson City")
                 ("New Hampshire"   . "Concord")
                 ("New Jersey"      . "Trenton")
                 ("New Mexico"      . "Santa Fe")
                 ("New York"        . "Albany")
                 ("North Carolina"  . "Raleigh")
                 ("North Dakota"    . "Bismarck")
                 ("Ohio"            . "Columbus")
                 ("Oklahoma"        . "Oklahoma City")
                 ("Oregon"          . "Salem")
                 ("Pennsylvania"    . "Harrisburg")
                 ("Rhode Island"    . "Providence")
                 ("South Carolina"  . "Columbia")
                 ("South Dakota"    . "Pierre")
                 ("Tennessee"       . "Nashville")
                 ("Texas"           . "Austin")
                 ("Utah"            . "Salt Lake City")
                 ("Vermont"         . "Montpelier")
                 ("Virginia"        . "Richmond")
                 ("Washington"      . "Olympia")
                 ("West Virginia"   . "Charleston")
                 ("Wisconsin"       . "Madison")
                 ("Wyoming"         . "Cheyenne")))

(defun capital-of (state)
  (interactive)
  (cdr (assoc state capitals)))

;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------


(defun knoi001 (aa bb)
  "in LIST bb but not in LIST aa"
  (let (result)
    (dolist (bi bb result)
      (if (not (member bi aa)) (setq result (cons bi result))))))


(defun members-of-and-not-in (l1 l2) (remove nil (mapcar '(lambda (l)
                                                            (if (not (member l l2)) l nil)) l1)))


(defun copy-as-kill-sentence (&optional arg)
  "copy-as-kill from point to end of sentence.
With arg, repeat; negative arg -N means kill back to Nth start of sentence."
  (interactive "p")
  (copy-region-as-kill (point) (progn (forward-sentence arg) (point))))

(defun rotate-car (l1)
  (append (cdr l1) (list (car l1))))


(defun delete-leading-whitespace (str)
  (replace-regexp-in-string "^\\s-*" "" str))


(defun khr-find-marked-files ()
  (interactive)
  (save-excursion
    (dolist (arg (dired-get-marked-files))
      (find-file arg))))


;;<deego> C-M-s .{\85\} for 85 or more character long lines..           [16:17]
;;<deego> C-M-s .{\85,90\} for lines between 85 and 90 characters..
;;<chlunde> Sonderblade: He meant C-M-s RET .\{80\} RET
;;<deego> C-M-s .\{80\} RET


;;(defun rotate-left (l1 &optional n)
;;  "Rotate elements of LIST left."
;;  (append (cdr l1) (list (car l1))))



;; Loop over lines of region doing some action    

;;    
;;    (defun procLines (top bottom)
;;      (interactive "r")
;;      (save-excursion
;;        (let ((end-marker (progn
;;                      (goto-char bottom)
;;                      (beginning-of-line)
;;                      (point-marker)))
;;        next-line-marker)
;;          (goto-char top)
;;          (if (not (bolp))
;;        (forward-line 1))
;;          (setq next-line-marker (point-marker))
;;          (while (< next-line-marker end-marker)
;;      (goto-char next-line-marker)
;;      (save-excursion
;;        (forward-line 1)
;;        (set-marker next-line-marker (point)))
;;      (insert "*****"))
;;          (set-marker end-marker nil)
;;          (set-marker next-line-marker nil))))




(defun transformThemPlease ()
  (interactive)
  (while (re-search-forward "^[0-9]" nil t nil)
    (cond ((= (string-to-number (match-string 0)) 0) (insert " = 1 0 0 0 0 0 0 0 0 0"))
	  ((= (string-to-number (match-string 0)) 1) (insert " = 0 1 0 0 0 0 0 0 0 0"))
	  ((= (string-to-number (match-string 0)) 2) (insert " = 0 0 1 0 0 0 0 0 0 0"))
	  ((= (string-to-number (match-string 0)) 3) (insert " = 0 0 0 1 0 0 0 0 0 0"))
	  ((= (string-to-number (match-string 0)) 4) (insert " = 0 0 0 0 1 0 0 0 0 0"))
	  ((= (string-to-number (match-string 0)) 5) (insert " = 0 0 0 0 0 1 0 0 0 0"))
	  ((= (string-to-number (match-string 0)) 6) (insert " = 0 0 0 0 0 0 1 0 0 0"))
	  ((= (string-to-number (match-string 0)) 7) (insert " = 0 0 0 0 0 0 0 1 0 0"))
	  ((= (string-to-number (match-string 0)) 8) (insert " = 0 0 0 0 0 0 0 0 1 0"))
	  ((= (string-to-number (match-string 0)) 9) (insert " = 0 0 0 0 0 0 0 0 0 1")))))


;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;

(defun goto-column (column)
  " "
  (interactive "nColumn: ")
  (if (< (current-column) column)
      (forward-char (- column (current-column)))
    (forward-char (apply '- (list (- (current-column) column))))))

;; should use move-to-column ?

;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;

(defun delete-whitespace-forward ()
  (interactive)
  (re-search-forward "[ \t\nr]+" nil t nil)
  (replace-match ""))



;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;

(defun create-spda-label (colNum)
  (interactive "nColNum: ")
  (goto-column colNum)
  (insert "spda2_")
  (delete-whitespace-forward)
  (move-end-of-line nil)
  (re-search-forward "^[0-9]+" nil t nil))


;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;

(defun copy-regexp-to-line-begin ()
  (interactive) 
;  (re-search-forward "spda[12]_[A-Za-z0-9]+" nil t nil)
  (re-search-forward "PM[0-9]+-[0-9]+" nil t nil)
  (move-beginning-of-line nil)
  (insert (match-string 0))
  (insert " ")
  (move-end-of-line nil)
  (re-search-forward "^spda[12]_" nil t nil))  
;  (re-search-forward "^[0-9]+" nil t nil))


;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;

(defun replace-whitespace-with-comma (rbeg rend)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region rbeg rend)
      (goto-char rbeg)
      (while (re-search-forward "[ \t\n]+" nil t nil)
	(replace-match ",")))))



(defun replace-comma-with-whitespace (rbeg rend)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region rbeg rend)
      (goto-char rbeg)
      (while (re-search-forward "," nil t nil)
	(replace-match "  ")))))






(defun replace-whitespace-with-fortran-or (rbeg rend)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region rbeg rend)
      (goto-char rbeg)
      (while (re-search-forward "[ \t\n]+" nil t nil)
	(replace-match " .or. ")))))



(defun replace-XOXOXXXOOOXOXOX-with-filename (fname)
  (interactive "f")
  (save-excursion
;    (save-restriction
;      (narrow-to-region rbeg rend)
;      (goto-char rbeg)
      (while (re-search-forward "XOXOXXXOOOXOXOX" nil t nil)
	(replace-match " .or. "))))




;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;

;; (defun eshell/bufferList ()
;;   (interactive)
;;   (insert "\n")
;;   (dolist (cBuffer (buffer-list)) 
;;     (insert (format "%s\n" (buffer-name cBuffer)))))



;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;-------------------------------------------------------------------------
;;;;;;;

;;  (defun oneOff-shedModeID ()
;;    (interactive)
;;    (move-to-column 36 t)      ;seq 1 single gen
;;    (move-to-column 41 t)      ;seq 2 single gen
;;    (move-to-column 46 t)      ;seq 3 single gen
;;    (move-to-column 51 t)      ;single TRU
;;    (move-to-column 56 t)      ;apu gnd norm
;;    (move-to-column 61 t)      ;apu gnd seq 1
;;    (move-to-column 66 t)      ;apu gnd seq 2
;;    (move-to-column 72 t)      ;apu office
;;    (move-to-column 77 t)      ;apu air tier 1
;;    (move-to-column 84 t)      ;apu air tier 2
;;    (move-to-column 91 t)      ;hmdg
;;    (move-to-column 97 t)      ;batt only
;;    (move-to-column 104 t))    ;batt refuel



(defun oneOff-convertShedModes (rbeg rend)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region rbeg rend)
      (goto-char rbeg)
      (while (re-search-forward "X" nil t nil)
	(cond ((= (current-column) (+ 1 36))    (replace-match "1"))
	      ((= (current-column) (+ 1 41))    (replace-match "2"))
	      ((= (current-column) (+ 1 46))    (replace-match "3"))
	      ((= (current-column) (+ 1 51))    (replace-match "4"))
	      ((= (current-column) (+ 1 56))    (replace-match "5"))
	      ((= (current-column) (+ 1 61))    (replace-match "6"))
	      ((= (current-column) (+ 1 66))    (replace-match "7"))
	      ((= (current-column) (+ 1 72))    (replace-match "8"))
	      ((= (current-column) (+ 1 77))    (replace-match "9"))
	      ((= (current-column) (+ 1 84))    (replace-match "A"))
	      ((= (current-column) (+ 1 91))    (replace-match "B"))
	      ((= (current-column) (+ 1 97))    (replace-match "C"))
	      ((= (current-column) (+ 1 104))   (replace-match "D")))))))

;;(replace-match "1")) 


(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
			 ("gnu" . "http://elpa.gnu.org/packages/")))


;; Python stuff
(add-to-list 'load-path "~/elisp/python-mode/")
(setq py-install-directory "~/elisp/python-mode/")
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
 (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
 (add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'python-mode-hook
           (lambda ()
             (set (make-variable-buffer-local 'beginning-of-defun-function)
                  'py-beginning-of-def-or-class)
             (setq outline-regexp "def\\|class ")))

(setq py-shell-name "c:/cygwin/usr/bin/python")



(add-to-list 'load-path "~/elisp/helm")
(require 'helm-config)
(helm-mode 1)

(autoload 'find-sln "sln-mode")



;;  (require 'col-highlight) ; Load this file (and `vline');;
;;  If you want to turn on continual current-column highlighting by
;;  default, then add this to your init file:
;;
;;    (column-highlight-mode 1)
;;
;;  If you want to turn on automatic idle highlighting of the current
;;  column, then add this to your init file:
;;
;;    (toggle-highlight-column-when-idle 1)
;;
;;  If you want to use a different wait interval, before idle
;;  highlighting begins, then set it in your init file using
;;  `col-highlight-set-interval':
;;
;;    (col-highlight-set-interval 6) ; Wait 6 idle secs.

;;(load "~/elisp/icicles-install")
(add-to-list 'load-path "~/elisp/icicles/")
(require 'icicles)

(require 'apropos-fn+var)
(require 'bookmark+)
(require 'col-highlight)
(require 'crosshairs)
(require 'doremi-frm)
(require 'doremi)
(require 'frame-cmds)
(require 'fuzzy-match)
(require 'hexrgb)
(require 'hl-line+)
(require 'icomplete+)
(eval-after-load "info" '(require 'info+))
(require 'lacarte)
(require 'mb-depth+)
(require 'pp+)
(require 'synonyms)
(require 'thingatpt+)
(require 'vline)

(icy-mode 1)




(display-time-mode 1)


(eshell)
(make-frame-command)
