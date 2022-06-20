#!/bin/bash


# ---------------------------------------------------------
# bootstrap.sh --- bootstrap script to install dotfiles.
# This is the wanglk`s Coding config.
# ---------------------------------------------------------


# Init
Color_off='\033[0m'       # Text Reset
Version='1.0.0'
Email='wlk90god@gmail.com'

# Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

echo_with_color () {
  printf '%b\n' "$1$2$Color_off" >&2
}

msg() {
  printf '%b\n' "$1" >&2
}

info() {
  msg "${Blue}[➭]${Color_off} ${1}${2}"
}

success() {
  msg "${Green}[✔]${Color_off} ${1}${2}"
}

error() {
  msg "${Red}[✘]${Color_off} ${1}${2}"
  exit 1
}

happy() {
  msg "\n${Green}> Happy to ${1}. 😄${Color_off}\n"
  exit 1
}

# brew 安装程序
brew_cask_install() {
  info "开始安装 $1..."
  if [ -n "$(brew ls | grep $1)" ]
  then
    success "Checking: $1 已存在."
  else
    if [[ $2 && $2 = "cask" ]]
    then
      bash -c "brew install --cask $1"
    else
      bash -c "brew install $1"
    fi
    success "Successfully install $1."
  fi
}

welcome() {
  echo_with_color ${Blue} "                                                     /## /##                  "
  echo_with_color ${Blue} "                                                    | ##| ##                  "
  echo_with_color ${Blue} "         /##  /##  /##  /######  /#######   /###### | ##| ##   /##            "
  echo_with_color ${Blue} "        | ## | ## | ## |____  ##| ##__  ## /##__  ##| ##| ##  /##/            "
  echo_with_color ${Blue} "        | ## | ## | ##  /#######| ##  \ ##| ##  \ ##| ##| ######/             "
  echo_with_color ${Blue} "        | ## | ## | ## /##__  ##| ##  | ##| ##  | ##| ##| ##_  ##             "
  echo_with_color ${Blue} "        |  #####/####/|  #######| ##  | ##|  #######| ##| ## \  ##            "
  echo_with_color ${Blue} "         \_____/\___/  \_______/|__/  |__/ \____  ##|__/|__/  \__/            "
  echo_with_color ${Blue} "                                           /##  \ ##                          "
  echo_with_color ${Blue} "                                          |  ######/                          "
  echo_with_color ${Blue} "                                           \______/                           "
  echo_with_color ${Blue} "                                                                              "
  echo_with_color ${Blue} "                Version: ${Version}  by : ${Email} \n                         "
}

# fetch 仓库
fetch_repo() {
  if [ -d "$HOME/.dotfiles" ]
  then
    info "Trying to update .dotfiles"
    cd "$HOME/.dotfiles"
    git pull
    cd - > /dev/null 2>&1
    success "Successfully update dotfiles"
  else
    info "Trying to clone dotfiles..."
    git clone https://github.com/wlk1204/.dotfiles.git "$HOME/.dotfiles"
    if [ $? -eq 0 ]
    then
      success "Successfully clone dotfiles."
    else
      error "Failed to clone dotfiles."
      exit 0
    fi
  fi
}

# 安装 tmux
install_tmux() {
  if hash "tmux" &>/dev/null
  then
    success "Checking: tmux is exist."
  else
    info "开始安装 tmux"
    bash -c "brew install tmux"
    if [ $? -eq 0 ]
    then
      if hash "tmux" &>/dev/null
      then

        if [ ! -e "$HOME/.tmux.conf" ]
        then
          ln -s "$HOME/.dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
        fi

        if [ ! -e "$HOME/.tmux.conf.local" ]
        then
          ln -s "$HOME/.dotfiles/tmux/.tmux.conf.local" "$HOME/.tmux.conf.local"
        fi

        success "Successfully install tmux."
      fi
    else
      error "Failed to install tmux."
      exit 0
    fi
  fi

  # 自动安装 tmux-plugins
  if [ -e "$HOME/.tmux/plugins/tpm" ]
  then
    success "Checking: tmux-plugins/tpm exist."
  else
    info "Trying to clone tmux-plugins ..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    if [ $? -eq 0 ]
    then
      success "Successfully clone tmux-plugins/tpm."
    else
      error "Failed to clone tmux-plugins/tpm."
      exit 0
    fi
    # TODO: 插件无法自动安装，需手动 <prefix> + I
    # tmux send-keys -t 0 'cd project/dotfiles' C-m
    success "Successfully install tmux-plugins/tpm."
  fi

  happy "tmux"
}

# 安装 vim
install_vim() {
  if hash "nvim" &>/dev/null
  then
    success "Checking: neovim is exist."
  else
    info "开始安装 neovim"
    bash -c "brew install neovim"
    if [ $? -eq 0 ]
    then
      if hash "nvim" &>/dev/null
      then

        if [ ! -e "$HOME/.config.nvim" ]
        then
          ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
        fi

        if [ ! -e "$HOME/.vimrc" ]
        then
          ln -s "$HOME/.dotfiles/nvim/init.vim" "$HOME/.vimrc"
        fi

        if [ ! -e "$HOME/.local/share/nvim/site/autoload/plug.vim" ]
        then
          bash -c "sh -c 'curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
        fi

        if [ ! -e "$HOME/.vim/autoload/plug.vim" ]
        then
          bash -c "sh -c 'curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
        fi

        success "Successfully install neovim."
      fi
    else
      error "Failed to install neovim."
      exit 0
    fi
  fi

  # 自动安装 vim plugins
  info "开始安装 vim plugins..."
  bash -c "nvim +PlugInstall +qall"
  success "Successfully install vim plugins."

  # 自动安装 coc plugins
  info "开始安装 coc plugins..."
  bash -c 'nvim +"CocInstall coc-git coc-eslint coc-emmet coc-tsserver coc-html coc-prettier coc-vetur" +qall'
  success "Successfully install coc plugins."

  # 自动安装字体
  bash -c "brew tap homebrew/cask-fonts"
  brew_cask_install "font-fira-code" "cask"
  brew_cask_install "font-hack-nerd-font" "cask"
  brew_cask_install "fzf"
  brew_cask_install "the_silver_searcher"

  happy "nvim"
}

# 安装 zsh
install_zsh() {
  echo "开始安装 zsh"
  echo "命令未开放，下次再来😄"
}

install_all() {
  install_tmux
  install_vim
}

need_cmd() {
  if ! hash "$1" &>/dev/null; then
    error "Need '$1' (command not found)"
    exit 1
  fi
}

install() {
  echo "请选择要安装的程序:"
  app_list=("vim" "tmux" "zsh" "all of the above")
  app_index_arr=${!app_list[@]}

  for i in $app_index_arr
  do
    echo "($i): ${app_list[$i]}"
  done
  echo "请输入序号: \c"

  read APP

  fetch_repo

  case ${app_list[APP]} in
    tmux)
      install_tmux
      exit 0
      ;;
    vim)
      install_vim
      exit 0
      ;;
    zsh)
      install_zsh
      exit 0
      ;;
    "all of the above")
      install_all
      exit 0
      ;;
  esac
}

main() {
  if [ $# -gt 0 ]
  then
    case $1 in
      --version|-v)
        msg "${Version}"
        exit 0
    esac
  else
    welcome
    need_cmd 'git'
    need_cmd 'brew'
    install
  fi
}

main

