# !/bin/bash
WORKDIR=$(pwd)
CONFIG_DIR="${OSH_CUSTOM:-$HOME/.config/bash}"

cd "$(dirname "$0")"

# Git 最新化
function update() {
	if test -d .git ; then
		git pull origin main || {
			echo "Errer: failure update"
		}
	fi

}

# bin/*.sh を読み込む（エラー処理付き）
function load_settingfile() {
	if [ -d "$CONFIG_DIR/bin" ]; then
	    for file in "$CONFIG_DIR"/bin/*.sh; do
		if [ -f "$file" ]; then
		    if ! source "$file"; then
			echo "⚠️ 読み込み失敗: $file" >&2
		    fi
		fi
	    done
	fi
}

update
load_settingfile

cd $WORKDIR
