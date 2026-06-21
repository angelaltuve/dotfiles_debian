# Debian Dotfiles

Configuración de dotfiles y escritorio LXDE para Debian, gestionada con GNU Stow.

## Requisitos previos

- Debian 12+ (o derivada)
- `stow` — `sudo apt install -y stow`
- `git`

## Inicio rápido

```bash
git clone https://github.com/angelaltuve/dotfiles_debian.git dotfiles
cd dotfiles
```

### 1. Desplegar configuraciones con Stow

Stow crea enlaces simbólicos desde el repo hacia tu `$HOME`. Cada programa tiene su propio package.

```bash
# Individualmente:
stow -t ~ bash         # .bashrc, .bash_aliases, .profile
stow -t ~ vim          # .vimrc
stow -t ~ nano         # .nanorc
stow -t ~ tmux         # ~/.config/tmux/tmux.conf
stow -t ~ gtk          # ~/.config/gtk-3.0/
stow -t ~ openbox      # ~/.config/openbox/
stow -t ~ pcmanfm      # ~/.config/pcmanfm/
stow -t ~ lxpanel      # ~/.config/lxpanel/
stow -t ~ lxsession    # ~/.config/lxsession/ + lxsession-default-apps/
stow -t ~ lxterminal   # ~/.config/lxterminal/
stow -t ~ mousepad     # ~/.config/Mousepad/
stow -t ~ libfm        # ~/.config/libfm/
stow -t ~ user-dirs    # ~/.config/user-dirs.dirs + user-dirs.locale
stow -t ~ fonts        # ~/.local/share/fonts/JetBrainsMonoNerd

# Todo de una vez:
stow -t ~ */

# Deshacer:
stow -D -t ~ openbox
```

Después de stowear las fuentes, refrescar la caché:

```bash
fc-cache -fv
```

### 2. Instalar paquetes

```bash
sudo apt update && sudo apt upgrade -y
xargs sudo apt-get install -y < apt.txt
```

> **Nota:** `fonts/` contiene JetBrainsMono Nerd Font (~63 archivos `.ttf`). Si no los necesitas, simplemente omite `stow -t ~ fonts`.

## Estructura del directorio

```
dotfiles/
├── .stowrc              — reglas para ignorar README, imágenes, apt.txt
├── apt.txt              — lista completa de paquetes (1645)
├── bash/     → ~/.bashrc, .bash_aliases, .profile
├── vim/      → ~/.vimrc
├── nano/     → ~/.nanorc
├── tmux/     → ~/.config/tmux/tmux.conf
├── gtk/      → ~/.config/gtk-3.0/
├── openbox/  → ~/.config/openbox/
├── pcmanfm/  → ~/.config/pcmanfm/
├── lxpanel/  → ~/.config/lxpanel/
├── lxsession/ → ~/.config/lxsession/ + lxsession-default-apps/
├── lxterminal/ → ~/.config/lxterminal/
├── mousepad/ → ~/.config/Mousepad/
├── libfm/    → ~/.config/libfm/
├── user-dirs/ → ~/.config/user-dirs.dirs + user-dirs.locale
└── fonts/    → ~/.local/share/fonts/JetBrainsMonoNerd
```
