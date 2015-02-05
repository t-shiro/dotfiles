;; 言語設定
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)

;; load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/ess/")

;; Mac向けの言語設定
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs)
  )

;; ソースに色づけ
(global-font-lock-mode t)


;; コメントの色をフックして変更してる
(add-hook 'font-lock-mode-hook
          '(lambda ()
             (set-face-foreground 'font-lock-comment-face "#ffff00")
             )
          )

;; package.elの拡張
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; スタートアップ画面非表示
(setq inhibit-startup-screen t)

;; シンボリックリンクを開く時の質問を表示しない
(setq vc-follow-symlinks t)

;; 行番号表示
(global-linum-mode t)

(set-face-attribute 'linum nil
                    :foreground "#66cdaa"
                    ;;"行番号枠の"背景色。
                    ;;:background "#ffff00"
                    :height 0.9)

(set-face-attribute 'mode-line-inactive nil
                    :foreground "#ffff00"
                    )

;; 行番号の後ろに一つスペースを入れる
(setq linum-format "%1d ");

;; C-kで行を一括削除
(setq kill-whole-line t)

;; カーソル行ハイライト
(global-hl-line-mode)
(setq hl-line-face 'underline)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; インデント設定 タブをスペース4つに入れ替え
;;(global-set-key (kbd "TAB") 'self-insert-command)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default global-indent-line-function 'tab-to-tab-stop)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
;; だいたいの言語のインデント設定はc-modeに依るらしいのでstroustrup(4スペース)にしてる

(add-hook 'c-mode-common-hook
          (lambda()
            (c-set-style "stroustrup")
            ))

;;Rubyのインデント設定
(setq ruby-indent-level 4
      ruby-indent-tabs-mode nil
      )


(add-hook 'text-mode-common-hook
          (lambda()
            (c-set-style "stroustrup")
            ))

;;タブやスペースを色付け / 要改良
;;(global-whitespace-mode 1)

;; タイトルバーに開いてるファイル名を表示
(setq frame-title-format "%f")

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)

;; 矩形選択。C-Ret
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; 対応する括弧と中身の強調
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "Orange")
(set-face-foreground 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;; クォートで囲われた文字色の変更
;; see http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html#fontlock
(set-face-foreground 'font-lock-string-face "LightSeaGreen")
(set-face-foreground 'font-lock-function-name-face "Orange")

;; M-Iでindent-region
(global-set-key "\M-I" 'indent-region)

;; auto-install
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
;;(require 'auto-install)
;;(auto-install-update-emacswiki-package-name t)
;;(auto-install-compatibility-setup)


;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; R-mode
(setq auto-mode-alist
      (cons (cons "\\.r$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)

;; 括弧の補完
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;; SSH越しにファイルを編集出来る様にtrampの設定
(require 'tramp)

;; 改行した時一緒にインデント
(global-set-key "\C-m" 'newline-and-indent)

;; シンタックスチェックのflymake
;; (require 'flymake)

;; 全てのファイルに対してflymakeする
;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; Ruby用の補完
;; (require 'ruby-electric)
;; (add-hook 'ruby-mode-hook
;;           '(lambda ()
;;              (ruby-electric-mode t)))
;; (setq ruby-electric-expand-delimiters-list nil)

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

(require 'twittering-mode)
(setq twittering-use-master-password t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-table ((t (:foreground "Green"))))
 '(org-link ((t (:foreground "Red"))))
 )


;; C-hで一文字消去
(keyboard-translate ?\C-h ?\C-?)

;; C-zをtmuxで使うために殺す
(global-set-key "\C-z" 'forward-word)

;; 同上
(global-set-key "\C-t" nil)


(global-set-key [f1] 'backward-word)
(global-set-key [f2] 'forward-word)
(global-set-key (kbd "C-]") 'backward-word)


;; 変更予定キー
;; C-Space (Mark set) (C-2で代用)
;; C-\ (変換切り替え) (C-4で代用)

;; nnで「ん」を出す為の設定
(setq quail-japanese-use-double-n t)


(require 'gtags)
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))
;; c-modeで自動的にgtags-modeに切り替える
(add-hook 'c-mode-common-hook
          '(lambda ()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))
