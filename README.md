## Prereq
```
apt-get update
apt-get install stow curl
```

## Cloning
```
git clone --recurse-submodules https://github.com/esplor/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

## Github cli installation
```
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```

## NVM installation

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
```