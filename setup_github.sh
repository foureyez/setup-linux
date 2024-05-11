ssh-keygen -t ed25519 -C "abhirawat1304@gmail.com" -f ~/.ssh/github_key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_key
# ssh-add -t 0 ~/.ssh/github_key # Works for WSL Ubuntu
cat > ~/.ssh/config << EOF
Host *
  AddKeysToAgent yes
  # UseKeychain yes #only for mac 
  IdentityFile ~/.ssh/github_key.pub
EOF

xclip -sel clip < ~/.ssh/github_key.pub

cat > ~/.gitconfig << EOF
[user]
email = abhirawat1304@gmail.com
name = Abhijeet Rawat
 
[github]
user = "foureyez"
 
[core]
sshCommand = "ssh -i ~/.ssh/github_key"
EOF
