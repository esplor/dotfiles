## Prereq
```bash
sudo apt-get update && sudo apt-get install stow curl git
```

## Cloning
```bash
git clone --recurse-submodules https://github.com/esplor/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

### Software

### Oh my zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Github cli (GH)
```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture)] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update && sudo apt install gh
```

### NVM installation
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
```
