#!/bin/sh
# Подключает конфиги из репозитория. Повторный запуск безопасен.
set -e
DOT=$(cd "$(dirname "$0")" && pwd)

link() {  # link <файл в репо> <куда>
  mkdir -p "$(dirname "$2")"
  if [ -e "$2" ] && [ ! -L "$2" ]; then mv "$2" "$2.bak"; echo "backup: $2.bak"; fi
  ln -sfn "$DOT/$1" "$2"
  echo "link: $2 -> $DOT/$1"
}

link alacritty/alacritty.toml "$HOME/.config/alacritty/alacritty.toml"

# ~/.zshrc и ~/.gitconfig — локальные файлы (Docker Desktop, рабочий [user]),
# они только подключают общие конфиги
line="source $DOT/zsh/zshrc"
grep -qxF "$line" "$HOME/.zshrc" 2>/dev/null || { printf '\n%s\n' "$line" >> "$HOME/.zshrc"; echo "zshrc: подключён"; }

git config --global --get-all include.path | grep -qxF "$DOT/git/gitconfig" \
  || { git config --global --add include.path "$DOT/git/gitconfig"; echo "gitconfig: подключён"; }

[ "$(uname)" = Darwin ] && "$DOT/macos/defaults.sh"
echo "готово"
