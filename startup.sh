#!/usr/bin/bash

nvim="nvim-linux64"

nvim_downloader() {
  curl -LOs https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  tar -xf nvim-linux64.tar.gz
}

# -o same as ||
if [ -d ~/descargas/ ] || [ -d ~/downloads/ ]; then
  cd ~/descargas/ || cd ~/downloads/ || exit 1
else
  echo "Create a donwload path at '~/descargas/' or '~/downloads'"
  exit 1
fi

nvim_downloader
echo "nvim downloaded in: $(pwd). Installing..."

mkdir -p ~/.local/bin/
mv $nvim "nvim"
chmod 700 "nvim/bin/nvim"
mv "nvim" ~/.local/
cd ~/.local/bin/ || exit 1
ln -s ~/.local/nvim/bin/nvim nvim

echo "Moved nvim binary to ~/.local/nvim/ and add symbolic link to ~/.local/bin/nvim"
echo "Add to this directory to path or copy the following command: "
echo "export PATH=$PATH:~/.local/bin"
echo "You can also add an alias in your configuration"
