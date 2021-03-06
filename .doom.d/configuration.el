(setq user-full-name "Sam Barrett"
      user-mail-address "barrett370@gmail.com")

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(setq ispell-dictionary "british-ise")
(setq doom-theme 'doom-one)
(setq org-directory "~/org/")
(global-linum-mode 0)
(setq display-line-numbers-type t)
(setq doom-font (font-spec :family "FiraCode" :size 18))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-set-style "k&r")
(setq c-basic-offset 4)

(setq treemacs-file-ignore-extensions
      '(;; LaTeX
        "aux"
        "ptc"
        "fdb_latexmk"
        "fls"
        "synctex.gz"
        "toc"
        ;; LaTeX - glossary
        "glg"
        "glo"
        "gls"
        "glsdefs"
        "ist"
        "acn"
        "acr"
        "alg"
        ;; LaTeX - pgfplots
        "mw"
        ;; LaTeX - pdfx
        "pdfa.xmpi"
        ))
(setq treemacs-file-ignore-globs
      '(;; LaTeX
        "*/_minted-*"
        ;; AucTeX
        "*/.auctex-auto"
        "*/_region_.log"
        "*/_region_.tex"))

;;(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

(define-key evil-normal-state-map (kbd "C-h") #'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") #'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") #'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") #'evil-window-right)

(define-key evil-normal-state-map (kbd "M-l") #'next-buffer)
(define-key evil-normal-state-map (kbd "M-h") #'previous-buffer)

(define-key evil-normal-state-map (kbd "M-C-l") #'enlarge-window-horizontally)
(define-key evil-normal-state-map (kbd "M-C-h") #'shrink-window-horizontally)
(define-key evil-normal-state-map (kbd "M-C-j") #'enlarge-window)
(define-key evil-normal-state-map (kbd "M-C-k") #'shrink-window)

(add-to-list 'auto-mode-alist '("Justfile" . makefile-mode))

(setq +latex-viewers '(zathura))
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -shell-escape %S%(PDFout)")))
;(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)

(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t)
  )
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{prooftree}" t)
  )
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{minted}" t)
  )
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{enumerate}" t)
  )
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{itemize}" t)
  )

(setq pdf-latex-command "/home/sam/.scripts/latexcompile.sh")

(after! evil-surround
  (add-hook 'latex-mode (lambda ()
                           (push '(?\" . ("``" . "''")) evil-surround-pairs-alist)))
  (add-hook 'latex-mode (lambda ()
                           (push '(?i . ("\textit{" . "}")) evil-surround-pairs-alist)))
)

(after! org
  (add-to-list 'org-capture-templates
             '("J" "New Job application" entry
               (file "~/org/job-applications.org" )
               "\n* APPLIED Company: %^{name} \nDate: %U \nRole: [[%^{title}][%^{url}]] \nNotes: %? \n")
             )
  )
(after! org
  (add-to-list 'org-capture-templates
             '("l" "New weekly log" plain
               (file (lambda ()
                       (concat
                        (concat "~/git-clones/Y4-Diss/research/logs/log-"
                                (org-read-date nil nil "-mon" nil nil ))
                        ".org")))
               "#+TITLE: Log Week %^{weeknumber} \n#+OPTIONS: toc:nil \n\n %?"
               )
             )
  )
(after! org
  (add-to-list 'org-capture-templates
               '("T" "Task" entry (file+headline "/home/sam/org/notes.org" "Tasks") "* TODO %?
  %u
  %a" :prepend t)))

(after! org
  (add-to-list 'org-todo-keywords
        '(sequence "APPLIED(a)" "INTERVIEW(i)" "OFFER(o)" "|" "ACCEPTED(y)" "REJECTED(r)" "NORESPONSE(n)")
        )
  (add-to-list 'org-todo-keyword-faces
               '("APPLIED" . "yellow")
               )
  (add-to-list 'org-todo-keyword-faces
               '("INTERVIEW" . "blue")
               )
  (add-to-list 'org-todo-keyword-faces
               '("OFFER" . "teal")
               )
  (add-to-list 'org-todo-keyword-faces
               '("ACCEPTED" . "green")
               )
  (add-to-list 'org-todo-keyword-faces
               '("REJECTED" . "red")
               )
  (add-to-list 'org-todo-keyword-faces
               '("NORESPONSE" . "red")
               )
  )

(defun update-job-table ()
  (interactive)
  (shell-command "/home/sam/.scripts/jobapps2table.py > /home/sam/org/jobappstable.org")
  (progn
    (find-file "/home/sam/org/jobappstable.org")
    (org-table-iterate-buffer-tables)
    (goto-line 4)
    (org-table-goto-column 3)
    (org-table-sort-lines nil ?t)
    (save-buffer)
    )
  )

(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿")
)

(defun nolinum ()
  (global-linum-mode 0)
)
(add-hook 'demo-it-mode-adv-hook 'nolinum   )

(setq org-tree-slide-header nil)
(setq org-tree-slide-slide-in-effect nil)

(setq matlab-shell-command "start-matlab.sh")
(setq matlab-shell-command-switches (list "-nodesktop"))

(after! lsp-julia
    (setq lsp-julia-default-environment "~/.julia/environments/v1.5/")
)
