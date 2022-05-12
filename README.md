# .dotfiles

> 个人的 Coding 工作流配置文件。

![示例](https://raw.githubusercontent.com/wlk1204/PicGo-images/main/images/vim.png)

### Get Started

- 一键快速安装

```bash
bash <(curl -sLf https://raw.githubusercontent.com/wlk1204/PicGo-images/main/images/bootstrap.sh)
```

- 手动安装，参考下列 `Step to Install`

### Intro

```bash
.
├── LICENSE
├── README.md
├── nvim                          # neovim 配置
│   ├── coc-settings.json         # coc 配置文件
│   └── init.vim                  # vim 配置
├── tmux
│   ├── .tmux.conf                # tmux 文件，重要勿修改
│   └── .tmux.conf.local          # tmux 自定义配置文件，可修改
└── zsh
    └── .zshrc                    # zsh 配置文件
```

### Step to Install

#### iTerm2

```bash
# brew 方式安装
brew install iterm2
```

#### Tmux

```bash
# 前置条件：git clone https://github.com/wlk1204/.dotfiles.git "$HOME/.dotfiles"

# 1. brew 方式安装
brew install tmux
tmux -V

# 2. 将 .tmux.conf 文件 copy 到 ～/.tmux.conf
ln -s "$HOME/.dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"

# 3. 将 .tmux.conf.local 文件 copy 到 ～/.tmux.conf.local
ln -s "$HOME/.dotfiles/tmux/.tmux.conf.local" "$HOME/.tmux.conf.local"


# 4.1 安装 tmux-plugins
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

# 4.2 tmux session 中执行 <prefix> + I 安装 tmux-plugins
```

#### Zsh

```bash
# 前置条件：git clone https://github.com/wlk1204/.dotfiles.git "$HOME/.dotfiles"

# 1. 安装 zsh，拉取 https://github.com/ohmyzsh/ohmyzsh，如果用 homebrew 安装少了点配置文件
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. 将 .zshrc 文件 copy 到 ～/.zshrc
ln -s "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"

# 3. 安装 zsh 插件

# 3.1 zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 3.2 zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 3.3 autojump
brew install autojump
```

#### Vim

> 这里指 `neovim` 安装方式，不是 `vim8` 。

```bash
# 前置条件：git clone https://github.com/wlk1204/.dotfiles.git "$HOME/.dotfiles"

# 1. brew 方式安装，成功后会生成 ~/.config/nvim 和 ～/.local/share/nvim 文件
brew install neovim
nvim -v

# 2. 安装 neovim 配置
# 2.1 拷贝配置文件，将 nvim 文件 copy 到 ~/.config/nvim
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"

# 2.2 安装 vim-plug，拿到 plug.vim
sh -c 'curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# 3. 安装 vim8 配置
# 3.1 拷贝配置文件，将 init.vim 文件 copy 到 ~/.vimrc
ln -s "$HOME/.dotfiles/nvim/init.vim" "$HOME/.vimrc"

# 3.2 安装 vim-plug，拿到 plug.vim
sh -c 'curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# 4. 执行安装 vim 插件命令
nvim +PlugInstall +qall

# 或 进入到 vim 环境中，执行
:PlugInstall

# 5. 执行安装 coc 插件命令
nvim +"CocInstall coc-git coc-eslint coc-emmet coc-tsserver coc-html coc-prettier coc-vetur" +qall

# 或 进入到 vim 环境中，执行
:CocInstall coc-git coc-eslint coc-emmet coc-tsserver coc-html coc-prettier coc-vetur
```

#### Others

```bash
# 安装 Neovim 下字体
brew tap homebrew/cask-fonts
brew install --cask font-fira-code         # 字体
brew install --cask font-hack-nerd-font    # vim 插件用到的图标

# vim fzf 插件的依赖项
brew install fzf
brew install the_silver_searcher

# tree 工具
brew install tree
```
