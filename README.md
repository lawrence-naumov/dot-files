# dotfiles

Alacritty, zsh, git. Тема — gruvbox dark. tmux — отдельный репозиторий `../tmux`.

    ./install.sh

- `alacritty/alacritty.toml` — симлинк в `~/.config/alacritty/`
- `zsh/zshrc` — подключается из `~/.zshrc` через `source`
- `git/gitconfig` — подключается из `~/.gitconfig` через `[include]`;
  `[user]` (рабочий аккаунт) остаётся только в локальном `~/.gitconfig`
- `macos/` — SF Mono, сглаживание шрифтов, terminfo, профиль Terminal.app
