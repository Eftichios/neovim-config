# neovim-config
Configuration files for adding various neovim keybinds and plugins - inspired by ThePrimeagen

## Prerequisites
- Curl
- Git
- Python

Instructions:

1. Clone repo into ~/.config/nvim
2. Install latest neovim: https://github.com/neovim/neovim/blob/master/INSTALL.md
3. Install xclip
```bash
sudo apt-get install xclip
```

4. Install node and npm

```bash
sudo apt-get install nodejs
sudo apt-get install npm
```

5. (Optional) - Install nvm to manage node and npm versions

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
```

6. Change the path in dofile in `init.lua` to point to the vim.conf.lua
- TODO: Change this to be dynamic and os independent

7. Install packer and sync plugins:

```bash
# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# sync plugins
cd ~/.config/nvim
nvim .

# go to lua/toncode/packer.lua
# Note: You might have to do this twice if you get an error
:source
:PackerSync
```

8. Install any required language servers
9. Setup tmux and fzf

```bash
sudo apt-get install tmux
sudo apt-get install fzf
```

10. Add terminal keybind for fzf (Clt-F in the terminal opens a directory fuzzy finder that runs tmux in selected directory)

Add the following to ~/.bashrc

```bash
function fzf-tmux() {
  local dir="$(find . -type d | fzf --prompt='Select a directory: ')"
  if [ -n "$dir" ]; then
    tmux new-session -c "$dir"
  fi
}
```

source bashrc

```bash
source ~./bashrc
```

Add the following to ~/.inputrc

```bash
"\C-f": "fzf-tmux\n"
```

Restart the terminal
