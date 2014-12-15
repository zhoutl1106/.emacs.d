;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;

;; load Org-mode from source when the ORG_HOME environment variable is set
(when (getenv "ORG_HOME")
  (let ((org-lisp-dir (expand-file-name "lisp" (getenv "ORG_HOME"))))
    (when (file-directory-p org-lisp-dir)
      (add-to-list 'load-path org-lisp-dir)
      (require 'org))))

;; load the starter kit from the `after-init-hook' so all packages are loaded
(add-hook 'after-init-hook
 `(lambda ()
    ;; remember this directory
    (setq starter-kit-dir
          ,(file-name-directory (or load-file-name (buffer-file-name))))
    ;; only load org-mode later if we didn't load it just now
    ,(unless (and (getenv "ORG_HOME")
                  (file-directory-p (expand-file-name "lisp"
                                                      (getenv "ORG_HOME"))))
       '(require 'org))
    ;; load up the starter kit
    (org-babel-load-file (expand-file-name "starter-kit.org" starter-kit-dir))))

;;; init.el ends here

;;w3m配置项（用于上网）
(add-to-list 'load-path "C:/Users/heu/AppData/Roaming/.emacs.d/w3m-lisp") ;;w3m所需要的lisp文件，所在路径
(add-to-list 'load-path "~/.emacs.d/w3m-lisp") ;;w3m所需要的lisp文件，所在路径
(add-to-list 'exec-path "c:/emacs-24.3/w3m") ;;指定w3m可执行程序，所在的执行路径
(require 'w3m-load)
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.baidu.com")

(add-to-list 'load-path "C:/Users/heu/AppData/Roaming/.emacs.d/lisp") 
(add-to-list 'load-path "~/.emacs.d/lisp") 
(require 'color-theme)
(color-theme-initialize)
(color-theme-midnight)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(server-start)
