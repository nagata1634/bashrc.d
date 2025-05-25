# alias.sh
alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -o"

if systemd-detect-virt == "none"
    alias nvim="flatpak run io.neovim.nvim"
fi
