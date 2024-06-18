sudo pacman -Sy zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# do not run this as root, root will be asked for if required
bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
git clone git@github.com:foureyez/dotfiles.git $HOME/.local/share/chezmoi
$HOME/.local/bin/chezmoi apply

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

