# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting'
zplug "plugins/docker", from:oh-my-zsh
zplug 'romkatv/powerlevel10k', as:theme, depth:1

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

# 補完設定 
# fpath=(~/dotfiles/zsh/zsh-completions/src $fpath)
#autoload -Uz compinit
#compinit

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
PATH=/usr/local/sbin:$PATH

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

## zshを再起動する
alias relogin='exec /bin/zsh -l'


# for Prezto
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# OS 個別設定を読み込む
[ -f ~/.zshrc.local ] && source ~/.zshrc.local