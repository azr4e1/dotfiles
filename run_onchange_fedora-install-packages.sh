#!/usr/bin/env bash


black="\[\033[30m\]"
cyan="\[\033[36m\]"
purple="\[\033[35m\]"
yellow="\[\033[33m\]"
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"
reset="\e[0m"


echo -e "\n\n\n${green}Installing system requirements...$reset"
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y ripgrep \
                    helix \
                    bat \
                    lazygit \
                    task \
                    timew \
                    syncthing \
                    adw-gtk3-theme \
                    nnn \
                    trash-cli \
                    pipx \
                    golang \
                    nodejs-npm \
                    clang-tools-extra \
                    cargo \
                    gopass \
                    gopass-jsonapi \
                    wget \
                    tmux \
                    jq \
                    podman \
                    hugo \
                    wl-clipboard

echo -e "\n\n\n${green}Installing flatpaks...$reset"
flatpak install -y app.drey.EarTag \
                   app.drey.Warp \
                   com.adrienplazas.Metronome \
                   com.brave.Browser \
                   com.github.finefindus.eyedropper \
                   com.github.johnfactotum.Foliate \
                   com.github.junrrein.PDFSlicer \
                   com.github.marhkb.Pods \
                   com.github.tchx84.Flatseal \
                   com.mattjakeman.ExtensionManager \
                   de.haeckerfelix.Fragments \
                   dev.vencord.Vesktop \
                   io.github.celluloid_player.Celluloid \
                   org.gimp.GIMP \
                   org.gnome.Decibels \
                   org.gnome.Music \
                   org.gnome.seahorse.Application \
                   org.gtk.Gtk3theme.adw-gtk3 \
                   org.gtk.Gtk3theme.adw-gtk3-dark \
                   org.kde.kdenlive \
                   org.mozilla.Thunderbird

echo -e "\n\n\n${green}Installing go binaries...$reset"
go install github.com/azr4e1/venv-notary/vn@latest
go install github.com/azr4e1/ggd/cmd/ggd@latest
go install github.com/azr4e1/polacco@latest
go install github.com/bitfield/gotestdox/cmd/gotestdox@latest

echo -e "\n\n\n${green}Installing lsp services...$reset"
go install golang.org/x/tools/gopls@latest

npm i -g bash-language-server
npm i -g vscode-langservers-extracted
npm install -g dockerfile-language-server-nodejs
npm install -g typescript typescript-language-server

pipx install 'python-lsp-server[all]'

cargo install taplo-cli --locked --features lsp
cargo install --git https://github.com/latex-lsp/texlab --locked --tag v5.22.1

curl -s https://api.github.com/repos/artempyanykh/marksman/releases/latest | grep "browser_download_url" | grep "linux-x64" | cut -d : -f 2,3 | tr -d \" | wget -qi -
chmod +x ~/marksman-linux-x64
mv -f ~/marksman-linux-x64 ~/.local/bin/marksman

echo -e "\n\n\n${green}Installing prompt...$reset"
curl -sS https://starship.rs/install.sh | sh

