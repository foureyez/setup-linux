install_utils() {
  sudo apt install --yes zip unzip 
  sudo apt-get install --yes build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev
}

setup_terminal() {
  sudo apt install --yes kitty
}

setup_git(){
  sudo apt install --yes git
} 

setup_zsh() {
  sudo apt install --yes zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

  # do not run this as root, root will be asked for if required
  sh -c <"$(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)"
}

setup_jackett() {
  cd /opt
  f=Jackett.Binaries.LinuxAMDx64.tar.gz && release=$(wget -q https://github.com/Jackett/Jackett/releases/latest -O - | grep "title>Release" | cut -d " " -f 4) && sudo wget -Nc https://github.com/Jackett/Jackett/releases/download/$release/"$f"
  sudo tar -xzf "$f"
  sudo rm -f "$f"
  cd Jackett*
  sudo ./install_service_systemd.sh
  systemctl status jackett.service 
  cd 
}

setup_neovim() {
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
  sudo rm -rf /opt/nvim
  sudo tar -C /opt -xzf nvim-linux64.tar.gz
  sudo mv nvim-linux64 nvim
  export PATH="$PATH:/opt/nvim/bin" ## This should already be in the .zshrc file which i pull from my github
}

{
  setup_git
  setup_zsh
  setup_terminal
  setup_neovim
  setup_jackett
}
