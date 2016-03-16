# 補完設定
fpath=(~/dotfiles/zsh/zsh-completions/src $fpath)
autoload -U compinit
compinit

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

# カラーにする
autoload -U colors

# 言語設定
export LANG=ja_JP.UTF-8

# ヒープ音を鳴らさないようにする
setopt nolistbeep
setopt no_beep

## 引数の最大値を大きくする ARG_MAX
autoload zargs

# cd コマンドを素敵に
setopt auto_cd
setopt auto_pushd

# cdの履歴をもった版 cdr コマンドの有効化
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 50
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both


# command correct edition before each completion attempt
setopt correct

# PATH

## add ~/bin to PATH
PATH=$PATH:~/bin

## 「/」も単語区切りとみなす。
WORDCHARS=${WORDCHARS:s,/,,}

# コマンド履歴設定
HISTFILE=~/.zsh_history
## 履歴サイズは潤沢に
HISTSIZE=100000
SAVEHIST=100000
## 重複する履歴は無視する
setopt hist_ignore_dups
## 履歴データを共有する
setopt share_history

## C-p/C-n でコマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Alias

## grep のカラー設定
alias grep='grep --color=auto'
## rm/mvの確認は必須
alias rm='rm -i'
alias mv='mv -i'
## 親ディレクトリへの移動
alias ...='../..'
alias ....='../../..'

# プロンプト設定
# 例
# [shinya@SS-MBP] <2015/02/04 08:05> [master](+)
# $                                               [/Users/shinya/dotfiles]

## set prompt
setopt prompt_subst

## バージョン管理システムモジュールの設定
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
## git コミットしていないファイルがあれば (!) を表示する
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}(!)%f"
## git配下にないファイルがあれば (+) を表示する
zstyle ':vcs_info:git:*' unstagedstr "%F{red}(+)%f"
## 表示フォーマット [ブランチ名](!)(+)
zstyle ':vcs_info:*' formats "%F{green}[%b]%u%c%f"
## マージ/コンフリクトが起こったときのフォーマット [マージ元|マージ先]
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

## コピペしやすいようにコマンド実行後は右プロンプトを消す。
setopt transient_rprompt

PROMPT='[%{'$'\e[''34m%}%n%{'$'\e[''m%}@%{'$'\e[''36m%}%m%{'$'\e[''m%}] <%{%B%}%D{%Y/%m/%d %H:%M}%{%b%}> ${vcs_info_msg_0_} '$'\n%U$%u '
PROMPT2='%{'$'\e[''33m%} > %{'$'\e[''m%}'
RPROMPT='%{'$'\e[''$[31+RANDOM % 7]m%}[%40<...<%/]%b%{'$'\e[''m%}'
SPROMPT='%{'$'\e[''37m%} %r is correct? [n,y,a,e]: %{'$'\e[''m%}'

# OS 個別設定を読み込む
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

