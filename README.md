# dotfiles
Dot files of Tools for coding.



### 安装 iTerm2
```bash
# 安装
brew install iterm2
```



### 安装 zsh

```bash
# 1. 拉取 https://github.com/ohmyzsh/ohmyzsh，如果用 homebrew 安装少了点配置文件
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. 生成 .zshrc 后拷贝自己的 .zshrc 覆盖
```



### 安装 zsh 插件

```bash
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```



### 安装 Neovim
```bash
# 1. 安装 neovim
brew install neovim
nvim -v

# 成功后会生成 ~/.config/nvim 和 ～/.local/share/nvim 文件

# 2. 安装 vim-plug (https://github.com/junegunn/vim-plug)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# 成功后会在此路径下生成 plug.vim 文件 ～/.local/share/nvim/site/autoload/plug.vim

# 3. 将 nvim 下 init.vim 和 coc-setting.json 文件 copy 到 ~/.config/nvim 下，终端输入 nvim 会自动安装
nvim
```



### 安装 Neovim 下字体

```bash
# https://github.com/tonsky/FiraCode/wiki/Installing（程序员字体）
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# https://github.com/ryanoasis/nerd-fonts（vim 插件用到的图标）
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```



### 安装 tmux
```bash
# 1. 安装
brew install tmux
tmux -V

# 2. 将 tmux 下 .tmux.conf 文件 copy 到 ～/.tmux.conf 路径下
```
