#!/bin/bash

install_utils() {
  . /etc/os-release

case $ID in
  ubuntu) 
    sudo apt install --yes zip unzip ripgrep xclip kitty zsh
    sudo apt-get install --yes build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev
    ;;

  arch) 
    echo "Installing arch utils"
    sudo pacman -Sy kitty zsh zip unzip ripgrep xclip wget
    ;;

  centos) 
    ;;

  *) echo "This is an unknown distribution."
      ;;
esac
}

setup_golang() {
  echo "Insalling golang" 
  curl -L -O https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
  ## -L follow redirect
  ## -O write output file name as the remote file name
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf go1.22.3.linux-amd64.tar.gz
  rm go1.22.3.linux-amd64.tar.gz
}

setup_rust() {
  echo "Insalling rust" 
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

setup_python() {
  echo "Insalling python" 
  curl https://pyenv.run | bash
  pyenv install 3.10
  pyenv global 3.10
}

setup_npm() {
  echo "Insalling npm" 
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash 
  export NVM_DIR=$HOME/.config/nvm
  source $NVM_DIR/nvm.sh
  nvm install --lts
  nvm use --lts
}


setup_nvim() {
  echo "Insalling lazygit" 
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin

   curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
   sudo rm -rf /opt/nvim
   sudo tar -C /opt -xzf nvim-linux64.tar.gz
   sudo mv /opt/nvim-linux64 /opt/nvim
   export PATH="$PATH:/opt/nvim/bin" ## This should already be in the .zshrc file which i pull from my github
}

setup_fonts() {
  echo "Installing fonts" 
  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/3270.zip
  unzip 3270.zip -d ~/.local/share/fonts/
  rm 3270.zip

  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
  unzip JetBrainsMono.zip -d ~/.local/share/fonts/
  rm JetBrainsMono.zip
  

  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Terminus.zip
  unzip Terminus.zip -d ~/.local/share/fonts/
  rm Terminus.zip
}

setup_workspace() {
  mkdir ~/workspace
  cd ~/workspace
  git clone git@github.com:foureyez/chitra.git
  git clone git@github.com:foureyez/leetcode.git
  git clone git@github.com:foureyez/requestr.git
  git clone git@github.com:foureyez/animus.git
  git clone git@github.com:foureyez/gofunme.git
  git clone git@github.com:foureyez/learn-rust.git
  git clone git@github.com:foureyez/adventofcode.git
  git clone git@github.com:foureyez/linkbook.git
  cd 
}

{
  install_utils
  setup_fonts
  setup_golang
  setup_python
  setup_npm
  setup_rust
  setup_python
  setup_nvim
  setup_workspace
}
