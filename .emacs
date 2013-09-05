;;言語設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")

;;Mac向けの言語設定
(when (eq system-type 'darwin)
    (require 'ucs-normalize)
        (set-file-name-coding-system 'utf-8-hfs)
            (setq locale-coding-system 'utf-8-hfs))


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
(setq-default global-indent-tabs-mode nil)
(setq-default global-tab-width 4)
(setq-default global-indent-line-function 'insert-tab)

;; だいたいの言語のインデント設定はc-modeに依るらしいのでstroustrup(4スペース)にしてる
(add-hook 'c-mode-common-hook
    (lambda()
            (c-set-style "stroustrup")
                ))

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
(set-face-background 'show-paren-match-face "blue")
(set-face-foreground 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;; クォートで囲われた文字色の変更
;; see http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html#fontlock
(set-face-foreground 'font-lock-string-face "LightSeaGreen")
(set-face-foreground 'font-lock-function-name-face "Orange")

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

;; 改行した時一緒にインデント
(global-set-key "\C-m" 'newline-and-indent)

;; シンタックスチェックのflymake
(require 'flymake)

;; 全てのファイルに対してflymakeする
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Ruby用の補完
(require 'ruby-electric)
(add-hook 'ruby-mode-hook
    '(lambda ()
         (ruby-electric-mode t)))
         (setq ruby-electric-expand-delimiters-list nil)

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)


