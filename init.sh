#!/bin/bash

CONFIG_DIR="${OSH_CUSTOM:-$HOME/.config/bash}"

cd "$CONFIG_DIR" || exit 1

# Git 最新化
if [ -d .git ]; then
    git pull origin main
else
    echo "❌ $CONFIG_DIR は Git リポジトリではありません"
fi

# bin/*.sh を読み込む
if [ -d "$CONFIG_DIR/bin" ]; then
    for file in "$CONFIG_DIR"/bin/*.sh; do
        [ -f "$file" ] && source "$file"
    done
fi
