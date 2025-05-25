# asdf.sh

ASDF_DATA_DIR="$HOME/.config/asdf"

# ディレクトリがなければ作成
if [ ! -d "$ASDF_DATA_DIR" ]; then
  mkdir -p "$ASDF_DATA_DIR"
fi

export ASDF_DATA_DIR

export PATH="$ASDF_DATA_DIR/shims:$PATH"

# asdf コマンドがあれば補完を読み込む
if command -v asdf >/dev/null 2>&1; then
  . <(asdf completion bash)
fi
