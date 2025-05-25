# alias.sh
alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -o"

# git
alias l=" pull"
alias h=" push"
alias checkout="checkout develop"


if systemd-detect-virt -q; then
    # 仮想環境下の変数設定をここに書く
    echo "仮想環境です"
else
    # 物理環境下の設定
    echo "物理環境です"
    alias to="toolbox enter"
fi

