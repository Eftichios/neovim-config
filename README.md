# neovim-config
Configuration files for adding various neovim keybinds and plugins - inspired by ThePrimeagen

Steps:

1. Clone repo into ~/.config/nvim
2. Install latest neovim:

```lua
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```

3. Install node and npm

```lua
sudo apt-get install nodejs
sudo apt-get install npm
```

4. (Optional) - Install nvm to manage node and npm versions

```lua
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
```

5. Change the path in dofile in `init.lua` to point to the vim.conf.lua
- TODO: Change this to be dynamic and os independent

6. Install packer and sync plugins:

```bash
# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# sync plugins
cd ~/.config/nvim
nvim .

# go to lua/toncode/packer.lua
:source
:PackerSync
```

7. Install any required language servers
8. Setup tmux and fzf :

```bash
sudo apt-get install tmux
sudo apt-get install fzf
```

9. Add terminal keybind for fzf (Clt-F in the terminal opens a directory fuzzy finder that runs tmux in selected directory)

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
