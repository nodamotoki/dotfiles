

(add-to-list 'load-path (concat user-emacs-directory "elisp"))


;; font-lock のレベルを2に下げて速くする
(setq font-lock-maximum-decoration '((c-mode . 2) (c++-mode . 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; テーマの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(load-theme 'adwaita t)
;(load-theme 'deeper-blue t)
;(load-theme 'dichromacy t)
;(load-theme 'light-blue t)
;(load-theme 'manoj-dark t)
;(load-theme 'misterioso t)
;(load-theme 'tango t)
;(load-theme 'tango-dark t)
;(load-theme 'tsdh-dark t)
;(load-theme 'tsdh-light t)
;(load-theme 'wheatgrass t)
;(load-theme 'whiteboard t)
(load-theme 'wombat t)

;;; パッケージの設定
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 文字コード
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; デフォルトの文字コード
(set-default-coding-systems 'utf-8-unix)

;; テキストファイル／新規バッファの文字コード
(prefer-coding-system 'utf-8-unix)

;; ファイル名の文字コード
(set-file-name-coding-system 'utf-8-unix)

;; キーボード入力の文字コード
(set-keyboard-coding-system 'utf-8-unix)

;; サブプロセスのデフォルト文字コード
(setq default-process-coding-system '(undecided-dos . utf-8-unix))

;; 環境依存文字 文字化け対応
(set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
                      'katakana-jisx0201 'iso-8859-1 'cp1252 'unicode)
(set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)

;;; splash screenを無効にする
(setq inhibit-splash-screen t)

;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

;; C-u C-SPC C-SPC ...でどんどん過去のマークを遡る
(setq set-mark-command-repeat-pop t)

;;; 複数のディレクトリで同じファイル名のファイルを開いたときのバッファ名を調整する
(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;;; ファイルを開いた位置を保存する
(require 'saveplace)
(save-place-mode 1)

;;; 釣合う括弧をハイライトする
(show-paren-mode 1)

;;; インデントにTABを使う(t) or 使わない(nil)
(setq-default indent-tabs-mode t)

;;; 現在行に色をつける(0:つけない 1:つける)
(global-hl-line-mode 1)

;;; ミニバッファ履歴を次回Emacs起動時にも保存する
(savehist-mode 1)

;;; シェルに合わせるため、C-hは後退に割り当てる
;(global-set-key (kbd "C-h") 'delete-backward-char)

;;; モードラインに時刻を表示する
(display-time)

;;; 行番号・桁番号を表示する
(line-number-mode 1)
(column-number-mode 1)

;;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; ログの記録行数を増やす
(setq message-log-max 1000)

;;; 履歴をたくさん保存する
(setq history-length 1000)

;;; メニューバーとツールバーとスクロールバーを消す
(menu-bar-mode -1)
;(tool-bar-mode -1)
;(scroll-bar-mode 0)


;; 初期画面の非表示（有効：t、無効：nil）
(setq inhibit-startup-message nil)
(setq inhibit-startup-screen nil)

;; バッファ画面外文字の切り詰め表示（有効：t、無効：nil）
(setq truncate-lines nil)

;; ウィンドウ縦分割時のバッファ画面外文字の切り詰め表示（有効：t、無効：nil）
(setq truncate-partial-width-windows t)

;; カーソルの点滅（有効：1、無効：0）
(blink-cursor-mode 0)

;; 非アクティブウィンドウのカーソル表示（有効：t、無効：nil）
(setq-default cursor-in-non-selected-windows t)

;; 大文字・小文字を区別しないでサーチ（有効：t、無効：nil）
(setq-default case-fold-search t)

;; インクリメント検索時に縦スクロールを有効化（有効：t、無効：nil）
(setq isearch-allow-scroll t)

;; ;; C-dで検索文字列を一文字削除
;; (define-key isearch-mode-map (kbd "C-d") 'isearch-delete-char)
;; 
;; ;; C-yで検索文字列にヤンク貼り付け
;; (define-key isearch-mode-map (kbd "C-y") 'isearch-yank-kill)
;; 
;; ;; C-eで検索文字列を編集
;; (define-key isearch-mode-map (kbd "C-e") 'isearch-edit-string)
;; 
;; ;; Tabで検索文字列を補完
;; (define-key isearch-mode-map (kbd "TAB") 'isearch-yank-word)
;; 
;; ;; C-gで検索を終了
;; (define-key isearch-mode-map (kbd "C-g")
;;   '(lambda() (interactive) (isearch-done)))

;; C-k で改行も削除
(setq kill-whole-line t)

;; モードラインに関数名を表示
(which-function-mode 1)

;; File メニューに最近開いたファイルが出てくる
(recentf-mode)

;; スクロールは１行ごとに
;; 効かない ;; (setq scroll-conservatively 1)

;; タブ4
(setq default-tab-width 4)

;; .h ファイルを C++ ファイルとみなす
(setq auto-mode-alist (cons '("\\.h\\'" . c++-mode) auto-mode-alist))

;; M-x compile 実行時のデフォルトコマンド
;;(setq compile-command "date; gcc -g -Wall -o ")

;; *compilation* バッファの行数
(setq-default compilation-window-height 10)

;; リージョン選択中にキー入力があるとリージョン全体を上書き
(delete-selection-mode 1)

;; Auto-Revert
(global-auto-revert-mode t)

;; find file at point #include <stdio.h>とか開いてくれる
;; 従来のFindFindはC-u C-x C-Fとなる。
(ffap-bindings)
(setq ffap-c-path
      '("/usr/include"
		"/usr/local/include"
		"../include"))

;; キー入力中の画面更新を抑止（有効：t、無効：nil）
(setq redisplay-dont-pause t)

;; recenter-top-bottomのポジション
(setq recenter-positions '(middle top bottom))


;; キー入力中の画面更新を抑止（有効：t、無効：nil）
(setq redisplay-dont-pause t)

;; recenter-top-bottomのポジション
(setq recenter-positions '(middle top bottom))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Mouse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(xterm-mouse-mode t)
(global-set-key [mouse-4] '(lambda () (interactive) (scroll-down 3)))
(global-set-key [mouse-5] '(lambda () (interactive) (scroll-up   3)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Scroll
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; redisplay wil never recenter point
(setq-default scroll-conservatively 1000)

;; スクロール行数
(setq-default scroll-step 0)

;; scroll-margin
(setq-default scroll-margin 10)

;; 横スクロール時の列数
(setq-default hscroll-step 0)

;; 横スクロール開始の残り列数
(setq-default hscroll-margin 10)

;; スクロール時にカーソル位置を保持
(setq scroll-preserve-screen-position t)

;; 画面スクロール時の重複表示する行数
(setq next-screen-context-lines 1)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; C Mode Hook
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .h ファイルを C++ ファイルとみなす
(setq auto-mode-alist (cons '("\\.h\\'" . c++-mode) auto-mode-alist))

(defun my-c-mode-common-hook ()
  ;; My customizations for all of c-mode and related modes

  ;; コンパイルのときに毎回訊きに来ない
  ;;(setq compilation-read-command nil)

  ;; compileのときに使うコマンド
  ;;(set (make-local-variable 'compile-command) "make -k -C ../../Build")

  ;; コメント開始位置
  (setq	comment-column 48)

  ;; 先頭でのTabのみインデント処理する。Tab <==> M-i の入れ替えをするので不要
  ;; (setq c-tab-always-indent nil)

  ;; { の入力などで自動インデント処理
  ;; (setq c-auto-newline t)

  ;; 基本インデント量
  (setq c-basic-offset 4)

  ;; Tabは4
  (setq tab-width 4)

  ;; タブストップの位置
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128 132 136 140 144 148 152 156 160))

  ;; case sensitive
  ;;(setq case-fold-search nil)
  (setq case-fold-search t)

  ;; 後退の時タブをスペースに変換しない
  (setq c-backspace-function 'backward-delete-char)

  ;; インデント情報の表示
  (setq c-echo-syntactic-information-p t)

  ;; EnterとC-jの交換
  (local-set-key "\C-m" 'newline-and-indent)		;; ReturnをC-jにする
  (local-set-key "\C-j" 'newline)					;; C-jをReturnにする

  ;; TabとM-iの交換
  ;;(local-set-key "\C-i" 'tab-to-tab-stop)			;; Tabキーを普通のTabに
  ;;(local-set-key "\M-i" 'c-indent-command)		;; M-iキーをインデントにする

  ;; 右端で折り返さない
  ;;(setq truncate-lines t)                 ;; 右端で折り返さない cmd:toggle-truncate-lines
  ;;(setq truncate-partial-width-windows t) ;; C-x 3等縦分割ウィンドウで右端で折り返さない

  ;; 行番号を表示
  ;; (linum-mode t)

  ;; コメント開始・終了文字列
  (setq comment-start "/\* ")
  (setq comment-end " \*/")

  ;; styleの選択
  (c-set-style "stroustrup")
  ;;(c-set-style "whitesmith")

  ;; インデント規則 (c-set-style の後に設定する必要がある)
  ;; if/for/whileなどの次の行はインデントそのまま。
  ;;(c-set-offset 'substatement-open 0)
  ;;(c-set-offset 'comment-intro 0)
  ;; namespace 内ではインデントしない
  (c-set-offset 'innamespace 0)

  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Backup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; *.~ といった backup を作らない
(setq make-backup-files nil)

;; .#* とかの backup を作らない
(setq auto-save-default nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; キーマップ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [f11] 'bs-cycle-previous)
;;(global-set-key [S-f12] 'bs-cycle-previous)
(global-set-key [f12] 'bs-cycle-next)

;; C-z では、suspend-emacs関数が呼ばれるが、C-x C-zでも同じ
;; なので、C-z はUndoにする
(global-set-key "\C-z" 'undo) ;; C-/, C-_, C-x u (Undo)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Migemo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'migemo)
;; (setq migemo-command "cmigemo")
;; (setq migemo-options '("-q" "--emacs"))

;; ;; 辞書ファイルを環境に合わせて設定してください！
;; (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")

;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)
;; (setq migemo-coding-system 'utf-8-unix)
;; (load-library "migemo")
;; (migemo-init)
;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; linum-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customize でやろう。
;; ;; 行番号の書式
;; (defvar linum-format nil)
;; (setq linum-format "%4d ")

;; ;;; 行番号を表示する
;; (global-linum-mode t)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Doxymacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'doxymacs)
;;(add-hook 'c-mode-common-hook 'doxymacs-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Keisen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; 罫線lispの設定
;; (if window-system
;;     (autoload 'keisen-mode "keisen-mouse" "MULE 版罫線モード + マウス" t)
;;   (autoload 'keisen-mode "keisen-mule" "MULE 版罫線モード" t))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; point-undo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'point-undo)
;; (define-key global-map [f7] 'point-undo)
;; (define-key global-map [S-f7] 'point-redo)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Gtags
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (autoload 'gtags-mode "gtags" "" t)
;; (add-hook 'gtags-mode-hook
;; 	  '(lambda ()
;; 		; Local customization (overwrite key mapping)
;; 		;(define-key gtags-mode-map "\C-f" 'scroll-up)
;; 		;(define-key gtags-mode-map "\C-b" 'scroll-down)
;; 	     (define-key gtags-mode-map "\M-s" 'gtags-find-symbol)
;; 	     (define-key gtags-mode-map "\M-r" 'gtags-find-rtag)
;; 	     (define-key gtags-mode-map "\C-]" 'gtags-find-tag-from-here)
;; 	     (define-key gtags-mode-map "\C-t" 'gtags-pop-stack)
;; 	     ))
;; (add-hook 'gtags-select-mode-hook
;; 	  '(lambda ()
;; 	     (setq hl-line-face 'underline)
;; 	     (hl-line-mode 1)
;; 	     ))
;; ;;(add-hook 'c-mode-hook
;; (add-hook 'c-mode-common-hook
;; 	  '(lambda ()
;; 	     (gtags-mode 1)))
;; Customization
;; (setq gtags-suggested-key-mapping t)
;; (setq gtags-auto-update t)


;; Key mapping in gtags.el 
;;;; ;; Key mapping of gtags-mode.
;;;; (if gtags-suggested-key-mapping
;;;;     (progn
;;;;       ; Current key mapping.
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "h") 'gtags-display-browser)
;;;;       (define-key gtags-mode-map "\C-]" 'gtags-find-tag-from-here)
;;;;       (define-key gtags-mode-map "\C-t" 'gtags-pop-stack)
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "P") 'gtags-find-file)
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "f") 'gtags-parse-file)
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "g") 'gtags-find-with-grep)
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "I") 'gtags-find-with-idutils)
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "s") 'gtags-find-symbol)
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "r") 'gtags-find-rtag)
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "t") 'gtags-find-tag)
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "d") 'gtags-find-tag)
;;;;       (define-key gtags-mode-map (concat gtags-prefix-key "v") 'gtags-visit-rootdir)
;;;;       ; common
;;;;       (define-key gtags-mode-map "\e*" 'gtags-pop-stack)
;;;;       (define-key gtags-mode-map "\e." 'gtags-find-tag)
;;;;       (define-key gtags-mode-map "\C-x4." 'gtags-find-tag-other-window)
;;;;       (if gtags-disable-pushy-mouse-mapping nil
;;;;         (if gtags-running-xemacs nil
;;;;           (define-key gtags-mode-map [mouse-3] 'gtags-pop-stack)
;;;;           (define-key gtags-mode-map [mouse-2] 'gtags-find-tag-by-event))
;;;;         (if (not gtags-running-xemacs) nil
;;;;           (define-key gtags-mode-map 'button3 'gtags-pop-stack)
;;;;           (define-key gtags-mode-map 'button2 'gtags-find-tag-by-event))))
;;;; )
;;;; ;; Key mapping of old gtags-mode (obsoleted)
;;;; (if (and gtags-suggested-key-mapping gtags-use-old-key-map)
;;;;     (progn
;;;;       ; Old key mapping
;;;;       (define-key gtags-mode-map "\eh" 'gtags-display-browser)
;;;;       (define-key gtags-mode-map "\C-]" 'gtags-find-tag-from-here)
;;;;       (define-key gtags-mode-map "\C-t" 'gtags-pop-stack)
;;;;       (define-key gtags-mode-map "\eP" 'gtags-find-file)
;;;;       (define-key gtags-mode-map "\ef" 'gtags-parse-file)
;;;;       (define-key gtags-mode-map "\eg" 'gtags-find-with-grep)
;;;;       (define-key gtags-mode-map "\eI" 'gtags-find-with-idutils)
;;;;       (define-key gtags-mode-map "\es" 'gtags-find-symbol)
;;;;       (define-key gtags-mode-map "\er" 'gtags-find-rtag)
;;;;       (define-key gtags-mode-map "\et" 'gtags-find-tag)
;;;;       (define-key gtags-mode-map "\ev" 'gtags-visit-rootdir)
;;;;       ; common
;;;;       (define-key gtags-mode-map "\e*" 'gtags-pop-stack)
;;;;       (define-key gtags-mode-map "\e." 'gtags-find-tag)
;;;;       (define-key gtags-mode-map "\C-x4." 'gtags-find-tag-other-window)
;;;;       (if gtags-disable-pushy-mouse-mapping nil
;;;;         (if gtags-running-xemacs nil
;;;;           (define-key gtags-mode-map [mouse-3] 'gtags-pop-stack)
;;;;           (define-key gtags-mode-map [mouse-2] 'gtags-find-tag-by-event))
;;;;         (if (not gtags-running-xemacs) nil
;;;;           (define-key gtags-mode-map 'button3 'gtags-pop-stack)
;;;;           (define-key gtags-mode-map 'button2 'gtags-find-tag-by-event))))
;;;; )
;;;; 
;;;; ;; Key mapping of gtags-select-mode.
;;;; ; The map of key "\C-t" and "\C-m" is always carried out..
;;;; (define-key gtags-select-mode-map "\C-t" 'gtags-pop-stack)
;;;; (define-key gtags-select-mode-map "\C-m" 'gtags-select-tag)
;;;; (if gtags-suggested-key-mapping
;;;;     (progn
;;;;       (define-key gtags-select-mode-map "\e*" 'gtags-pop-stack)
;;;;       (define-key gtags-select-mode-map "\^?" 'scroll-down)
;;;;       (define-key gtags-select-mode-map " " 'scroll-up)
;;;;       (define-key gtags-select-mode-map "\C-b" 'scroll-down)
;;;;       (define-key gtags-select-mode-map "\C-f" 'scroll-up)
;;;;       (define-key gtags-select-mode-map "k" 'previous-line)
;;;;       (define-key gtags-select-mode-map "j" 'next-line)
;;;;       (define-key gtags-select-mode-map "p" 'previous-line)
;;;;       (define-key gtags-select-mode-map "n" 'next-line)
;;;;       (define-key gtags-select-mode-map "q" 'gtags-pop-stack)
;;;;       (define-key gtags-select-mode-map "u" 'gtags-pop-stack)
;;;;       (define-key gtags-select-mode-map "\C-o" 'gtags-select-tag-other-window)
;;;;       (define-key gtags-select-mode-map "\e." 'gtags-select-tag)
;;;;       (if gtags-disable-pushy-mouse-mapping nil
;;;;         (if gtags-running-xemacs nil
;;;;           (define-key gtags-select-mode-map [mouse-3] 'gtags-pop-stack)
;;;;           (define-key gtags-select-mode-map [mouse-2] 'gtags-select-tag-by-event))
;;;;         (if (not gtags-running-xemacs) nil
;;;;           (define-key gtags-select-mode-map 'button3 'gtags-pop-stack)
;;;;           (define-key gtags-select-mode-map 'button2 'gtags-select-tag-by-event))))
;;;; )




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ivy/counsel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-M-j (ivy-immediate-done)	    入力した文字をそのまま使う。counsel-find-file で新規ファイルを作るときなど用
;; M-n (ivy-next-history-element)   文字列の取り込み
;; M-j (ivy-yank-work)		    単語区切りまでを順次取り込み
(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 30)
(setq ivy-count-format "(%d/%d) ")


;;(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c c s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f2> f") 'counsel-describe-function)
(global-set-key (kbd "<f2> v") 'counsel-describe-variable)
(global-set-key (kbd "<f2> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(global-set-key (kbd "C-c c g") 'counsel-git)
(global-set-key (kbd "C-c c j") 'counsel-git-grep)

;; C-u 付けると検索ディレクトリを変更できる
(global-set-key (kbd "C-c c k") 'counsel-ag)
(global-set-key (kbd "C-c c l") 'counsel-locate)
(global-set-key (kbd "C-c c o") 'counsel-rhythmbox)

(global-set-key (kbd "C-c C-r") 'ivy-resume)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; counsel-gtags
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)

(with-eval-after-load 'counsel-gtags
  ;; (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
  ;; (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
  ;; (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
  ;; (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward)
  (define-key counsel-gtags-mode-map (kbd "C-c g t") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "C-c g r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "C-c g s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "C-c g b") 'counsel-gtags-go-backward)
  (define-key counsel-gtags-mode-map (kbd "C-c g f") 'counsel-gtags-go-forward)
  (define-key counsel-gtags-mode-map (kbd "C-]") 'counsel-gtags-dwim)
  (define-key counsel-gtags-mode-map (kbd "C-t") 'counsel-gtags-go-backward)
  )



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; Helm
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'helm)
;; (require 'helm-config)
;; 
;; ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;; ;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; ;; (global-unset-key (kbd "C-x c"))
;; 
;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
;; 
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ediff-keep-variants nil)
;;  '(ediff-make-buffers-readonly-at-startup t)
;;  '(ediff-use-last-dir t)
;;  '(frame-background-mode (quote dark))
;;  '(global-linum-mode nil)
;;  '(helm-ff-auto-update-initial-value nil)
;;  '(linum-delay t)
;;  '(linum-eager nil)
;;  '(linum-format "%5d ")
;;  '(package-selected-packages
;;    (quote
;; 	(ac-helm helm-bm helm-migemo migemo package-utils helm-swoop ace-isearch jumplist undo-tree helm-themes helm-gtags magit helm-rtags helm-flycheck helm-elscreen helm-describe-modes helm-descbinds helm-dash helm async helm-c-moccur)))
;;  '(tab-width 4))
;; 
;; ;; (when (executable-find "curl")
;; ;;   (setq helm-google-suggest-use-curl-p t))
;; 
;; ;; (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;; ;;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;; ;;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;; ;;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;; ;;       helm-ff-file-name-history-use-recentf t
;; ;;       helm-echo-input-in-header-line t)
;; 
;; ;; (defun spacemacs//helm-hide-minibuffer-maybe ()
;; ;;   "Hide minibuffer in Helm session if we use the header line as input field."
;; ;;   (when (with-helm-buffer helm-echo-input-in-header-line)
;; ;;     (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
;; ;;       (overlay-put ov 'window (selected-window))
;; ;;       (overlay-put ov 'face
;; ;;                    (let ((bg-color (face-background 'default nil)))
;; ;;                      `(:background ,bg-color :foreground ,bg-color)))
;; ;;       (setq-local cursor-type nil))))
;; 
;; 
;; ;; (add-hook 'helm-minibuffer-set-up-hook
;; ;;           'spacemacs//helm-hide-minibuffer-maybe)
;; 
;; ;; (setq helm-autoresize-max-height 0)
;; ;; (setq helm-autoresize-min-height 20)
;; ;; (helm-autoresize-mode 1)
;; 
;; (helm-mode 1)
;; 
;; ;; Enable helm-gtags-mode
;; ;; (add-hook 'c-mode-hook 'helm-gtags-mode)
;; ;; (add-hook 'c++-mode-hook 'helm-gtags-mode)
;; ;; (add-hook 'asm-mode-hook 'helm-gtags-mode)
;; (add-hook 'c-mode-common-hook 'helm-gtags-mode)
;; 
;; ;; Set key bindings
;; (eval-after-load "helm-gtags"
;;   '(progn
;; 	 (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
;; 	 (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
;; 	 (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
;; 	 (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
;; 	 (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;; 	 (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;; 	 (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;; 	 (define-key helm-gtags-mode-map (kbd "C-c ,") 'helm-gtags-resume)
;; 	 (define-key helm-gtags-mode-map (kbd "C-c f") 'helm-gtags-find-files)
;; 	 (define-key helm-gtags-mode-map (kbd "C-]") 'helm-gtags-dwim)
;; 	 (define-key helm-gtags-mode-map (kbd "C-t") 'helm-gtags-pop-stack)
;; 	 (define-key helm-gtags-mode-map (kbd "C-c t") 'helm-gtags-resume)))
;; ;; end of helm-gtags-mode
;; 
;; 
;; ;; M-x をおきかえ
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; 
;; ;; optional fuzzy matching for helm-M-x
;; (setq helm-M-x-fuzzy-match t)
;; 
;; ;; Kill Ring おきかえ
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; 
;; ;; helm-mini バッファ移動おきかえ
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; 
;; ;; fuzzy matching for helm-mini
;; (setq helm-buffers-fuzzy-matching t
;;       helm-recentf-fuzzy-match    t)
;; 
;; ;; Tab補完を効かせる (効かない。 helm-find-files を使えということらしい)
;; (define-key helm-find-files-map (kbd "<tab>") 'helm-execute-persistent-action)
;; 
;; ;; find-file おきかえ
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; 
;; ;; semantic-mode (関数定義とか変数定義とか探してくれるやつ)
;; (setq helm-semantic-fuzzy-match t
;;       helm-imenu-fuzzy-match    t)
;; 
;; ;; helm-occur
;; (global-set-key (kbd "C-c h o") 'helm-occur)
;; 
;; 
;; 
;; 
;; 
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; helm-swoop
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'helm-swoop)
;; 
;; ;; Change keybinds to whatever you like :)
;; (global-set-key (kbd "M-i") 'helm-swoop)
;; (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
;; (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
;; (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
;; 
;; ;; When doing isearch, hand the word over to helm-swoop
;; (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; 
;; ;; Save buffer when helm-multi-swoop-edit complete
;; (setq helm-multi-swoop-edit-save t)
;; 
;; ;; If this value is t, split window inside the current window
;; (setq helm-swoop-split-with-multiple-windows nil)
;; 
;; ;; Split direction. 'split-window-vertically or 'split-window-horizontally
;; (setq helm-swoop-split-direction 'split-window-vertically)
;; 
;; ;; If nil, you can slightly boost invoke speed in exchange for text color
;; (setq helm-swoop-speed-or-color t)
;; 
;; ;; Go to the opposite side of line from the end or beginning of line
;; (setq helm-swoop-move-to-line-cycle t)
;; 
;; ;; Optional face for line numbers
;; ;; Face name is `helm-swoop-line-number-face`
;; (setq helm-swoop-use-line-number-face t)
;; 
;; 
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; helm-bm
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (global-set-key (kbd "C-c b") 'helm-bm)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; jumplist
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'jumplist)
(global-set-key (kbd "C-<") 'jumplist-previous)
(global-set-key (kbd "C->") 'jumplist-next)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; neotree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<f8>") 'neotree-toggle)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; call external script
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun call-external-script-test0 ()
  (interactive)
  (let* ((cur (point)))
    (message "%d\n" cur)
    (message "%d\n" (+ cur (skip-chars-backward "_A-Za-z0-9_. \t" (bolp))))
    ))

(defun call-external-script-test1 ()
  ;;(interactive "sInput:")
  (interactive)
  (let* ((cur (point))
	 (beg (+ cur (skip-chars-backward "_A-Za-z0-9_. \t" (bolp))))
	 (end (+ beg (skip-chars-forward  "_A-Za-z0-9_. \t" (eolp))))
	 (str (buffer-substring-no-properties beg end))
	 (cmd (concat "~/python/test.py \"" str "\""))
	 )
    (save-excursion
      ;;(message "beg=\"%d\"\nend=\"%d\"\nstring=\"%s\"\n" beg end str)
      (message (shell-command-to-string cmd))
      )))

(defun call-external-script-test ()
  (interactive)
  (let* (cur beg end str cmd)
    (save-excursion
      (setq cur (point))
      (setq beg (+ cur (skip-chars-backward "_A-Za-z0-9_. \t" (bolp))))
      (setq end (+ beg (skip-chars-forward  "_A-Za-z0-9_. \t" (eolp))))
      (setq str (buffer-substring-no-properties beg end))
      (setq cmd (concat "~/python/test.py \"" str "\""))
      ;;(message "beg=\"%d\"\nend=\"%d\"\nstring=\"%s\"\n" beg end str)
      (message (shell-command-to-string cmd))
      )))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto-highlight-symbol.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; python3を使う
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq py-python-command "/usr/bin/python3")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; markdown への出力を有効化する
(require 'ox-md)

;; https://qiita.com/takaxp/items/a5a3383d7358c58240d0
;; スピードコマンド
;;(setq org-use-speed-commands t)

;; http://kenbell.hatenablog.com/entry/20121116/1353072530
;; 画像をインラインで表示
(setq org-startup-with-inline-images t)

;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)

;; LOGBOOK drawerに時間を格納する
(setq org-clock-into-drawer t)

;; .orgファイルは自動的にorg-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; org-default-notes-fileのディレクトリ
(setq org-directory "~/org/")

;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")

;; org-directory内のファイルすべてからagendaを作成する
(setq my-org-agenda-dir "~/org/")
(setq org-agenda-files (list my-org-agenda-dir))

;; TODO状態。 | の右側が未実施で赤く表示される
(setq org-todo-keywords
      '((sequence "TODO(t)" "ONGOING(o)" "WAIT(w)" "NOTE(n)"  "|" "DONE(d)" "SOMEDAY(s)" "CANCEL(c)" "FORWARDING(f)")))

;; よく使う TAG のショートカットを設定する
(setq org-tag-alist '(("org" . ?o) ("idea" . ?i) ("research" . ?r) ("design" . ?d) ("impl" . ?j) ("test" . ?t) ("closing" . ?c)))

;; TAG の右端の位置
(setq org-tags-column -100)


;; DONEの時刻を記録
(setq org-log-done 'time)

;; C-c C-z のメモなどを LOGBOOK ドロワーの中にいれる
(setq org-log-into-drawer t)

;; html 出力したとき validate リンクをつけない。
;;(setq org-export-html-validation-link nil)
(setq org-html-validation-link nil)

;; ショートカットキー
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-col" 'org-store-link)
(global-set-key "\C-coc" 'org-capture)
(global-set-key "\C-coa" 'org-agenda)
(global-set-key "\C-cob" 'org-switchb)

;; capture の設定
(setq org-capture-templates
      '(("t" "Task" entry (file+headline "~/org/notes.org" "Tasks") "* TODO %?\n  %U\n  %a\n  %i")
	("m" "Memo" entry (file+headline "~/org/notes.org" "Memos") "* %?\n  %U\n  %a\n  %i")
	("i" "Idea" entry (file+headline "~/org/notes.org" "Ideas") "* %?\n  %U\n  %a\n  %i")
        ))

;; python3をつかう
(setq org-babel-python-command "python3")

;; Babel で有効化する言語を選択
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ditaa . t)				;ditaa を有効化
   (C . t)				;C/C++/Dを有効化
   (python . t)				;Python を有効化
   ))

;; pictureモードの拡張
;; from http://d.hatena.ne.jp/tamura70/20100125/ditaa
(add-hook 'picture-mode-hook 'picture-mode-init)
(autoload 'picture-mode-init "picture-init")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; org ファイルのはてな記法への変換用
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs起動時にエラーになるのでコメントアウト
;;(require 'ox-hatena)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; customize
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-nonbreakable-space-face ((t (:background "#ccaa8f" :foreground "black"))) t)
 '(diff-file-header ((t (:background "grey60" :foreground "black"))))
 '(diff-header ((t (:background "grey45" :foreground "black"))))
 '(diff-nonexistent ((t (:inherit diff-file-header))))
 '(diff-refine-changed ((t (:background "#aaaa22" :foreground "black"))))
 '(ediff-current-diff-C ((t (:background "#888833" :foreground "black"))))
 '(ediff-even-diff-A ((t (:background "light grey" :foreground "black"))))
 '(ediff-even-diff-Ancestor ((t (:background "Grey" :foreground "black"))))
 '(ediff-even-diff-B ((t (:background "Grey" :foreground "black"))))
 '(ediff-even-diff-C ((t (:background "light grey" :foreground "black"))))
 '(ediff-fine-diff-C ((t (:background "#aaaa22" :foreground "black"))))
 '(ediff-odd-diff-A ((t (:background "Grey" :foreground "black"))))
 '(ediff-odd-diff-B ((t (:background "light grey" :foreground "black"))))
 '(ediff-odd-diff-C ((t (:background "Grey" :foreground "black"))))
 '(font-lock-comment-face ((t (:foreground "#99ee55"))))
 '(helm-buffer-saved-out ((t (:background "grey20" :foreground "brightred"))))
 '(helm-ff-directory ((t (:foreground "color-63"))))
 '(helm-ff-dotted-directory ((t (:background "black" :foreground "cyan"))))
 '(helm-ff-executable ((t (:foreground "brightgreen"))))
 '(helm-ff-invalid-symlink ((t (:background "brightred" :foreground "black"))))
 '(helm-lisp-completion-info ((t (:foreground "brightred"))))
 '(helm-selection ((t (:background "ForestGreen" :foreground "brightwhite"))))
 '(helm-separator ((t (:foreground "brightred"))))
 '(hl-line ((t (:underline t))))
 '(ido-indicator ((t (:background "red" :foreground "yellow1" :width condensed))))
 '(ivy-current-match ((t (:background "#65a7e2" :foreground "brightyellow"))))
 '(ivy-match-required-face ((t (:inherit minibuffer-prompt :foreground "brightred"))))
 '(linum ((t (:background "color-237" :foreground "white"))))
 '(magit-reflog-checkout ((t (:foreground "color-45"))))
 '(magit-reflog-reset ((t (:foreground "color-198"))))
 '(magit-signature-error ((t (:foreground "color-198"))))
 '(pulse-highlight-face ((t (:background "#AAAA33" :foreground "black"))))
 '(pulse-highlight-start-face ((t (:background "#AAAA33" :foreground "black"))))
 '(speedbar-selected-face ((t (:background "gray25" :foreground "brightred" :underline t))))
 '(tool-bar ((t (:background "color-46" :foreground "black" :box (:line-width 1 :style released-button)))))
 '(which-func ((t (:foreground "color-45")))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   (quote
    ((c-mode . "bsd")
     (c++-mode . "bsd")
     (java-mode . "java")
     (awk-mode . "awk"))))
 '(counsel-gtags-auto-update t)
 '(global-linum-mode t)
 '(linum-delay t)
 '(linum-eager nil)
 '(linum-format "%4d ")
 '(package-selected-packages
   (quote
    (htmlize auto-highlight-symbol ag ggtags neotree avy ivy-hydra hydra ivy counsel-etags counsel-gtags counsel-projectile counsel-pydoc counsel undo-tree package-utils magit jumplist helm-themes helm-swoop helm-rtags helm-migemo helm-gtags helm-flycheck helm-elscreen helm-describe-modes helm-descbinds helm-dash helm-c-moccur helm-bm ace-isearch ac-helm))))
