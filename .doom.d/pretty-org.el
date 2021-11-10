;; some stuff to make org look better, load it, if you want it


(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height."
  (interactive)
  (if (eq line-spacing nil)
      (setq line-spacing 0.40) ; add 0.5 height between lines
    (setq line-spacing nil)   ; no extra heigh between lines
    )
  (redraw-frame (selected-frame)))

(bind-key "C-c v" #'toggle-line-spacing)

(custom-set-faces
 `(org-document-title ((t (:height 2.0 :foreground "grey"))))
 )

(use-package! org-variable-pitch
  :hook
  (org-mode . org-variable-pitch-minor-mode)
  )

(custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "cyan" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))


;;(custom-set-faces
;  '(org-level-1 ((t (:inherit outline-1 :height 1.65)))) ;:foreground "grey"))))
;  '(org-level-2 ((t (:inherit outline-2 :height 1.5)))) ;:foreground "grey"))))
;  '(org-level-3 ((t (:inherit outline-3 :height 1.35)))) ;:foreground "grey"))))
;  '(org-level-4 ((t (:inherit outline-4 :height 1.2)))) ;:foreground "grey"))))
;  '(org-level-5 ((t (:inherit outline-5 :height 1.0)))) ;:foreground "grey"))))
;  )
;

(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis " >>>" ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([+]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "◦"))))))

 (add-hook `org-mode `toggle-line-spacing)
