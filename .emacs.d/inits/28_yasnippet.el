(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x y i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x y n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x y v") 'yas-visit-snippet-file)

;; trigger key の変更
(define-key yas-minor-mode-map (kbd "SPC") 'yas/expand)
(define-key yas-minor-mode-map (kbd "TAB") nil)
