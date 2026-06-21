# Debian Dotfiles

Configuración de dotfiles y escritorio LXDE para Debian, gestionada con GNU Stow.

> [!IMPORTANT]
> Si ya tienes configuraciones existentes, **Stow fallará por conflicto**. Respáldalas de una vez:
>
> ```bash
> for p in .bashrc .bash_aliases .profile .vimrc .nanorc .config/tmux .config/gtk-3.0 .config/openbox .config/pcmanfm .config/lxpanel .config/lxsession .config/lxsession-default-apps .config/lxterminal .config/Mousepad .config/libfm .config/user-dirs.dirs .config/user-dirs.locale .local/share/fonts/JetBrainsMonoNerd; do [ -e "$HOME/$p" ] && mv "$HOME/$p" "$HOME/${p}.bak"; done
> ```

## Requisitos previos

- Debian 12+ (o derivada)

```bash
sudo apt update && sudo apt install -y git wget stow
```

### 1. Desplegar configuraciones con Stow

```bash
git clone https://github.com/angelaltuve/dotfiles_debian.git ~/.dotfiles
cd ~/.dotfiles
stow -t ~ */
```

Después de stowear, refrescar la caché de fuentes:

```bash
fc-cache -fv
```

Para deshacer un package específico:

```bash
stow -D -t ~ openbox
```

Para deshacer todo:

```bash
stow -D -t ~ */
```

### 2. Instalar paquetes

```bash
sudo apt update && sudo apt upgrade -y
xargs sudo apt-get install -y < apt.txt
```

Paquetes clave por dotfile:

| Dotfile | Paquete apt |
|---------|-------------|
| `bash/` | `bash` |
| `vim/` | `vim` |
| `nano/` | `nano` |
| `tmux/` | `tmux` |
| `openbox/` | `openbox`, `obconf` |
| `pcmanfm/` | `pcmanfm` |
| `lxpanel/` | `lxpanel` |
| `lxsession/` | `lxsession`, `lxsession-default-apps` |
| `lxterminal/` | `lxterminal` |
| `mousepad/` | `mousepad` |
| `libfm/` | `libfm4t64` |
| `gtk/` | `lxappearance` |
| `fonts/` | `fontconfig` |
| `user-dirs/` | `xdg-user-dirs` |

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
