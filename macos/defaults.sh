#!/bin/sh
# Настройки macOS для терминала.
set -e

# SF Mono лежит только внутри Terminal.app — делаем доступным другим приложениям
cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SF-Mono-*.otf ~/Library/Fonts/

# Тоньше шрифты в Alacritty (нужен перезапуск Alacritty)
defaults write org.alacritty AppleFontSmoothing -int 0

# terminfo alacritty из бандла приложения
if [ -d /Applications/Alacritty.app/Contents/Resources/61 ]; then
  mkdir -p ~/.terminfo/61
  cp /Applications/Alacritty.app/Contents/Resources/61/* ~/.terminfo/61/
fi

# Профиль Terminal.app: open "macos/Gruvbox Dark.terminal"
