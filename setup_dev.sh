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
  source ~/.zshrc
  nvm install --lts
  nvm use --lts
}

setup_nvim() {
  echo "Insalling lazygit" 
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
}

setup_fonts() {
  echo "Installing fonts" 
  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/3270.zip
  unzip 3270.zip -d ~/.local/share/fonts/

  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
  unzip JetbrainsMono.zip -d ~/.local/share/fonts/
  

  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Terminus.zip
  unzip Terminus.zip -d ~/.local/share/fonts/
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
  cd 
}

{
  setup_fonts
  setup_golang
  setup_rust
  setup_python
  setup_nvim
}
