(setq gc-cons-threshold 134217728)
(require 'cl)

;; 引数の directory とその sub_directory を load-path に追加
(defun add-to-load-path (&rest paths)
   (let (path)
     (dolist (path paths paths)
       (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
         (add-to-list 'load-path default-directory)
         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
             (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp")
(add-to-load-path "site-lisp")

;; package.el
;; M-x package-refresh-contents で repository を最新にする
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; cask.el
(condition-case err
    (progn
      (let
          ((homebrew-cask-path (concat (getenv "HOMEBREW_PREFIX") "/share/emacs/site-lisp/cask/cask.el"))
           (cask-path "~/.cask/cask.el"))
        (if (file-exists-p homebrew-cask-path)
            (require 'cask homebrew-cask-path))
        (if (file-exists-p cask-path)
            (require 'cask cask-path)))

      (cask-initialize)
      (require 'pallet)
      (pallet-mode t))
  (error "Load error cask.el: %s" err))

;; initchart
;; (require 'initchart)
;; (initchart-record-execution-time-of load file)
;; (initchart-record-execution-time-of require feature)

;; init-loader.el
(require 'init-loader)
(setq init-loader-show-log-after-init nil) ;; debug したい時は t にする
(init-loader-load "~/.emacs.d/inits")
