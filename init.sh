#!/bin/bash
set -ueo pipefail
shopt -s nullglob

CONFIG_DIR="${OSH_CUSTOM:-$HOME/.config/bash}"

cd "$CONFIG_DIR" || exit 1

# Git 最新化
if [ -d .git ]; then
    git pull origin main || {
        echo "❌ Gitの更新に失敗しました" >&2
        exit 1
    }
else
    echo "❌ $CONFIG_DIR は Git リポジトリではありません" >&2
fi

# bin/*.sh を読み込む（エラー処理付き）
if [ -d "$CONFIG_DIR/bin" ]; then
    for file in "$CONFIG_DIR"/bin/*.sh; do
        if [ -f "$file" ]; then
            if ! source "$file"; then
                echo "⚠️ 読み込み失敗: $file" >&2
            else
                echo "✅ 読み込み成功: $file"
            fi
        fi
    done
fi
